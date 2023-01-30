import 'package:freezed_annotation/freezed_annotation.dart';

part 'block_failure.freezed.dart';

@freezed
class BlockFailure with _$BlockFailure {
  const factory BlockFailure.notFound() = _NotFound;
  const factory BlockFailure.alreadyBlocked() = _AlreadyBlocked;
  const factory BlockFailure.serverError() = _ServerError;
}
