import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/authenticate_user.dart';
import '../../domain/usecases/confirm_otp.dart';
import '../../domain/usecases/save_address.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticateUser authenticateUser;
  final ConfirmOtp confirmOtp;
  final SaveAddress saveAddress;

  AuthBloc({
    required this.authenticateUser,
    required this.confirmOtp,
    required this.saveAddress,
  }) : super(AuthInitial()) {
    on<SendOtpEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final verificationId = await authenticateUser(event.phoneNumber);
        emit(OtpSent(verificationId: verificationId));
      } catch (e) {
        emit(AuthError(message: e.toString()));
      }
    });

    on<ConfirmOtpEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await confirmOtp(event.verificationId, event.otp);
        if (user != null) {
          emit(Authenticated(user: user));
        } else {
          emit(AuthError(message: "OTP verification failed"));
        }
      } catch (e) {
        emit(AuthError(message: e.toString()));
      }
    });

    on<SaveAddressEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await saveAddress(event.userId, event.address);
        emit(AddressSaved());
      } catch (e) {
        emit(AuthError(message: e.toString()));
      }
    });

    on<CheckAuthStatusEvent>((event, emit) async {
      final user = authenticateUser.repository.getCurrentUser();
      if (user != null) {
        emit(Authenticated(user: user));
      } else {
        emit(AuthInitial());
      }
    });
  }
}
