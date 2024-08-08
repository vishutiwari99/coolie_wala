import 'package:coolie_wala/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signUpWithPhoneNumber({
    required String firmName,
    required String email,
    required String password,
    required String phoneNumber, 

  });
  Future<Either<Failure, String>> loginWithPhoneNumber({
    required String phoneNumber,
    required String password,
  });
}
