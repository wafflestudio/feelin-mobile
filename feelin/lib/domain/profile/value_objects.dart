import 'package:dartz/dartz.dart';

import '../core/value_failures.dart';
import '../core/value_objects.dart';
import '../core/value_validators.dart';

class Username extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Username(String input) {
    return Username._(
      validateUserName(input),
    );
  }

  const Username._(this.value);
}

class Introduction extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Introduction(String input) {
    return Introduction._(
      validateIntroduction(input),
    );
  }

  const Introduction._(this.value);
}