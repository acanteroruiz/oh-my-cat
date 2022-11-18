import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:oh_my_cat/app/app.dart';
import 'package:oh_my_cat/features/login/presentation/pages/login_page.dart';
import 'package:oh_my_cat/features/login/presentation/widgets/login_button.dart';
import 'package:oh_my_cat/features/login/presentation/widgets/password_textfield.dart';
import 'package:oh_my_cat/features/login/presentation/widgets/username_textfield.dart';
import 'package:oh_my_cat/features/random_cat/presentation/pages/random_cat_page.dart';
import 'package:oh_my_cat/main_production.dart' as app;

const userName = 'La Fluttertulia';
const invalidPassword = 'Psswrd';
const validPassword = '{[()]}';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('App works fine', (tester) async {
    app.main();

    FlutterError.onError = (FlutterErrorDetails details) {
      if (kDebugMode) {
        print(details.toString());
      }
    };

    await tester.pumpWidget(const App());
    await tester.pumpAndSettle();

    await Future<void>.delayed(const Duration(seconds: 1));

    //LOGIN PAGE
    final loginPage = find.byType(LoginPage);
    expect(loginPage, findsOneWidget);

    final userNameTextField = find.byType(UsernameTextField);
    expect(userNameTextField, findsOneWidget);

    await tester.enterText(userNameTextField, userName);
    await tester.pumpAndSettle();
    final userNameText = find.text(userName);
    expect(userNameText, findsOneWidget);

    final passwordTextField = find.byType(PasswordTextField);
    expect(passwordTextField, findsOneWidget);

    await tester.enterText(passwordTextField, invalidPassword);
    await tester.pumpAndSettle();
    var passWordText = find.text(invalidPassword);
    expect(passWordText, findsOneWidget);

    final loginButton = find.byType(LoginButton);
    expect(loginButton, findsOneWidget);
    final button = tester.widget<ElevatedButton>(
      find.byType(ElevatedButton),
    );
    expect(button.enabled, isFalse);

    await tester.enterText(passwordTextField, validPassword);
    await tester.pumpAndSettle();
    passWordText = find.text(validPassword);
    expect(passWordText, findsOneWidget);

    expect(button.enabled, isFalse);

    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    //RANDOM CAT PAGE
    final randomCatPage = find.byType(RandomCatPage);
    expect(randomCatPage, findsOneWidget);
    await tester.pumpAndSettle();
    await Future<void>.delayed(const Duration(seconds: 2));

    final successImage = find.byType(SuccessImage);
    expect(successImage, findsOneWidget);
    await tester.pumpAndSettle();

    await Future<void>.delayed(const Duration(seconds: 2));
  });
}
