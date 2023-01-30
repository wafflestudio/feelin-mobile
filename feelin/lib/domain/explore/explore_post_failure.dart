import 'package:freezed_annotation/freezed_annotation.dart';

part 'explore_post_failure.freezed.dart';
@freezed
class ExplorePostFailure with _$ExplorePostFailure {
  const factory ExplorePostFailure.serverError() = _ServerError;
  const factory ExplorePostFailure.unauthorized() = _Unauthorized;
  const factory ExplorePostFailure.forbidden() = _Forbidden;
  const factory ExplorePostFailure.notFound() = _NotFound;
  const factory ExplorePostFailure.restricted() = _Restricted;
}