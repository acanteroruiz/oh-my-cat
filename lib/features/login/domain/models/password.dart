import 'package:formz/formz.dart';
import 'package:oh_my_cat/features/login/domain/helper/validator_helper.dart';

enum PasswordValidationError { invalid }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String value) {
    return (value.isNotEmpty && evaluateParenthesis(value))
        ? null
        : PasswordValidationError.invalid;
  }
}
