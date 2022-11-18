// ignore_for_file: prefer_const_constructors
import 'package:flutter_test/flutter_test.dart';
import 'package:oh_my_cat/features/login/domain/models/username.dart';

const validUsername = 'username';

void main() {
  group('Username', () {
    group('constructors', () {
      test('pure creates correct instance', () {
        final username = Username.pure();
        expect(username.value, '');
        expect(username.pure, true);
      });

      test('dirty creates correct instance', () {
        final username = Username.dirty(validUsername);
        expect(username.value, validUsername);
        expect(username.pure, false);
      });
    });

    group('validator', () {
      test('returns empty error when username is empty', () {
        expect(
          Username.dirty().error,
          UsernameValidationError.invalid,
        );
      });

      test('is valid when username is not empty', () {
        expect(
          Username.dirty(validUsername).error,
          isNull,
        );
      });
    });
  });
}
