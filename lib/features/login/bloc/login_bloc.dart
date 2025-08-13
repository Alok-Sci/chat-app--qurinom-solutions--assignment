import 'package:chat_app__qurinom_solutions__assignment/core/api/api_service.dart';
import 'package:chat_app__qurinom_solutions__assignment/features/login/bloc/login_events.dart';
import 'package:chat_app__qurinom_solutions__assignment/features/login/bloc/login_states.dart';
import 'package:chat_app__qurinom_solutions__assignment/features/login/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiService api;
  LoginBloc({required this.api}) : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());

      try {
        final response = await api.login(
          event.email,
          event.password,
          event.role,
        );

        emit(LoginSuccess(User.fromJson(response["data"]["user"])));
      } catch (e) {
        emit(LoginFailure(e.toString()));
      }
    });
  }
}
