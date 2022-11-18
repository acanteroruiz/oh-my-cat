import 'package:flutter/material.dart';
import 'package:oh_my_cat/features/random_cat/presentation/pages/random_cat_page.dart';
import 'package:oh_my_cat/l10n/l10n.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    this.isValid = false,
  });

  final bool isValid;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: isValid ? Colors.white : Colors.black87,
        backgroundColor: isValid ? Colors.blue : Colors.grey[300],
        minimumSize: const Size(88, 36),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2)),
        ),
      ),
      onPressed: isValid ? () => navigateToRandomCatPage(context) : null,
      child: Text(l10n.loginButton),
    );
  }

  void navigateToRandomCatPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const RandomCatPage(),
      ),
    );
  }
}
