import 'package:easy_form_validation/src/value_validator.dart';

/// A validator that checks whether a string value meets a maximum length requirement.
///
/// This validator checks whether a string value meets a maximum length requirement.
/// It compares the length of the value with the specified maximum length. If the length
/// exceeds the maximum, it returns the specified error message.
///
/// Example usage:
/// ```dart
/// TextFormField(
///   validator: (value) {
///     return MaxLengthValidator(
///       10,
///       errorMessage: 'Value must not exceed 10 characters.',
///     ).validate(value);
///   },
///   decoration: InputDecoration(
///     labelText: 'Field',
///   ),
/// ),
/// ```
class MaxLengthValidator implements ValueValidator<String> {
  /// The maximum length allowed for the string value.
  final int length;

  /// The error message to be returned if the value exceeds the maximum length.
  final String errorMessage;

  /// Creates a new instance of [MaxLengthValidator].
  ///
  /// The [length] parameter is the maximum length allowed for the string value.
  /// The [errorMessage] parameter is the error message to be returned if the value exceeds the maximum length.
  const MaxLengthValidator(this.length, {required this.errorMessage});

  @override
  String? validate(String? value) {
    final l = value?.length ?? 0;

    if (l > length) return errorMessage;

    return null;
  }
}
