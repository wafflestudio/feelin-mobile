import 'package:freezed_annotation/freezed_annotation.dart';

part 'explore_failure.freezed.dart';
@freezed
class ExploreFailure with _$ExploreFailure {
  const factory ExploreFailure.serverError() = _ServerError;
  const factory ExploreFailure.unauthorized() = _Unauthorized;
  const factory ExploreFailure.forbidden() = _Forbidden;
  const factory ExploreFailure.notFound() = _NotFound;
}