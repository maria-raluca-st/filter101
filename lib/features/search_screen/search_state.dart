// import 'package:filter101/data/post.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'search_state.freezed.dart';

part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = InitialSearchState;
  const factory SearchState.loading() = SearchLoadingState;
  const factory SearchState.loaded({
    required List<RedditPost> posts,
    required Map<String, double> probabilities,
  }) = SearchLoadedState;
  const factory SearchState.error() = SearchErrorState;
}
