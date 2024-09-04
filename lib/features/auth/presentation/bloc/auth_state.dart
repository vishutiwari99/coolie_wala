import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/user.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

@immutable
class OtpSent extends AuthState {
  final String verificationId;

  OtpSent({required this.verificationId});
}

class Authenticated extends AuthState {
  final UserEntity user;

  Authenticated({required this.user});

  @override
  List<Object?> get props => [user];
}

class AddressSaved extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});

  @override
  List<Object?> get props => [message];
}
