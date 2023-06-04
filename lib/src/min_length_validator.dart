import 'package:easy_form_validation/src/value_validator.dart';

/// A validator that checks whether a string value meets a minimum length requirement.
///
/// This validator checks whether a string value meets a minimum length requirement.
/// It compares the length of the value (after trimming whitespace) with the specified
/// minimum length. If the length is less than the minimum, it returns the specified
/// error message.
///
/// Example usage:
/// ```dart
/// TextFormField(
///   validator: (value) {
///     return MinLengthValidator(
///       8,
///       errorMessage: 'Value must be at least 8 characters long.',
///     ).validate(value);
///   },
///   decoration: InputDecoration(
///     labelText: 'Field',
///   ),
/// ),
/// ```
class MinLengthValidator implements ValueValidator<String> {
  /// The minimum length required for the string value.
  final int length;

  /// The error message to be returned if the value is shorter than the minimum length.
  final String errorMessage;

  /// Creates a new instance of [MinLengthValidator].
  ///
  /// The [length] parameter is the minimum length required for the string value.
  /// The [errorMessage] parameter is the error message to be returned if the value is shorter than the minimum length.
  const MinLengthValidator(this.length, {required this.errorMessage});

  @override
  String? validate(String? value) {
    final l = value?.trim().length ?? double.infinity;

    if (l < length) return errorMessage;

    return null;
  }
}
