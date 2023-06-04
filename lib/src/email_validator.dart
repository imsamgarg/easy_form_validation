import 'package:easy_form_validation/src/pattern_validator.dart';

/// A validator that checks whether a string value represents a valid email address.
///
/// This validator checks whether a string value represents a valid email address
/// based on a regular expression pattern. The regular expression pattern used
/// for email validation is commonly accepted but may not cover all possible cases.
/// If the value does not match the pattern, it returns the specified error message.
///
/// Example usage:
/// ```dart
/// TextFormField(
///   validator: (value) {
///     return EmailValidator(
///       errorMessage: 'Please enter a valid email address.',
///     ).validate(value);
///   },
///   decoration: InputDecoration(
///     labelText: 'Email',
///   ),
/// ),
/// ```
class EmailValidator extends PatternValidator {
  /// Creates a new instance of [EmailValidator].
  ///
  /// The [errorMessage] parameter is the error message to be returned if the value
  /// does not represent a valid email address.
  EmailValidator({required super.errorMessage})
      : super(RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'));
}
