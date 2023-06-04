import 'package:easy_form_validation/src/value_validator.dart';

/// A validator that checks whether a string value has an exact length.
///
/// This validator checks whether a string value has a specified exact length.
/// It compares the length of the value to the specified length, and if they are
/// not equal, it returns the specified error message.
///
/// Example usage:
/// ```dart
/// TextFormField(
///   validator: (value) {
///     return ExactLengthValidator(
///       10,
///       errorMessage: 'Value must have a length of 10 characters.',
///     ).validate(value);
///   },
///   decoration: InputDecoration(
///     labelText: 'Field',
///   ),
/// ),
/// ```
class ExactLengthValidator implements ValueValidator<String> {
  /// The exact length that the value must have.
  final int length;

  /// The error message to be returned if the value does not have the exact length.
  final String errorMessage;

  /// Creates a new instance of [ExactLengthValidator].
  ///
  /// The [length] parameter specifies the exact length that the value must have.
  /// The [errorMessage] parameter is the error message to be returned if the value
  /// does not have the exact length.
  const ExactLengthValidator(this.length, {required this.errorMessage});

  @override
  String? validate(String? value) {
    final l = value?.length ?? double.infinity;

    if (l != length) return errorMessage;

    return null;
  }
}
