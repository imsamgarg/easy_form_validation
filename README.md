The `easy_form_validation` library provides a declarative approach for form validation in Dart and Flutter applications. It offers a collection of form validation classes that allow you to easily validate user input in form fields.

## Usage

### ValidatorGroup

The ValidatorGroup class allows you to group multiple validators and apply them in sequence. It returns the first error message encountered during validation, or null if all validators pass.

Example usage:

```dart
TextFormField(
  validator: (value) {
    return ValidatorGroup<String>([
      RequiredValidator<String>(errorMessage: 'This field is required.'),
      MinLengthValidator(8, errorMessage: 'Password must be atleast 8 characters long.'),
      CustomValidator<String>(
        validator: (value) {
          final password = passwordController.text;
          if (value != password) {
            return "Passwords do not match";
          }
          return null;
        },
      ),
    ]).validate(value);
  },
  decoration: InputDecoration(
    labelText: 'Confirm Password',
  ),
),
```
In the above example, the ValidatorGroup is used to validate a TextFormField. It applies a RequiredValidator to ensure the field is not empty and a MinLengthValidator to ensure minimum input length.Additionally, a CustomValidator is used to check if the confirm password matches the entered password. If any of the validators fail, the corresponding error message is returned

You can also use a single validator as well.

```dart
TextFormField(
  validator: (value) {
    return RequiredValidator<String>(errorMessage: 'This field is required.').validate(value);
  },
  decoration: InputDecoration(
    labelText: 'Name',
  ),
),

Or
// validate method has same signature as FormField's validator method so you can also use this.
TextFormField(
  validator: RequiredValidator<String>(errorMessage: 'This field is required.').validate,
  decoration: InputDecoration(
    labelText: 'Name',
  ),
),
```

All the validators accept a generic type `T` which allows us to use validators with any kind of value.Example use in dropdown fields

```dart
class Option {
  final int id;
  final String name;

  Option(this.id, this.name);
}

DropdownButtonFormField<Option>(
  ...
  validator: RequiredValidator<Option>(errorMessage: 'Please select an option.').validate,
),

```

List of all validators available

- `RequiredValidator`: Validates that a value is not empty or null.
- `MinLengthValidator`: Validates that a string value has a minimum length.
- `MaxLengthValidator`: Validates that a string value does not exceed a maximum length.
- `ExactLengthValidator`: Validates that a string value has an exact length.
- `EmailValidator`: Validates that a string value is a valid email address.
- `DigitsOnlyValidator`: Validates that a string value contains only digits.
- `AlphabetsOnlyValidator`: Validates that a string value contains only alphabets.
- `CustomValidator`: Allows you to define a custom validation function.
- `IsIntValidator`: Validates that a string value can be parsed as an integer.
- `IsDoubleValidator`: Validates that a string value can be parsed as a double.
- `PatternValidator`: Validates that a string value matches a specified pattern using a regular expression.
- `PatternNotAllowedValidator`: Validates that a string value does not match a specified pattern.
- `ValidatorGroup`: Groups multiple validators together and applies them in sequence.
- `RegexValidator`: Validates that a string value matches a specified regular expression pattern.
- `RegexNotAllowedValidator`: Validates that a string value does not match a specified regular expression pattern.

