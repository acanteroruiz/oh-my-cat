// ignore_for_file: prefer_const_constructors
import 'package:flutter_test/flutter_test.dart';
import 'package:oh_my_cat/features/login/domain/models/password.dart';

import '../helper/validator_helper_test.dart';

const invalidPasswordString = invalidPassword1;
const validPasswordString = validPassword;

void main() {
  group('Password', () {
    group('constructors', () {
      test('pure creates correct instance', () {
        final password = Password.pure();
        expect(password.value, '');
        expect(password.pure, true);
      });

      test('dirty creates correct instance', () {
        final password = Password.dirty(invalidPasswordString);
        expect(password.value, invalidPasswordString);
        expect(password.pure, false);
      });
    });

    group('validator', () {
      test('returns invalid error when password is empty', () {
        expect(
          Password.dirty().error,
          PasswordValidationError.invalid,
        );
      });

      test('returns invalid error when password is invalid', () {
        expect(
          Password.dirty(invalidPasswordString).error,
          PasswordValidationError.invalid,
        );
      });

      test('is valid when password matches a parenthesis valid pattern', () {
        expect(
          Password.dirty(validPasswordString).error,
          isNull,
        );
      });
    });
  });
}
