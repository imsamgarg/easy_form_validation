import 'package:easy_form_validation/src/value_validator.dart';

/// A custom validator that allows you to provide a custom validation function.
///
/// This validator allows you to define a custom validation function that takes
/// a value of type `T` and returns a string (the error message) or `null` if
/// the value is valid. You can use this validator to implement your own custom
/// validation logic that is not covered by the built-in validators.
///
/// Example usage:
/// ```dart
/// TextFormField(
///   validator: (value) {
///     return ValidatorGroup<String>([
///       RequiredValidator(errorMessage: 'This field is required.'),
///       MinLengthValidator(8, errorMessage: 'Password must be atleast 8 characters long.'),
///       CustomValidator<String>(
///         validator: (value) {
///           final pass = passwordController.text;
///           if(value != pass) {
///             return "Passwords do not match";
///           }
///           return null;
///       },
///     )
///     ]).validate(value);
///     return .validate(value);
///   },
///   decoration: InputDecoration(
///     labelText: 'Confirm Password',
///   ),
/// ),
/// ```
class CustomValidator<T> extends ValueValidator<T> {
  /// The custom validation function.
  final String? Function(T? value) validator;

  /// Creates a new instance of [CustomValidator].
  ///
  /// The [validator] parameter is the custom validation function that takes
  /// a value of type `T` and returns a string (the error message) or `null`
  /// if the value is valid.
  CustomValidator({required this.validator});

  @override
  String? validate(T? value) => validator(value);
}
