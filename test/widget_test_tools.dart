import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oh_my_cat/l10n/l10n.dart';

Widget buildWidget(Widget child) {
  return Material(
    child: Directionality(
      textDirection: TextDirection.ltr,
      child: MediaQuery(
        data: const MediaQueryData(),
        child: Localizations(
          delegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          locale: const Locale('es'),
          child: child,
        ),
      ),
    ),
  );
}

Future<void> createClassToTest(WidgetTester tester, Widget child) async {
  final classToTest = buildWidget(child);

  await tester.pumpWidget(classToTest);
  await tester.pumpAndSettle();
}
