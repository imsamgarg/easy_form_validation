import 'package:easy_form_validation/src/value_validator.dart';

/// A validator that checks whether a string value represents an integer.
///
/// This validator checks whether a string value can be parsed as an integer.
/// It attempts to parse the value using the `int.tryParse` function, and if
/// the parsing fails, it returns the specified error message.
///
/// Example usage:
/// ```dart
/// TextFormField(
///   validator: (value) {
///     return IsIntValidator(
///       errorMessage: 'Value must be an integer.',
///     ).validate(value);
///   },
///   decoration: InputDecoration(
///     labelText: 'Field',
///   ),
/// ),
/// ```
class IsIntValidator implements ValueValidator<String> {
  /// The error message to be returned if the value cannot be parsed as an integer.
  final String errorMessage;

  /// Creates a new instance of [IsIntValidator].
  ///
  /// The [errorMessage] parameter is the error message to be returned if the value cannot be parsed as an integer.
  const IsIntValidator({required this.errorMessage});

  @override
  String? validate(String? value) {
    final num = int.tryParse(value ?? "a" /* stub value */);

    if (num == null) return errorMessage;

    return null;
  }
}
