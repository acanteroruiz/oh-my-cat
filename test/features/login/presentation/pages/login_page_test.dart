import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:oh_my_cat/features/login/login.dart';

import '../../../../widget_test_tools.dart';

class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late LoginBloc loginBloc;

  setUp(() {
    loginBloc = MockLoginBloc();
  });

  group('LoginPage widget', () {
    testWidgets(
        'has AppBar with title, UserNameTextField, PasswordTextField and LoginButton',
        (WidgetTester tester) async {
      whenListen(
        loginBloc,
        Stream.fromIterable([
          const LoginState(),
        ]),
      );

      await expectLater(
        loginBloc.stream,
        emitsInOrder(
          <LoginState>[
            const LoginState(),
          ],
        ),
      );

      await createClassToTest(
        tester,
        BlocProvider(
          create: (_) => loginBloc,
          child: const LoginView(),
        ),
      );

      final appBar = find.byType(AppBar);
      expect(appBar, findsOneWidget);

      final appBarText = find.text('Oh My Cat!');
      expect(appBarText, findsOneWidget);

      final userNameTextField = find.byType(UsernameTextField);
      expect(userNameTextField, findsOneWidget);

      final passwordTextField = find.byType(PasswordTextField);
      expect(passwordTextField, findsOneWidget);

      final loginButton = find.byType(LoginButton);
      expect(loginButton, findsOneWidget);
    });

    testWidgets('login button disabled when status invalid',
        (WidgetTester tester) async {
      whenListen(
        loginBloc,
        Stream.fromIterable([
          const LoginState(),
        ]),
      );

      await expectLater(
        loginBloc.stream,
        emitsInOrder(
          <LoginState>[
            const LoginState(),
          ],
        ),
      );

      await createClassToTest(
        tester,
        BlocProvider(
          create: (_) => loginBloc,
          child: const LoginView(),
        ),
      );

      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.enabled, isFalse);
    });

    testWidgets('login button enabled when status is valid',
        (WidgetTester tester) async {
      whenListen(
        loginBloc,
        Stream.fromIterable([
          const LoginState(
            username: Username.dirty('username'),
            password: Password.dirty('{[]}'),
            status: FormzStatus.valid,
          ),
        ]),
      );

      await expectLater(
        loginBloc.stream,
        emitsInOrder(
          <LoginState>[
            const LoginState(
              username: Username.dirty('username'),
              password: Password.dirty('{[]}'),
              status: FormzStatus.valid,
            ),
          ],
        ),
      );

      await createClassToTest(
        tester,
        BlocProvider(
          create: (_) => loginBloc,
          child: const LoginView(),
        ),
      );

      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.enabled, isTrue);
    });
  });
}
