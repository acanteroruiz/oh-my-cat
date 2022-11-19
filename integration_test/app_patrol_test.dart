import 'package:flutter_test/flutter_test.dart';
import 'package:oh_my_cat/app/app.dart';
import 'package:oh_my_cat/features/login/presentation/widgets/login_button.dart';
import 'package:oh_my_cat/features/login/presentation/widgets/password_textfield.dart';
import 'package:oh_my_cat/features/login/presentation/widgets/username_textfield.dart';
import 'package:oh_my_cat/features/random_cat/presentation/pages/random_cat_page.dart';
import 'package:patrol/patrol.dart';

const userName = 'La Fluttertulia';
const invalidPassword = 'Psswrd';
const validPassword = '{[()]}';

void main() {
  patrolTest(
    'App works fine with patrol',
    ($) async {
      await $.pumpWidgetAndSettle(const App());

      await $(UsernameTextField).enterText(userName);
      await $(PasswordTextField).enterText(invalidPassword);

      await $(LoginButton).tap();
      expect($(RandomCatPage), findsNothing);
      await Future<void>.delayed(const Duration(seconds: 2));

      await $(PasswordTextField).enterText(validPassword);
      await $(LoginButton).tap();

      await $(RandomCatPage).waitUntilVisible();

      await $(SuccessImage).waitUntilVisible();
    },
  );
}
