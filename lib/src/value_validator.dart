/// The base class for form validation in a Dart/Flutter form validation library.
///
/// This abstract class provides a structure for implementing form validation
/// rules on different types of values. It allows you to define custom validators
/// by subclassing this class and implementing the [validate] method.
///
/// Example usage:
/// ```dart
/// class IsBinaryNumberValidator implements ValueValidator<String> {
///   const IsBinaryNumberValidator()
///       : super(errorMessage: "Please enter valid binary number");
///
///   @override
///   String? validate(String? value) {
///     if (value == null) return errorMessage;
///
///     final num = int.tryParse(value, radix: 2);
///
///     if (num == null) return errorMessage;
///
///     return null;
///   }
/// }
/// ```
///
/// To use the validator, create an instance of the subclass and call the [validate]
/// method with the value you want to validate. If the value is valid, the [validate]
/// method should return `null`, otherwise, it should return an error message
/// indicating the reason for validation failure.
///
/// The generic type parameter `T` allows you to use the `ValueValidator` class
/// with different types of values. For example, you can create a `ValueValidator<int>`
/// to validate integer values, or a `ValueValidator<DateTime>` to validate dates.
/// This flexibility enables you to use the validator with various form fields,
/// including dropdown buttons, custom form fields, or any other input that has
/// values other than strings.
abstract class ValueValidator<T> {
  /// Validates the provided [value].
  ///
  /// Subclasses should implement this method to perform the actual validation logic
  /// on the value of type [T]. If the value is valid, this method should return `null`,
  /// otherwise, it should return a string error message indicating the reason for
  /// validation failure.
  String? validate(T? value);
}
