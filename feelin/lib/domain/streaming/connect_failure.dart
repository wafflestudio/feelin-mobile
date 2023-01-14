import 'package:freezed_annotation/freezed_annotation.dart';

part 'connect_failure.freezed.dart';
@freezed
class ConnectFailure with _$ConnectFailure {
  const factory ConnectFailure.serverError() = _ServerError;

}