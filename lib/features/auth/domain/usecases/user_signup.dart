import 'package:coolie_wala/core/error/failure.dart';
import 'package:coolie_wala/core/usecase/usecase.dart';
import 'package:coolie_wala/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignup implements UseCase<String, UserSignupParams> {
  final AuthRepository authRepository;

  const UserSignup(this.authRepository);
  @override
  Future<Either<Failure, String>> call(UserSignupParams params) async {
    return await authRepository.signUpWithPhoneNumber(
      firmName: params.firmName,
      email: params.email,
      password: params.password,
      phoneNumber: params.phoneNumber,
    );
  }
}

class UserSignupParams {
  final String email;
  final String password;
  final String firmName;
  final String phoneNumber;

  UserSignupParams(
      {required this.email,
      required this.password,
      required this.firmName,
      required this.phoneNumber
      }
      );
}
