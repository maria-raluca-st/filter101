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
        super(const SearchState.initial()) {}

  String? get subredditName => _subredditName;

  set subredditName(String? value) {
    _subredditName = value;
    add(FetchDataEvent(value!));
  }

  @override
  Stream<SearchState> onEvent(SearchEvent event) async* {
    super.onEvent(event);
    if (event is FetchDataEvent) {
      yield* _mapFetchDataEventToState(event);
    } else if (event is SelectCategoryEvent) {
      yield* _mapSelectCategoryEventToState(event);
    } else if (event is ChangeSubredditEvent) {
      yield* _mapChangeSubredditEventToState(event);
    }
  }

  Stream<SearchState> _mapFetchDataEventToState(FetchDataEvent event) async* {
    yield const SearchState.loading();

    if (_subredditName == null) {
      yield const SearchState.error();
      return;
    }

    final List<RedditPost> fetchedPosts =
        await RedditService.fetchPosts(_subredditName!, 10);

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

  Stream<SearchState> _mapSelectCategoryEventToState(
      SelectCategoryEvent event) async* {
    _selectedCategories[event.category] = event.selected;
    yield* _fetchData();
  }

  Stream<SearchState> _mapChangeSubredditEventToState(
      ChangeSubredditEvent event) async* {
    _subredditName = event.subreddit;
    yield* _fetchData();
  }

  Stream<SearchState> _fetchData() async* {
    if (_subredditName != null) {
      add(FetchDataEvent(_subredditName!));
    }
  }

  void classifyContent(String text, Map<String, int> categoryCounts) async {
    if (_selectedCategories['hateSpeech']!) {
      final prediction = await _classifier.classify(text, 'hate');
      if (prediction[1].score > prediction[0].score) {
        categoryCounts['hateSpeech'] = categoryCounts['hateSpeech']! + 1;
      }
    }

    if (_selectedCategories['negativeContent']!) {
      // Classify for negative content
      // ...
    }

    if (_selectedCategories['humor']!) {
      // Classify for humor
      // ...
    }

    if (_selectedCategories['positiveContent']!) {
      // Classify for positive content
      // ...
    }

    if (_selectedCategories['sarcasmExcluding']!) {
      // Classify for sarcasm excluding
      // ...
    }

    if (_selectedCategories['sarcasmIncluding']!) {
      // Classify for sarcasm including
      // ...
    }
  }

  Map<String, double> calculateProbabilities(Map<String, int> categoryCounts) {
    final Map<String, double> probabilities = {};

    // Calculate probabilities based on categoryCounts
    // ...

    return probabilities;
  }
}
