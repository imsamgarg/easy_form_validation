import 'package:easy_form_validation/src/value_validator.dart';

/// A validator that checks whether a value is required or not.
///
/// This validator checks whether a value is provided and not null or an empty string.
/// If the value is null or an empty string, it returns the specified error message.
///
/// Example usage:
/// ```dart
/// TextFormField(
///   validator: (value) {
///     return RequiredValidator(errorMessage: 'This field is required.').validate(value);
///   },
///   decoration: InputDecoration(
///     labelText: 'Field',
///   ),
/// ),
/// ```
class RequiredValidator<T> implements ValueValidator<T> {
  /// The error message to be returned if the value is required but not provided.
  final String errorMessage;

  /// Creates a new instance of [RequiredValidator].
  ///
  /// The [errorMessage] parameter is the error message to be returned if the value is required
  /// but not provided.
  const RequiredValidator({required this.errorMessage});

  @override
  String? validate(T? value) {
    if (value == null) return errorMessage;

    if (value is String && value.trim().isEmpty) return errorMessage;

    return null;
  }
}
