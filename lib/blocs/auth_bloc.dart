import 'package:bloc/bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>(_authEventHandler);
  }

  Future<void> _authEventHandler(AuthEvent e, Emitter<dynamic> emit) async {
    emit(AuthInitial());
  }
}
