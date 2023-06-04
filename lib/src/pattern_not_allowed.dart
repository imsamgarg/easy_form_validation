import 'package:easy_form_validation/src/value_validator.dart';

/// A validator that checks whether a value does not contain a specific pattern.
///
/// This validator checks whether a value does not contain a specified pattern.
/// It uses the `contains` method of the `String` class to determine if the pattern
/// is found within the value. If the pattern is found, it returns the specified
/// error message.
///
/// Example usage:
/// ```dart
/// TextFormField(
///   validator: (value) {
///     return PatternNotAllowedValidator(
///       pattern: 'example',
///       errorMessage: 'Value must not contain the pattern "example".',
///     ).validate(value);
///   },
///   decoration: InputDecoration(
///     labelText: 'Field',
///   ),
/// ),
/// ```
class PatternNotAllowedValidator implements ValueValidator<String> {
  /// The pattern that should not be found within the value.
  final Pattern pattern;

  /// The error message to be returned if the value contains the pattern.
  final String errorMessage;

  /// Creates a new instance of [PatternNotAllowedValidator].
  ///
  /// The [pattern] parameter is the pattern that should not be found within the value.
  /// The [errorMessage] parameter is the error message to be returned if the value contains the pattern.
  const PatternNotAllowedValidator(this.pattern, {required this.errorMessage});

  @override
  String? validate(String? value) {
    final contains = value?.contains(pattern) ?? false;

    if (contains) return errorMessage;

    return null;
  }
}

/// A validator that checks whether a value does not match a regular expression pattern.
///
/// This validator is a specialized version of [PatternNotAllowedValidator] that accepts a
/// regular expression pattern ([RegExp]). It inherits the functionality of the
/// [PatternNotAllowedValidator] and can be used to validate values against complex patterns.
///
/// Example usage:
/// ```dart
/// TextFormField(
///   validator: (value) {
///     return RegexNotAllowedValidator(
///       RegExp(r'\d+'),
///       errorMessage: 'Value must not contain any digits.',
///     ).validate(value);
///   },
///   decoration: InputDecoration(
///     labelText: 'Field',
///   ),
/// ),
/// ```
class RegexNotAllowedValidator extends PatternNotAllowedValidator {
  /// Creates a new instance of [RegexNotAllowedValidator].
  ///
  /// The [regExp] parameter is the regular expression pattern that should not be matched within the value.
  /// The [errorMessage] parameter is the error message to be returned if the value matches the regular expression pattern.
  const RegexNotAllowedValidator(RegExp regExp, {required super.errorMessage})
      : super(regExp);
}
