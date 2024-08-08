import 'dart:async';

import 'package:coolie_wala/core/error/exceptions.dart';
import 'package:coolie_wala/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract interface class AuthFirebaseDataSource {
  Future<String> signUpWithPhoneNumber({
    required String firmName,
    required String email,
    required String password,
    required String phoneNumber,
  });
  Future<String> loginWithPhoneNumber({
    required String phoneNumber,
    required String password,
  });
}

class AuthFirebaseDataSourceImpl extends AuthFirebaseDataSource {
  final FirebaseAuth _firebaseAuth;

  AuthFirebaseDataSourceImpl(this._firebaseAuth);

  @override
  Future<String> loginWithPhoneNumber(
      {required String phoneNumber, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<String> signUpWithPhoneNumber({
    required String firmName,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    Completer<String> completer = Completer<String>();

    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: '+91$phoneNumber',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _firebaseAuth.signInWithCredential(credential);
          if (!completer.isCompleted) {
            completer.complete('Verification completed');
          }
        },
        verificationFailed: (FirebaseAuthException error) {
          if (!completer.isCompleted) {
            completer.completeError(
                ServerException(message: error.message ?? 'Unknown error'));
          }
        },
        codeSent: (String verificationId, int? forceResendingToken) {
          if (!completer.isCompleted) {
            // context.read<AuthBloc>().add(OtpCodeSent(verificationId));
            completer.complete(verificationId);
          }
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Handle auto retrieval timeout
          debugPrint('Auto retrieval timeout: $verificationId');
          if (!completer.isCompleted) {
            completer.complete(verificationId);
          }
        },
      );
    } catch (e) {
      if (!completer.isCompleted) {
        completer.completeError(ServerException(message: e.toString()));
      }
    }

    return completer.future;
  }
}
