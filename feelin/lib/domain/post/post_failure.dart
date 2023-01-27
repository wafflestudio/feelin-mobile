import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_failure.freezed.dart';

@freezed
class PostFailure with _$PostFailure {
  const factory PostFailure.duplicateTitle() = _DuplicateTitle;
  const factory PostFailure.serverError() = _ServerError;
  const factory PostFailure.blankedTitle() = _BlankedTitle;
  const factory PostFailure.unauthorized() = _Unauthorized;
  const factory PostFailure.noSuchPlaylistExists() =
  _NoSuchPlaylistExists;
  const factory PostFailure.notSupportingVendor() =
  _NotSupportingVendor;
  const factory PostFailure.invalidUrl() = _InvalidUrl;
  const factory PostFailure.exceedingMaxContentLength() = _ExceedingMaxContentLength;
}
