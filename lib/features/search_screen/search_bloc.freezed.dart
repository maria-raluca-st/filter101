// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String subredditName) fetchData,
    required TResult Function() fetchInitialData,
    required TResult Function(String category, bool selected) selectCategory,
    required TResult Function(String subreddit) changeSubreddit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String subredditName)? fetchData,
    TResult? Function()? fetchInitialData,
    TResult? Function(String category, bool selected)? selectCategory,
    TResult? Function(String subreddit)? changeSubreddit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String subredditName)? fetchData,
    TResult Function()? fetchInitialData,
    TResult Function(String category, bool selected)? selectCategory,
    TResult Function(String subreddit)? changeSubreddit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchDataEvent value) fetchData,
    required TResult Function(FetchInitialDataEvent value) fetchInitialData,
    required TResult Function(SelectCategoryEvent value) selectCategory,
    required TResult Function(ChangeSubredditEvent value) changeSubreddit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchDataEvent value)? fetchData,
    TResult? Function(FetchInitialDataEvent value)? fetchInitialData,
    TResult? Function(SelectCategoryEvent value)? selectCategory,
    TResult? Function(ChangeSubredditEvent value)? changeSubreddit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchDataEvent value)? fetchData,
    TResult Function(FetchInitialDataEvent value)? fetchInitialData,
    TResult Function(SelectCategoryEvent value)? selectCategory,
    TResult Function(ChangeSubredditEvent value)? changeSubreddit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchEventCopyWith<$Res> {
  factory $SearchEventCopyWith(
          SearchEvent value, $Res Function(SearchEvent) then) =
      _$SearchEventCopyWithImpl<$Res, SearchEvent>;
}

/// @nodoc
class _$SearchEventCopyWithImpl<$Res, $Val extends SearchEvent>
    implements $SearchEventCopyWith<$Res> {
  _$SearchEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchDataEventCopyWith<$Res> {
  factory _$$FetchDataEventCopyWith(
          _$FetchDataEvent value, $Res Function(_$FetchDataEvent) then) =
      __$$FetchDataEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String subredditName});
}

/// @nodoc
class __$$FetchDataEventCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$FetchDataEvent>
    implements _$$FetchDataEventCopyWith<$Res> {
  __$$FetchDataEventCopyWithImpl(
      _$FetchDataEvent _value, $Res Function(_$FetchDataEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subredditName = null,
  }) {
    return _then(_$FetchDataEvent(
      null == subredditName
          ? _value.subredditName
          : subredditName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchDataEvent implements FetchDataEvent {
  const _$FetchDataEvent(this.subredditName);

  @override
  final String subredditName;

  @override
  String toString() {
    return 'SearchEvent.fetchData(subredditName: $subredditName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchDataEvent &&
            (identical(other.subredditName, subredditName) ||
                other.subredditName == subredditName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, subredditName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchDataEventCopyWith<_$FetchDataEvent> get copyWith =>
      __$$FetchDataEventCopyWithImpl<_$FetchDataEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String subredditName) fetchData,
    required TResult Function() fetchInitialData,
    required TResult Function(String category, bool selected) selectCategory,
    required TResult Function(String subreddit) changeSubreddit,
  }) {
    return fetchData(subredditName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String subredditName)? fetchData,
    TResult? Function()? fetchInitialData,
    TResult? Function(String category, bool selected)? selectCategory,
    TResult? Function(String subreddit)? changeSubreddit,
  }) {
    return fetchData?.call(subredditName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String subredditName)? fetchData,
    TResult Function()? fetchInitialData,
    TResult Function(String category, bool selected)? selectCategory,
    TResult Function(String subreddit)? changeSubreddit,
    required TResult orElse(),
  }) {
    if (fetchData != null) {
      return fetchData(subredditName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchDataEvent value) fetchData,
    required TResult Function(FetchInitialDataEvent value) fetchInitialData,
    required TResult Function(SelectCategoryEvent value) selectCategory,
    required TResult Function(ChangeSubredditEvent value) changeSubreddit,
  }) {
    return fetchData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchDataEvent value)? fetchData,
    TResult? Function(FetchInitialDataEvent value)? fetchInitialData,
    TResult? Function(SelectCategoryEvent value)? selectCategory,
    TResult? Function(ChangeSubredditEvent value)? changeSubreddit,
  }) {
    return fetchData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchDataEvent value)? fetchData,
    TResult Function(FetchInitialDataEvent value)? fetchInitialData,
    TResult Function(SelectCategoryEvent value)? selectCategory,
    TResult Function(ChangeSubredditEvent value)? changeSubreddit,
    required TResult orElse(),
  }) {
    if (fetchData != null) {
      return fetchData(this);
    }
    return orElse();
  }
}

