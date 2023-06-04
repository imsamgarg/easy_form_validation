import 'package:easy_form_validation/src/pattern_validator.dart';

/// A validator that checks whether a string value contains only alphabets.
///
/// This validator checks whether a string value contains only alphabets (letters)
/// by matching it against a regular expression pattern. The pattern allows only
/// uppercase and lowercase letters (a-z, A-Z), as well as spaces. If the value
/// contains any non-alphabetic characters, it returns the specified error message.
///
/// Example usage:
/// ```dart
/// TextFormField(
///   validator: (value) {
///     return AlphaletsOnlyValidator(
///       errorMessage: 'Only alphabets are allowed.',
///     ).validate(value);
///   },
///   decoration: InputDecoration(
///     labelText: 'Alphabets',
///   ),
/// ),
/// ```
class AlphaletsOnlyValidator extends PatternValidator {
  /// Creates a new instance of [AlphaletsOnlyValidator].
  ///
  /// The [errorMessage] parameter is the error message to be returned if the value
  /// contains any non-alphabetic characters.
  AlphaletsOnlyValidator({required super.errorMessage})
      : super(RegExp(r'^[a-zA-Z ]*$'));
}
