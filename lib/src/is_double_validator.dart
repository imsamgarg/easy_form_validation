import 'package:easy_form_validation/src/value_validator.dart';

/// A validator that checks whether a string value represents a double.
///
/// This validator checks whether a string value can be parsed as a double.
/// It attempts to parse the value using the `double.tryParse` function, and if
/// the parsing fails, it returns the specified error message.
///
/// Example usage:
/// ```dart
/// TextFormField(
///   validator: (value) {
///     return IsDoubleValidator(
///       errorMessage: 'Value must be a double.',
///     ).validate(value);
///   },
///   decoration: InputDecoration(
///     labelText: 'Field',
///   ),
/// ),
/// ```
class IsDoubleValidator implements ValueValidator<String> {
  /// The error message to be returned if the value cannot be parsed as a double.
  final String errorMessage;

  /// Creates a new instance of [IsDoubleValidator].
  ///
  /// The [errorMessage] parameter is the error message to be returned if the value cannot be parsed as a double.
  const IsDoubleValidator({required this.errorMessage});

  @override
  String? validate(String? value) {
    final num = double.tryParse(value ?? "a" /* stub value */);

    if (num == null) return errorMessage;

    return null;
  }
}
