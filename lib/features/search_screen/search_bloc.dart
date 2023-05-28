// import 'dart:async';
// import 'package:bloc/bloc.dart';
// import 'package:filter101/data/comment.dart';
// import 'package:filter101/data/post.dart';
// import 'package:filter101/network/reddit_service.dart';
// import 'package:filter101/utils/classifier.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:injectable/injectable.dart';

// part 'search_bloc.freezed.dart';
// part 'search_event.dart';
// part 'search_state.dart';

// @lazySingleton
// class SearchBloc extends Bloc<SearchEvent, SearchState> {
//   final Classifier _classifier;
//   String? _subredditName;
//   final Map<String, bool> _selectedCategories = {
//     'hateSpeech': false,
//     'negativeContent': false,
//     'humor': false,
//     'positiveContent': false,
//     'sarcasmExcluding': false,
//     'sarcasmIncluding': false,
//   };

//   SearchBloc()
//       : _classifier = Classifier(),
//         super(const SearchState.initial());

//   String? get subredditName => _subredditName;

//   set subredditName(String? value) {
//     _subredditName = value;
//     // add(SearchEvent.fetchData(value!));
//     add(FetchDataEvent(value!));
//   }

//   @override
//   Stream<SearchState> mapEventToState(SearchEvent event) async* {
//     yield* event.map(
//       fetchData: (FetchDataEvent event) async* {
//         yield const SearchState.loading();

//         if (_subredditName == null) {
//           yield const SearchState.error();
//           return;
//         }

//         final List<RedditPost> fetchedPosts =
//             await RedditService.fetchPosts(_subredditName!, 10);

//         final List<RedditPost> processedPosts = [];
//         final Map<String, int> categoryCounts = {
//           'hateSpeech': 0,
//           'negativeContent': 0,
//           'humor': 0,
//           'positiveContent': 0,
//           'sarcasmExcluding': 0,
//           'sarcasmIncluding': 0,
//         };

//         for (var post in fetchedPosts) {
//           final List<RedditComment> comments =
//               await RedditService.fetchComments(post.permalink, 10);
//           post.comments = comments;

//           // Classify post
//           classifyContent(post.title, categoryCounts);

//           // Classify comments
//           for (var comment in comments) {
//             classifyContent(comment.body, categoryCounts);
//           }

//           processedPosts.add(post);
//         }

//         final Map<String, double> probabilities =
//             calculateProbabilities(categoryCounts);

//         yield SearchState.loaded(
//           posts: processedPosts,
//           probabilities: probabilities,
//         );
//       },
//       selectCategory: (SelectCategoryEvent event) async* {
//         _selectedCategories[event.category] = event.selected;
//         yield* mapEventToState(SearchEvent.fetchData(_subredditName!));
//       },
//       changeSubreddit: (ChangeSubredditEvent event) async* {
//         _subredditName = event.subreddit;
//         yield* mapEventToState(SearchEvent.fetchData(_subredditName!));
//       },
//     );
//   }

//   void classifyContent(String text, Map<String, int> categoryCounts) async {
//     if (_selectedCategories['hateSpeech']!) {
//       final prediction = await _classifier.classify(text, 'hate');
//       if (prediction[1].score > prediction[0].score) {
//         categoryCounts['hateSpeech'] = categoryCounts['hateSpeech']! + 1;
//       }
//     }

//     if (_selectedCategories['negativeContent']!) {
//       // Classify for negative content
//       // ...
//     }

//     if (_selectedCategories['humor']!) {
//       // Classify for humor
//       // ...
//     }

//     if (_selectedCategories['positiveContent']!) {
//       // Classify for positive content
//       // ...
//     }

//     if (_selectedCategories['sarcasmExcluding']!) {
//       // Classify for sarcasm excluding
//       // ...
//     }

//     if (_selectedCategories['sarcasmIncluding']!) {
//       // Classify for sarcasm including
//       // ...
//     }
//   }

//   Map<String, double> calculateProbabilities(Map<String, int> categoryCounts) {
//     final Map<String, double> probabilities = {};

//     // Calculate probabilities based on categoryCounts
//     // ...

//     return probabilities;
//   }
// }

// ----------------------------------

