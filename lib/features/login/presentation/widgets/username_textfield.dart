import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oh_my_cat/features/login/domain/blocs/login_bloc.dart';
import 'package:oh_my_cat/features/login/domain/blocs/login_event.dart';
import 'package:oh_my_cat/l10n/l10n.dart';

class UsernameTextField extends StatelessWidget {
  const UsernameTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return TextField(
      decoration: InputDecoration(
        labelText: l10n.loginTextFieldUserName,
      ),
      onChanged: (value) {
        BlocProvider.of<LoginBloc>(context).add(
          LoginUserNameChanged(value),
        );
      },
    );
  }
}
