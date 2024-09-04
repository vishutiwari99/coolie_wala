import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SendOtpEvent extends AuthEvent {
  final String phoneNumber;

  SendOtpEvent(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

class ConfirmOtpEvent extends AuthEvent {
  final String verificationId;
  final String otp;

  ConfirmOtpEvent(this.verificationId, this.otp);

  @override
  List<Object> get props => [verificationId, otp];
}

class SaveAddressEvent extends AuthEvent {
  final String userId;
  final String address;

  SaveAddressEvent(this.userId, this.address);

  @override
  List<Object> get props => [userId, address];
}

class CheckAuthStatusEvent extends AuthEvent {}
