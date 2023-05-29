import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:filter101/data/comment.dart';
import 'package:filter101/data/post.dart';
import 'package:filter101/network/reddit_service.dart';
import 'package:filter101/network/secure_storage.dart';
import 'package:filter101/utils/classifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'search_bloc.freezed.dart';
part 'search_event.dart';
part 'search_state.dart';

@lazySingleton
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final Classifier _classifier;
  String? _subredditName;
  int _nrTextsAnalyzed = 200;
  final Map<String, bool> _selectedCategories = {
    'hateSpeech': false,
    'negativeContent': false,
    'humor': false,
    'positiveContent': false,
    'sarcasmExcluding': false,
    'sarcasmIncluding': false,
  };
  final Map<String, int> categoryCounts = {
    'hateSpeech': 0,
    'negativeContent': 0,
    'humor': 0,
    'positiveContent': 0,
    'sarcasmExcluding': 0,
    'sarcasmIncluding': 0,
  };
  final Map<String, int> predictedTextsTotal = {
    'hateSpeech': 0,
    'negativeContent': 0,
    'humor': 0,
    'positiveContent': 0,
    'sarcasmExcluding': 0,
    'sarcasmIncluding': 0,
  };

  SearchBloc()
      : _classifier = Classifier(),
        super(const SearchState.initial()) {
    on<SearchEvent>(_onEvent);
    _loadSelectedCategories();
  }

  String? get subredditName => _subredditName;
  int get nrTextsAnalyzed => _nrTextsAnalyzed;
  set nrTextsAnalyzed(int value) {
    _nrTextsAnalyzed = value;
  }

  Map<String, bool> get selectedCategories => Map.from(_selectedCategories);
  void _loadSelectedCategories() async {
    final SecureStorage _secureStorage = SecureStorage();
    final Map<String, bool>? storedCategories =
        await _secureStorage.getBoolMap();
    if (storedCategories != null) {
      _selectedCategories.addAll(storedCategories);
      print(_selectedCategories);
    }
  }

  void changeSubreddit(String subreddit) {
    add(SearchEvent.changeSubreddit(subreddit: subreddit));
  }

  Future<void> _onEvent(SearchEvent event, Emitter<SearchState> emit) async {
    await event.when(
      fetchData: (String subredditName) =>
          _mapFetchDataEvent(subredditName, emit),
      selectCategory: (String category, bool selected) =>
          _mapSelectCategoryEvent(category, selected, emit),
      changeSubreddit: (String subreddit) =>
          _mapChangeSubredditEvent(subreddit),
      fetchInitialData: () => _mapFetchInitialDataEvent(emit),
    );
  }

  _mapFetchInitialDataEvent(Emitter<SearchState> emit) {
    emit(SearchState.loading());
    _loadSelectedCategories();
    emit(SearchState.loaded(
      selectedCategories: _selectedCategories,
    ));
  }

  _mapFetchDataEvent(String subredditName, Emitter<SearchState> emit) async {
    emit(SearchState.loading());

    if (subredditName.isEmpty) {
      emit(const SearchState.error());
      return;
    }

    final List<RedditPost> fetchedPosts =
        await RedditService.fetchPosts(subredditName);

    final List<RedditPost> processedPosts = [];

    for (var post in fetchedPosts) {
      final List<RedditComment> comments =
          await RedditService.fetchComments(post.permalink);
      post.comments = comments;

      // Classify post
      // classifyContent(post.selfText, categoryCounts);

      // Classify comments
      for (var comment in comments) {
        classifyContent(comment.body, categoryCounts, nrTextsAnalyzed);
      }

      processedPosts.add(post);
    }

    final Map<String, double> probabilities =
        calculateProbabilities(categoryCounts);

    emit(SearchState.loaded(
      posts: processedPosts,
      probabilities: probabilities,
    ));
  }

  _mapSelectCategoryEvent(
      String category, bool selected, Emitter<SearchState> emit) {
    _selectedCategories[category] = selected;

    emit(SearchState.loaded(
      selectedCategories: _selectedCategories,
    ));
    // add(SearchEvent.selectCategory(category: category, selected: selected));
  }

  _mapChangeSubredditEvent(String subreddit) {
    _subredditName = subreddit;
    print('Subreddit Name bloc: $_subredditName');

    add(SearchEvent.fetchData(_subredditName!));
  }

  void classifyContent(
      String text, Map<String, int> categoryCounts, int nrTextsAnalyzed) async {
    if (_selectedCategories['hateSpeech']! &&
        predictedTextsTotal['hateSpeech']! < nrTextsAnalyzed) {
      final prediction = await _classifier.classify(text, 'hate');
      print(prediction);
      if (prediction != null && prediction.length >= 2) {
        if (prediction[0].score > prediction[1].score) {
          categoryCounts['hateSpeech'] = categoryCounts['hateSpeech']! + 1;
        }
        predictedTextsTotal['hateSpeech'] =
            predictedTextsTotal['hateSpeech']! + 1;
      }
    }

    if (_selectedCategories['negativeContent']! &&
        predictedTextsTotal['negativeContent']! < nrTextsAnalyzed) {
      final prediction = await _classifier.classify(text, 'emotion');
      print(prediction);
      if (prediction != null && prediction.length >= 2) {
        if (prediction[0].score > prediction[1].score) {
          categoryCounts['negativeContent'] =
              categoryCounts['negativeContent']! + 1;
        }
        predictedTextsTotal['negativeContent'] =
            predictedTextsTotal['negativeContent']! + 1;
      }
    }

    if (_selectedCategories['humor']! &&
        predictedTextsTotal['humor']! < nrTextsAnalyzed) {
      final prediction = await _classifier.classify(text, 'humor');
      print(prediction);
      if (prediction != null && prediction.length >= 2) {
        if (prediction[1].score > prediction[0].score) {
          categoryCounts['humor'] = categoryCounts['humor']! + 1;
        }
        predictedTextsTotal['humor'] = predictedTextsTotal['humor']! + 1;
      }
    }

    if (_selectedCategories['positiveContent']! &&
        predictedTextsTotal['positiveContent']! < nrTextsAnalyzed) {
      final prediction = await _classifier.classify(text, 'emotion');
      print(prediction);
      if (prediction != null && prediction.length >= 2) {
        if (prediction[1].score > prediction[0].score) {
          categoryCounts['positiveContent'] =
              categoryCounts['positiveContent']! + 1;
        }
        predictedTextsTotal['positiveContent'] =
            predictedTextsTotal['positiveContent']! + 1;
      }
    }

    if (_selectedCategories['sarcasmExcluding']! &&
        predictedTextsTotal['sarcasmExcluding']! < nrTextsAnalyzed) {
      final prediction = await _classifier.classify(text, 'sarcasm');
      print(prediction);
      if (prediction != null && prediction.length >= 2) {
        if (prediction[0].score > prediction[1].score) {
          categoryCounts['sarcasmExcluding'] =
              categoryCounts['sarcasmExcluding']! + 1;
        }
        predictedTextsTotal['sarcasmExcluding'] =
            predictedTextsTotal['sarcasmExcluding']! + 1;
      }
    }

    if (_selectedCategories['sarcasmIncluding']! &&
        predictedTextsTotal['sarcasmIncluding']! < nrTextsAnalyzed) {
      final prediction = await _classifier.classify(text, 'sarcasm');
      print(prediction);
      if (prediction != null && prediction.length >= 2) {
        if (prediction[1].score > prediction[0].score) {
          categoryCounts['sarcasmIncluding'] =
              categoryCounts['sarcasmIncluding']! + 1;
        }
        predictedTextsTotal['sarcasmIncluding'] =
            predictedTextsTotal['sarcasmIncluding']! + 1;
      }
    }
  }

  Map<String, double> calculateProbabilities(Map<String, int> categoryCounts) {
    final Map<String, double> probabilities = {};

    // int totalTexts = categoryCounts.values.reduce((sum, count) => sum + count);

    for (var entry in categoryCounts.entries) {
      String category = entry.key;
      int count = entry.value;
      int totalTexts = predictedTextsTotal[category] ?? 0;

      double probability = count.toDouble() / totalTexts.toDouble();
      probabilities[category] = probability;
    }

    return probabilities;
  }
}