abstract class FetchDataEvent implements SearchEvent {
  const factory FetchDataEvent(final String subredditName) = _$FetchDataEvent;

  String get subredditName;
  @JsonKey(ignore: true)
  _$$FetchDataEventCopyWith<_$FetchDataEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchInitialDataEventCopyWith<$Res> {
  factory _$$FetchInitialDataEventCopyWith(_$FetchInitialDataEvent value,
          $Res Function(_$FetchInitialDataEvent) then) =
      __$$FetchInitialDataEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchInitialDataEventCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$FetchInitialDataEvent>
    implements _$$FetchInitialDataEventCopyWith<$Res> {
  __$$FetchInitialDataEventCopyWithImpl(_$FetchInitialDataEvent _value,
      $Res Function(_$FetchInitialDataEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchInitialDataEvent implements FetchInitialDataEvent {
  const _$FetchInitialDataEvent();

  @override
  String toString() {
    return 'SearchEvent.fetchInitialData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchInitialDataEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String subredditName) fetchData,
    required TResult Function() fetchInitialData,
    required TResult Function(String category, bool selected) selectCategory,
    required TResult Function(String subreddit) changeSubreddit,
  }) {
    return fetchInitialData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String subredditName)? fetchData,
    TResult? Function()? fetchInitialData,
    TResult? Function(String category, bool selected)? selectCategory,
    TResult? Function(String subreddit)? changeSubreddit,
  }) {
    return fetchInitialData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String subredditName)? fetchData,
    TResult Function()? fetchInitialData,
    TResult Function(String category, bool selected)? selectCategory,
    TResult Function(String subreddit)? changeSubreddit,
    required TResult orElse(),
  }) {
    if (fetchInitialData != null) {
      return fetchInitialData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchDataEvent value) fetchData,
    required TResult Function(FetchInitialDataEvent value) fetchInitialData,
    required TResult Function(SelectCategoryEvent value) selectCategory,
    required TResult Function(ChangeSubredditEvent value) changeSubreddit,
  }) {
    return fetchInitialData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchDataEvent value)? fetchData,
    TResult? Function(FetchInitialDataEvent value)? fetchInitialData,
    TResult? Function(SelectCategoryEvent value)? selectCategory,
    TResult? Function(ChangeSubredditEvent value)? changeSubreddit,
  }) {
    return fetchInitialData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchDataEvent value)? fetchData,
    TResult Function(FetchInitialDataEvent value)? fetchInitialData,
    TResult Function(SelectCategoryEvent value)? selectCategory,
    TResult Function(ChangeSubredditEvent value)? changeSubreddit,
    required TResult orElse(),
  }) {
    if (fetchInitialData != null) {
      return fetchInitialData(this);
    }
    return orElse();
  }
}

abstract class FetchInitialDataEvent implements SearchEvent {
  const factory FetchInitialDataEvent() = _$FetchInitialDataEvent;
}

/// @nodoc
abstract class _$$SelectCategoryEventCopyWith<$Res> {
  factory _$$SelectCategoryEventCopyWith(_$SelectCategoryEvent value,
          $Res Function(_$SelectCategoryEvent) then) =
      __$$SelectCategoryEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String category, bool selected});
}

