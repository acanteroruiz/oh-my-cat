import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:oh_my_cat/features/login/domain/blocs/login_event.dart';
import 'package:oh_my_cat/features/login/domain/blocs/login_state.dart';
import 'package:oh_my_cat/features/login/domain/models/models.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginUserNameChanged>(_usernameChanged);

    on<LoginPasswordChanged>(_passwordChanged);
  }

  void _usernameChanged(
    LoginUserNameChanged event,
    Emitter<LoginState> emit,
  ) {
    final username = Username.dirty(event.username);
    emit(
      LoginState(
        username: username,
        password: state.password,
        status: Formz.validate(
          [
            username,
            state.password,
          ],
        ),
      ),
    );
  }

  void _passwordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(
      LoginState(
        username: state.username,
        password: password,
        status: Formz.validate(
          [
            state.username,
            password,
          ],
        ),
      ),
    );
  }
}
