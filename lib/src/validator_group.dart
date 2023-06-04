import 'package:easy_form_validation/easy_form_validation.dart';

/// A validator that groups multiple validators together and applies them in sequence.
///
/// This validator allows you to combine multiple validators and apply them in sequence
/// to validate a value. It executes each validator in the order they are provided, and
/// if any of the validators return an error message, the validation process stops and
/// that error message is returned. If all validators pass without errors, the value is
/// considered valid.
///
/// Example usage:
/// ```dart
/// TextFormField(
///   validator: (value) {
///     return ValidatorGroup<String>([
///       RequiredValidator(errorMessage: 'This field is required.'),
///       MaxLengthValidator(10, errorMessage: 'Exceeded maximum length.'),
///     ]).validate(value);
///   },
///   decoration: InputDecoration(
///     labelText: 'Field',
///   ),
/// ),
/// ```
class ValidatorGroup<T> implements ValueValidator<T> {
  /// The list of validators to be applied in sequence.
  final List<ValueValidator<T>> validators;

  /// Specifies whether to perform validation only when the value exists (not null or not empty).
  ///
  /// If `onlyPerformValidationWhenValueExists` is set to `true`, the validators will only be
  /// applied if the value exists, i.e., is not null or not an empty string. By default, it is set to `false`.
  final bool onlyPerformValidationWhenValueExists;

  /// Creates a new instance of [ValidatorGroup].
  ///
  /// The [validators] parameter is a list of validators that will be executed in sequence
  /// to validate the value. The validators are applied in the order they are provided.
  ///
  /// The optional [onlyPerformValidationWhenValueExists] parameter can be set to `true` to perform
  /// validation only when the value exists, i.e., is not null or not an empty string. If
  /// `onlyPerformValidationWhenValueExists` is `true`, the validators will only be applied if the
  /// value exists. By default, it is set to `false`. It could be useful when a field is optional but
  /// still needs validation if the value is not null or empty.
  const ValidatorGroup(this.validators,
      {this.onlyPerformValidationWhenValueExists = false});

  @override
  String? validate(T? value) {
    if (onlyPerformValidationWhenValueExists) {
      if (value == null) return null;

      if (value is String && value.isEmpty) return null;
    }

    for (final validator in validators) {
      final msg = validator.validate(value);

      if (msg != null) return msg;
    }

    return null;
  }
}