/// @nodoc
class __$$SelectCategoryEventCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$SelectCategoryEvent>
    implements _$$SelectCategoryEventCopyWith<$Res> {
  __$$SelectCategoryEventCopyWithImpl(
      _$SelectCategoryEvent _value, $Res Function(_$SelectCategoryEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? selected = null,
  }) {
    return _then(_$SelectCategoryEvent(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SelectCategoryEvent implements SelectCategoryEvent {
  const _$SelectCategoryEvent({required this.category, required this.selected});

  @override
  final String category;
  @override
  final bool selected;

  @override
  String toString() {
    return 'SearchEvent.selectCategory(category: $category, selected: $selected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectCategoryEvent &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category, selected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectCategoryEventCopyWith<_$SelectCategoryEvent> get copyWith =>
      __$$SelectCategoryEventCopyWithImpl<_$SelectCategoryEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String subredditName) fetchData,
    required TResult Function() fetchInitialData,
    required TResult Function(String category, bool selected) selectCategory,
    required TResult Function(String subreddit) changeSubreddit,
  }) {
    return selectCategory(category, selected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String subredditName)? fetchData,
    TResult? Function()? fetchInitialData,
    TResult? Function(String category, bool selected)? selectCategory,
    TResult? Function(String subreddit)? changeSubreddit,
  }) {
    return selectCategory?.call(category, selected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String subredditName)? fetchData,
    TResult Function()? fetchInitialData,
    TResult Function(String category, bool selected)? selectCategory,
    TResult Function(String subreddit)? changeSubreddit,
    required TResult orElse(),
  }) {
    if (selectCategory != null) {
      return selectCategory(category, selected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchDataEvent value) fetchData,
    required TResult Function(FetchInitialDataEvent value) fetchInitialData,
    required TResult Function(SelectCategoryEvent value) selectCategory,
    required TResult Function(ChangeSubredditEvent value) changeSubreddit,
  }) {
    return selectCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchDataEvent value)? fetchData,
    TResult? Function(FetchInitialDataEvent value)? fetchInitialData,
    TResult? Function(SelectCategoryEvent value)? selectCategory,
    TResult? Function(ChangeSubredditEvent value)? changeSubreddit,
  }) {
    return selectCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchDataEvent value)? fetchData,
    TResult Function(FetchInitialDataEvent value)? fetchInitialData,
    TResult Function(SelectCategoryEvent value)? selectCategory,
    TResult Function(ChangeSubredditEvent value)? changeSubreddit,
    required TResult orElse(),
  }) {
    if (selectCategory != null) {
      return selectCategory(this);
    }
    return orElse();
  }
}

abstract class SelectCategoryEvent implements SearchEvent {
  const factory SelectCategoryEvent(
      {required final String category,
      required final bool selected}) = _$SelectCategoryEvent;

  String get category;
  bool get selected;
  @JsonKey(ignore: true)
  _$$SelectCategoryEventCopyWith<_$SelectCategoryEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeSubredditEventCopyWith<$Res> {
  factory _$$ChangeSubredditEventCopyWith(_$ChangeSubredditEvent value,
          $Res Function(_$ChangeSubredditEvent) then) =
      __$$ChangeSubredditEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String subreddit});
}

