import 'package:coolie_wala/core/error/exceptions.dart';
import 'package:coolie_wala/core/error/failure.dart';
import 'package:coolie_wala/features/auth/data/datasources/auth_firebase_data_source.dart';
import 'package:coolie_wala/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthFirebaseDataSource authFirebaseDataSource;
  const AuthRepositoryImpl(this.authFirebaseDataSource);

  @override
  Future<Either<Failure, String>> loginWithPhoneNumber(
      {required String phoneNumber, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithPhoneNumber({
    required String firmName,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    try {
      final verificationId = await authFirebaseDataSource.signUpWithPhoneNumber(
        firmName: firmName,
        email: email,
        password: password,
        phoneNumber: phoneNumber,
      );
      return right(verificationId);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
