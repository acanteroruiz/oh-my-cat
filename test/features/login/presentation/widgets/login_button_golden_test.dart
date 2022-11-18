import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oh_my_cat/features/login/presentation/widgets/login_button.dart';

import '../../../../widget_test_tools.dart';

void main() {
  group('LoginButton Golden Tests', () {
    goldenTest(
      'renders correctly',
      fileName: 'login_button',
      builder: () => GoldenTestGroup(
        scenarioConstraints: const BoxConstraints(maxWidth: 600),
        children: [
          GoldenTestScenario(
            name: 'not is valid',
            child: buildWidget(
              const LoginButton(),
            ),
          ),
          GoldenTestScenario(
            name: 'is valid',
            child: buildWidget(
              const LoginButton(
                isValid: true,
              ),
            ),
          ),
        ],
      ),
    );
  });
}
