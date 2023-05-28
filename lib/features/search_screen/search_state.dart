part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = InitialSearchState;
  const factory SearchState.loading() = SearchLoadingState;
  const factory SearchState.loaded({
    List<RedditPost>? posts,
    Map<String, double>? probabilities,
    Map<String, bool>? selectedCategories,
  }) = SearchLoadedState;
  const factory SearchState.error() = SearchErrorState;
}
