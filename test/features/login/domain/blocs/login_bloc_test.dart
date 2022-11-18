import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:oh_my_cat/features/login/login.dart';

import '../helper/validator_helper_test.dart';
import '../models/username_test.dart';

void main() {
  late LoginBloc bloc;

  setUp(() {
    bloc = LoginBloc();
  });

  group('LoginBloc', () {
    test('initial state is LoginState', () {
      final loginBloc = LoginBloc();
      expect(loginBloc.state, const LoginState());
    });

    group('LoginSubmitted', () {
      blocTest<LoginBloc, LoginState>(
        'emits [submissionInProgress, submissionSuccess] '
        'when login succeeds',
        build: () => bloc,
        act: (bloc) {
          bloc
            ..add(const LoginUserNameChanged(validUsername))
            ..add(const LoginPasswordChanged(invalidPassword1))
            ..add(const LoginPasswordChanged(validPassword));
        },
        expect: () => const <LoginState>[
          LoginState(
            username: Username.dirty(validUsername),
            status: FormzStatus.invalid,
          ),
          LoginState(
            username: Username.dirty(validUsername),
            password: Password.dirty(invalidPassword1),
            status: FormzStatus.invalid,
          ),
          LoginState(
            username: Username.dirty(validUsername),
            password: Password.dirty(validPassword),
            status: FormzStatus.valid,
          ),
        ],
      );
    });
  });
}
