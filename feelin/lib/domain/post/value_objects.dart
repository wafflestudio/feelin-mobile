import 'package:dartz/dartz.dart';
import 'package:music_sns/domain/core/value_validators.dart';

import '../core/value_failures.dart';
import '../core/value_objects.dart';

class PlaylistUrl extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PlaylistUrl(String input) {
    return PlaylistUrl._(
      validateUrl(input),
    );
  }

  const PlaylistUrl._(this.value);
}

class NotEmptyString extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory NotEmptyString(String input) {
    return NotEmptyString._(
      validateStringNotEmpty(input),
    );
  }

  const NotEmptyString._(this.value);
}

class ContentString extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ContentString(String input) {
    return ContentString._(
      validateContent(input),
    );
  }

  const ContentString._(this.value);
}