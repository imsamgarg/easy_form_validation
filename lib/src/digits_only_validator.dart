import 'package:easy_form_validation/src/pattern_validator.dart';

/// A validator that checks whether a string value contains only digits.
///
/// This validator checks whether a string value contains only digits by matching
/// it against a regular expression pattern. The pattern allows only digits (0-9)
/// and no other characters. If the value contains any non-digit characters,
/// it returns the specified error message.
///
/// Example usage:
/// ```dart
/// TextFormField(
///   validator: (value) {
///     return DigitsOnlyValidator(
///       errorMessage: 'Only digits are allowed.',
///     ).validate(value);
///   },
///   decoration: InputDecoration(
///     labelText: 'Digits',
///   ),
/// ),
/// ```
class DigitsOnlyValidator extends PatternValidator {
  /// Creates a new instance of [DigitsOnlyValidator].
  ///
  /// The [errorMessage] parameter is the error message to be returned if the value
  /// contains any non-digit characters.
  DigitsOnlyValidator({required super.errorMessage})
      : super(RegExp(r'^[0-9]*$'));
}
