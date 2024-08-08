part of 'auth_bloc.dart';



@immutable
sealed class AuthEvent extends Equatable {}

final class AuthSignUp extends AuthEvent {
  final String email;
  final String password;
  final String firmName;
  final String phoneNumber;

  AuthSignUp(
      {required this.email,
      required this.password,
      required this.firmName,
      required this.phoneNumber});
      
        @override
        List<Object?> get props => [];
}

class OtpCodeSent extends AuthEvent {
  final String verificationId;

  OtpCodeSent(this.verificationId);

  @override
  List<Object> get props => [verificationId];
}
