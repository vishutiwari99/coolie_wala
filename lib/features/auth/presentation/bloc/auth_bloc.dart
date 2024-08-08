import 'package:coolie_wala/features/auth/domain/usecases/user_signup.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignup _userSignup;
  AuthBloc({required UserSignup userSignup})
      : _userSignup = userSignup,
        super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      final res = await _userSignup(UserSignupParams(
          email: event.email,
          password: event.password,
          firmName: event.firmName,
          phoneNumber: event.phoneNumber));
      res.fold(
          (l) => emit(AuthFailure(l.message)), (r) => emit(AuthSuccess(r)));
    });
    on<OtpCodeSent>((OtpCodeSent event, Emitter<AuthState> emit) async {
      emit(AuthOtpSent(event.verificationId));
    });
  }
}
