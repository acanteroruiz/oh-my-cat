import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:oh_my_cat/features/login/login.dart';
import 'package:oh_my_cat/l10n/l10n.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final loginState = context.watch<LoginBloc>().state;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/cuatro_gatos_logo.png'),
              const SizedBox(
                height: 24,
              ),
              const UsernameTextField(),
              const SizedBox(
                height: 24,
              ),
              const PasswordTextField(),
              const SizedBox(
                height: 36,
              ),
              LoginButton(
                isValid: loginState.status == FormzStatus.valid,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