/// @nodoc
class __$$ChangeSubredditEventCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$ChangeSubredditEvent>
    implements _$$ChangeSubredditEventCopyWith<$Res> {
  __$$ChangeSubredditEventCopyWithImpl(_$ChangeSubredditEvent _value,
      $Res Function(_$ChangeSubredditEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subreddit = null,
  }) {
    return _then(_$ChangeSubredditEvent(
      subreddit: null == subreddit
          ? _value.subreddit
          : subreddit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeSubredditEvent implements ChangeSubredditEvent {
  const _$ChangeSubredditEvent({required this.subreddit});

  @override
  final String subreddit;

  @override
  String toString() {
    return 'SearchEvent.changeSubreddit(subreddit: $subreddit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeSubredditEvent &&
            (identical(other.subreddit, subreddit) ||
                other.subreddit == subreddit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, subreddit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeSubredditEventCopyWith<_$ChangeSubredditEvent> get copyWith =>
      __$$ChangeSubredditEventCopyWithImpl<_$ChangeSubredditEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String subredditName) fetchData,
    required TResult Function() fetchInitialData,
    required TResult Function(String category, bool selected) selectCategory,
    required TResult Function(String subreddit) changeSubreddit,
  }) {
    return changeSubreddit(subreddit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String subredditName)? fetchData,
    TResult? Function()? fetchInitialData,
    TResult? Function(String category, bool selected)? selectCategory,
    TResult? Function(String subreddit)? changeSubreddit,
  }) {
    return changeSubreddit?.call(subreddit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String subredditName)? fetchData,
    TResult Function()? fetchInitialData,
    TResult Function(String category, bool selected)? selectCategory,
    TResult Function(String subreddit)? changeSubreddit,
    required TResult orElse(),
  }) {
    if (changeSubreddit != null) {
      return changeSubreddit(subreddit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchDataEvent value) fetchData,
    required TResult Function(FetchInitialDataEvent value) fetchInitialData,
    required TResult Function(SelectCategoryEvent value) selectCategory,
    required TResult Function(ChangeSubredditEvent value) changeSubreddit,
  }) {
    return changeSubreddit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchDataEvent value)? fetchData,
    TResult? Function(FetchInitialDataEvent value)? fetchInitialData,
    TResult? Function(SelectCategoryEvent value)? selectCategory,
    TResult? Function(ChangeSubredditEvent value)? changeSubreddit,
  }) {
    return changeSubreddit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchDataEvent value)? fetchData,
    TResult Function(FetchInitialDataEvent value)? fetchInitialData,
    TResult Function(SelectCategoryEvent value)? selectCategory,
    TResult Function(ChangeSubredditEvent value)? changeSubreddit,
    required TResult orElse(),
  }) {
    if (changeSubreddit != null) {
      return changeSubreddit(this);
    }
    return orElse();
  }
}

abstract class ChangeSubredditEvent implements SearchEvent {
  const factory ChangeSubredditEvent({required final String subreddit}) =
      _$ChangeSubredditEvent;

