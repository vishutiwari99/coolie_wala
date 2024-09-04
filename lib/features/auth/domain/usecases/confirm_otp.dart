import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class ConfirmOtp {
  final AuthRepository repository;

  ConfirmOtp(this.repository);

  Future<UserEntity?> call(String verificationId, String otp) async {
    return await repository.verifyOtp(verificationId, otp);
  }
}
