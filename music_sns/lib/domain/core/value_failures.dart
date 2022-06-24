import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_failures.freezed.dart';

@freezed
class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.exceedingLength({
    required T failedValue,
    required int max, // For inform purposes
  }) = ExceedingLength<T>;
  const factory ValueFailure.empty({
    required T failedValue,
  }) = Empty<T>;
  const factory ValueFailure.invalidEmail({
    required T failedValue,
  }) = InvalidEmail<T>;
  const factory ValueFailure.shortPassword({
    required T failedValue,
  }) = ShortPassword<T>;
  const factory ValueFailure.invalidEmailAuthCode({
    required T failedValue,
  }) = InvalidEmailAuthCode<T>;
  const factory ValueFailure.invalidPhoneNum({
    required T failedValue,
  }) = InvalidPhoneNum<T>;
  const factory ValueFailure.invalidUserName({
    required T failedValue,
  }) = InvalidPhoneNumber<T>;
  const factory ValueFailure.wrongPasswordConfirm({
    required T failedValue,
  }) = WrongPasswordConfirm<T>;
}