  String get subreddit;
  @JsonKey(ignore: true)
  _$$ChangeSubredditEventCopyWith<_$ChangeSubredditEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SearchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<RedditPost>? posts,
            Map<String, double>? probabilities,
            Map<String, bool>? selectedCategories)
        loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<RedditPost>? posts,
            Map<String, double>? probabilities,
            Map<String, bool>? selectedCategories)?
        loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<RedditPost>? posts,
            Map<String, double>? probabilities,
            Map<String, bool>? selectedCategories)?
        loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialSearchState value) initial,
    required TResult Function(SearchLoadingState value) loading,
    required TResult Function(SearchLoadedState value) loaded,
    required TResult Function(SearchErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialSearchState value)? initial,
    TResult? Function(SearchLoadingState value)? loading,
    TResult? Function(SearchLoadedState value)? loaded,
    TResult? Function(SearchErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialSearchState value)? initial,
    TResult Function(SearchLoadingState value)? loading,
    TResult Function(SearchLoadedState value)? loaded,
    TResult Function(SearchErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res, SearchState>;
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialSearchStateCopyWith<$Res> {
  factory _$$InitialSearchStateCopyWith(_$InitialSearchState value,
          $Res Function(_$InitialSearchState) then) =
      __$$InitialSearchStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialSearchStateCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$InitialSearchState>
    implements _$$InitialSearchStateCopyWith<$Res> {
  __$$InitialSearchStateCopyWithImpl(
      _$InitialSearchState _value, $Res Function(_$InitialSearchState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialSearchState implements InitialSearchState {
  const _$InitialSearchState();

  @override
  String toString() {
    return 'SearchState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialSearchState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<RedditPost>? posts,
            Map<String, double>? probabilities,
            Map<String, bool>? selectedCategories)
        loaded,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<RedditPost>? posts,
            Map<String, double>? probabilities,
            Map<String, bool>? selectedCategories)?
        loaded,
    TResult? Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<RedditPost>? posts,
            Map<String, double>? probabilities,
            Map<String, bool>? selectedCategories)?
        loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialSearchState value) initial,
    required TResult Function(SearchLoadingState value) loading,
    required TResult Function(SearchLoadedState value) loaded,
    required TResult Function(SearchErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialSearchState value)? initial,
    TResult? Function(SearchLoadingState value)? loading,
    TResult? Function(SearchLoadedState value)? loaded,
    TResult? Function(SearchErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialSearchState value)? initial,
    TResult Function(SearchLoadingState value)? loading,
    TResult Function(SearchLoadedState value)? loaded,
    TResult Function(SearchErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialSearchState implements SearchState {
  const factory InitialSearchState() = _$InitialSearchState;
}

/// @nodoc
abstract class _$$SearchLoadingStateCopyWith<$Res> {
  factory _$$SearchLoadingStateCopyWith(_$SearchLoadingState value,
          $Res Function(_$SearchLoadingState) then) =
      __$$SearchLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchLoadingStateCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchLoadingState>
    implements _$$SearchLoadingStateCopyWith<$Res> {
  __$$SearchLoadingStateCopyWithImpl(
      _$SearchLoadingState _value, $Res Function(_$SearchLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SearchLoadingState implements SearchLoadingState {
  const _$SearchLoadingState();

  @override
  String toString() {
    return 'SearchState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SearchLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<RedditPost>? posts,
            Map<String, double>? probabilities,
            Map<String, bool>? selectedCategories)
        loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<RedditPost>? posts,
            Map<String, double>? probabilities,
            Map<String, bool>? selectedCategories)?
        loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<RedditPost>? posts,
            Map<String, double>? probabilities,
            Map<String, bool>? selectedCategories)?
        loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialSearchState value) initial,
    required TResult Function(SearchLoadingState value) loading,
    required TResult Function(SearchLoadedState value) loaded,
    required TResult Function(SearchErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialSearchState value)? initial,
    TResult? Function(SearchLoadingState value)? loading,
    TResult? Function(SearchLoadedState value)? loaded,
    TResult? Function(SearchErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialSearchState value)? initial,
    TResult Function(SearchLoadingState value)? loading,
    TResult Function(SearchLoadedState value)? loaded,
    TResult Function(SearchErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SearchLoadingState implements SearchState {
  const factory SearchLoadingState() = _$SearchLoadingState;
}

/// @nodoc
abstract class _$$SearchLoadedStateCopyWith<$Res> {
  factory _$$SearchLoadedStateCopyWith(
          _$SearchLoadedState value, $Res Function(_$SearchLoadedState) then) =
      __$$SearchLoadedStateCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<RedditPost>? posts,
      Map<String, double>? probabilities,
      Map<String, bool>? selectedCategories});
}

/// @nodoc
class __$$SearchLoadedStateCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchLoadedState>
    implements _$$SearchLoadedStateCopyWith<$Res> {
  __$$SearchLoadedStateCopyWithImpl(
      _$SearchLoadedState _value, $Res Function(_$SearchLoadedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = freezed,
    Object? probabilities = freezed,
    Object? selectedCategories = freezed,
  }) {
    return _then(_$SearchLoadedState(
      posts: freezed == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<RedditPost>?,
      probabilities: freezed == probabilities
          ? _value._probabilities
          : probabilities // ignore: cast_nullable_to_non_nullable
              as Map<String, double>?,
      selectedCategories: freezed == selectedCategories
          ? _value._selectedCategories
          : selectedCategories // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
    ));
  }
}

/// @nodoc

class _$SearchLoadedState implements SearchLoadedState {
  const _$SearchLoadedState(
      {final List<RedditPost>? posts,
      final Map<String, double>? probabilities,
      final Map<String, bool>? selectedCategories})
      : _posts = posts,
        _probabilities = probabilities,
        _selectedCategories = selectedCategories;

  final List<RedditPost>? _posts;
  @override
  List<RedditPost>? get posts {
    final value = _posts;
    if (value == null) return null;
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, double>? _probabilities;
  @override
  Map<String, double>? get probabilities {
    final value = _probabilities;
    if (value == null) return null;
    if (_probabilities is EqualUnmodifiableMapView) return _probabilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, bool>? _selectedCategories;
  @override
  Map<String, bool>? get selectedCategories {
    final value = _selectedCategories;
    if (value == null) return null;
    if (_selectedCategories is EqualUnmodifiableMapView)
      return _selectedCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'SearchState.loaded(posts: $posts, probabilities: $probabilities, selectedCategories: $selectedCategories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchLoadedState &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            const DeepCollectionEquality()
                .equals(other._probabilities, _probabilities) &&
            const DeepCollectionEquality()
                .equals(other._selectedCategories, _selectedCategories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_posts),
      const DeepCollectionEquality().hash(_probabilities),
      const DeepCollectionEquality().hash(_selectedCategories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchLoadedStateCopyWith<_$SearchLoadedState> get copyWith =>
      __$$SearchLoadedStateCopyWithImpl<_$SearchLoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<RedditPost>? posts,
            Map<String, double>? probabilities,
            Map<String, bool>? selectedCategories)
        loaded,
    required TResult Function() error,
  }) {
    return loaded(posts, probabilities, selectedCategories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<RedditPost>? posts,
            Map<String, double>? probabilities,
            Map<String, bool>? selectedCategories)?
        loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(posts, probabilities, selectedCategories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<RedditPost>? posts,
            Map<String, double>? probabilities,
            Map<String, bool>? selectedCategories)?
        loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(posts, probabilities, selectedCategories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialSearchState value) initial,
    required TResult Function(SearchLoadingState value) loading,
    required TResult Function(SearchLoadedState value) loaded,
    required TResult Function(SearchErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialSearchState value)? initial,
    TResult? Function(SearchLoadingState value)? loading,
    TResult? Function(SearchLoadedState value)? loaded,
    TResult? Function(SearchErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialSearchState value)? initial,
    TResult Function(SearchLoadingState value)? loading,
    TResult Function(SearchLoadedState value)? loaded,
    TResult Function(SearchErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class SearchLoadedState implements SearchState {
  const factory SearchLoadedState(
      {final List<RedditPost>? posts,
      final Map<String, double>? probabilities,
      final Map<String, bool>? selectedCategories}) = _$SearchLoadedState;

  List<RedditPost>? get posts;
  Map<String, double>? get probabilities;
  Map<String, bool>? get selectedCategories;
  @JsonKey(ignore: true)
  _$$SearchLoadedStateCopyWith<_$SearchLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchErrorStateCopyWith<$Res> {
  factory _$$SearchErrorStateCopyWith(
          _$SearchErrorState value, $Res Function(_$SearchErrorState) then) =
      __$$SearchErrorStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchErrorStateCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchErrorState>
    implements _$$SearchErrorStateCopyWith<$Res> {
  __$$SearchErrorStateCopyWithImpl(
      _$SearchErrorState _value, $Res Function(_$SearchErrorState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SearchErrorState implements SearchErrorState {
  const _$SearchErrorState();

  @override
  String toString() {
    return 'SearchState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SearchErrorState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<RedditPost>? posts,
            Map<String, double>? probabilities,
            Map<String, bool>? selectedCategories)
        loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<RedditPost>? posts,
            Map<String, double>? probabilities,
            Map<String, bool>? selectedCategories)?
        loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<RedditPost>? posts,
            Map<String, double>? probabilities,
            Map<String, bool>? selectedCategories)?
        loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialSearchState value) initial,
    required TResult Function(SearchLoadingState value) loading,
    required TResult Function(SearchLoadedState value) loaded,
    required TResult Function(SearchErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialSearchState value)? initial,
    TResult? Function(SearchLoadingState value)? loading,
    TResult? Function(SearchLoadedState value)? loaded,
    TResult? Function(SearchErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialSearchState value)? initial,
    TResult Function(SearchLoadingState value)? loading,
    TResult Function(SearchLoadedState value)? loaded,
    TResult Function(SearchErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SearchErrorState implements SearchState {
  const factory SearchErrorState() = _$SearchErrorState;
}
