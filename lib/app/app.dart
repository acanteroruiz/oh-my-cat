import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oh_my_cat/features/login/presentation/pages/login_page.dart';
import 'package:oh_my_cat/l10n/l10n.dart';

const Color cuatroGatosColor = Color(0xFF00ad9c);

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: cuatroGatosColor,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.teal[600],
          secondary: cuatroGatosColor,
        ),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const LoginPage(),
    );
  }
}