// SearchBloc(this._classifier) : super(const SearchState.initial()) {
//   on<SearchEvent>(_onEvent);
// }

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:filter101/data/comment.dart';
import 'package:filter101/data/post.dart';
import 'package:filter101/network/reddit_service.dart';
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
  final Map<String, bool> _selectedCategories = {
    'hateSpeech': false,
    'negativeContent': false,
    'humor': false,
    'positiveContent': false,
    'sarcasmExcluding': false,
    'sarcasmIncluding': false,
  };

  SearchBloc()
      : _classifier = Classifier(),
        super(const SearchState.initial()) {
    on<SearchEvent>(_onEvent);
  }

  String? get subredditName => _subredditName;
  Map<String, bool> get selectedCategories => Map.from(_selectedCategories);

  void changeSubreddit(String subreddit) {
    add(SearchEvent.changeSubreddit(subreddit: subreddit));
  }

  Future<void> _onEvent(SearchEvent event, Emitter<SearchState> emit) async {
    await event.when(
      fetchData: (String subredditName) => _mapFetchDataEvent(subredditName),
      selectCategory: (String category, bool selected) =>
          _mapSelectCategoryEvent(category, selected, emit),
      changeSubreddit: (String subreddit) =>
          _mapChangeSubredditEvent(subreddit),
    );
  }

  Stream<SearchState> _mapFetchDataEvent(String subredditName) async* {
    yield const SearchState.loading();

    if (subredditName.isEmpty) {
      yield const SearchState.error();
      return;
    }

    final List<RedditPost> fetchedPosts =
        await RedditService.fetchPosts(subredditName, 10);

    final List<RedditPost> processedPosts = [];
    final Map<String, int> categoryCounts = {
      'hateSpeech': 0,
      'negativeContent': 0,
      'humor': 0,
      'positiveContent': 0,
      'sarcasmExcluding': 0,
      'sarcasmIncluding': 0,
    };

    for (var post in fetchedPosts) {
      final List<RedditComment> comments =
          await RedditService.fetchComments(post.permalink, 10);
      post.comments = comments;

      // Classify post
      classifyContent(post.title, categoryCounts);

      // Classify comments
      for (var comment in comments) {
        classifyContent(comment.body, categoryCounts);
      }

      processedPosts.add(post);
    }

    final Map<String, double> probabilities =
        calculateProbabilities(categoryCounts);

    yield SearchState.loaded(
      posts: processedPosts,
      probabilities: probabilities,
    );
  }

  // _mapSelectCategoryEvent(String category, bool selected) {
  //   _selectedCategories[category] = selected;
  //   _mapFetchDataEvent(_subredditName ?? '');
  //   add(SearchEvent.selectCategory(category: category, selected: selected));
  // }

  _mapSelectCategoryEvent(
      String category, bool selected, Emitter<SearchState> emit) {
    // final updatedCategories = Map<String, bool>.from(_selectedCategories);
    // updatedCategories[category] = selected;
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

  void classifyContent(String text, Map<String, int> categoryCounts) async {
    if (_selectedCategories['hateSpeech']!) {
      final prediction = await _classifier.classify(text, 'hate');
      if (prediction[1].score > prediction[0].score) {
        categoryCounts['hateSpeech'] = categoryCounts['hateSpeech']! + 1;
      }
    }

    if (_selectedCategories['negativeContent']!) {
      final prediction = await _classifier.classify(text, 'emotion');
      if (prediction[0].score > prediction[1].score) {
        categoryCounts['negativeContent'] =
            categoryCounts['negativeContent']! + 1;
      }
    }

    if (_selectedCategories['humor']!) {
      final prediction = await _classifier.classify(text, 'humor');
      if (prediction[1].score > prediction[0].score) {
        categoryCounts['humor'] = categoryCounts['humor']! + 1;
      }
    }

    if (_selectedCategories['positiveContent']!) {
      final prediction = await _classifier.classify(text, 'emotion');
      if (prediction[1].score > prediction[0].score) {
        categoryCounts['positiveContent'] =
            categoryCounts['positiveContent']! + 1;
      }
    }

    if (_selectedCategories['sarcasmExcluding']!) {
      final prediction = await _classifier.classify(text, 'sarcasm');
      if (prediction[0].score > prediction[1].score) {
        categoryCounts['sarcasmExcluding'] =
            categoryCounts['sarcasmExcluding']! + 1;
      }
    }

    if (_selectedCategories['sarcasmIncluding']!) {
      final prediction = await _classifier.classify(text, 'sarcasm');
      if (prediction[1].score > prediction[0].score) {
        categoryCounts['sarcasmIncluding'] =
            categoryCounts['sarcasmIncluding']! + 1;
      }
    }
  }

  Map<String, double> calculateProbabilities(Map<String, int> categoryCounts) {
    final Map<String, double> probabilities = {};

    int totalTexts = categoryCounts.values.reduce((sum, count) => sum + count);

    for (var entry in categoryCounts.entries) {
      double probability = entry.value / totalTexts;
      probabilities[entry.key] = probability;
    }

    return probabilities;
  }
}
