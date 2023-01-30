import 'package:dartz/dartz.dart';
import 'package:music_sns/domain/core/value_failures.dart';
import 'package:validators/validators.dart';

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateAccount(String input) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  if (input.length >= 5) {
    return right(input);
  } else {
    return left(ValueFailure.shortPassword(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateMaxStringLength(
  String input,
  int maxLength,
) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(
        ValueFailure.exceedingLength(failedValue: input, max: maxLength));
  }
}

Either<ValueFailure<String>, String> validateStringNotEmpty(String input) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(ValueFailure.empty(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateAuthCode(String input) {
  if (input.length == 6) {
    return right(input);
  } else {
    return left(ValueFailure.shortPassword(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePhoneNumber(String input) {
  const phoneNumberRegex =
  r"/\d{2,3}-\d{3,4}-\d{4}/";
  //if (RegExp(phoneNumberRegex).hasMatch(input)) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(ValueFailure.invalidPhoneNum(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateUserName(String input) {
  if (input.length >= 2 && input.length <= 20) {
    return right(input);
  } else {
    return left(ValueFailure.invalidUserName(failedValue: input));
  }
}

Either<ValueFailure<String>, String> confirmPassword(String input, String input2) {
  if (input == input2) {
    return right(input);
  } else {
    return left(ValueFailure.wrongPasswordConfirm(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateUrl(String input) {
  if (isURL(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidUrl(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateContent(String input) {
  if (input.length <= 1000) {
    return right(input);
  } else {
    return left(ValueFailure.exceedingLength(failedValue: input, max: 100));
  }
}

Either<ValueFailure<String>, String> validateIntroduction(String input) {
  if (input.length <= 1000) {
    return right(input);
  } else {
    return left(ValueFailure.exceedingLength(failedValue: input, max: 100));
  }
}
