import 'package:easy_form_validation/src/value_validator.dart';

/// A validator that checks whether a value matches a specific pattern.
///
/// This validator checks whether a value matches a specified pattern. It uses the
/// `contains` method of the `String` class to determine if the pattern is found
/// within the value. If the pattern is not found, it returns the specified error message.
///
/// Example usage:
/// ```dart
/// TextFormField(
///   validator: (value) {
///     return PatternValidator(
///       pattern: 'example',
///       errorMessage: 'Value must contain the pattern "example".',
///     ).validate(value);
///   },
///   decoration: InputDecoration(
///     labelText: 'Field',
///   ),
/// ),
/// ```
class PatternValidator implements ValueValidator<String> {
  /// The pattern to be matched within the value.
  final Pattern pattern;

  /// The error message to be returned if the value does not match the pattern.
  final String errorMessage;

  /// Creates a new instance of [PatternValidator].
  ///
  /// The [pattern] parameter is the pattern to be matched within the value.
  /// The [errorMessage] parameter is the error message to be returned if the
  /// value does not match the pattern.
  const PatternValidator(this.pattern, {required this.errorMessage});

  @override
  String? validate(String? value) {
    final contains = value?.contains(pattern) ?? false;

    if (!contains) return errorMessage;

    return null;
  }
}

/// A validator that checks whether a value matches a regular expression pattern.
///
/// This validator is a specialized version of [PatternValidator] that accepts a
/// regular expression pattern ([RegExp]). It inherits the functionality of the
/// [PatternValidator] and can be used to validate values against complex patterns.
///
/// Example usage:
/// ```dart
/// TextFormField(
///   validator: (value) {
///     return RegexValidator(
///       RegExp(r'\d{4}'),
///       errorMessage: 'Value must be a four-digit number.',
///     ).validate(value);
///   },
///   decoration: InputDecoration(
///     labelText: 'Field',
///   ),
/// ),
/// ```
class RegexValidator extends PatternValidator {
  /// Creates a new instance of [RegexValidator].
  ///
  /// The [regExp] parameter is the regular expression pattern to be matched within the value.
  /// The [errorMessage] parameter is the error message to be returned if the value does not
  /// match the regular expression pattern.
  const RegexValidator(RegExp regExp, {required super.errorMessage})
      : super(regExp);
}
