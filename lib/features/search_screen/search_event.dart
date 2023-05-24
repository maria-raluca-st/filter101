// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'search_event.freezed.dart';
part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.fetchData(String subredditName) = FetchDataEvent;

  const factory SearchEvent.selectCategory({
    required String category,
    required bool selected,
  }) = SelectCategoryEvent;

  const factory SearchEvent.changeSubreddit({
    required String subreddit,
  }) = ChangeSubredditEvent;
}
