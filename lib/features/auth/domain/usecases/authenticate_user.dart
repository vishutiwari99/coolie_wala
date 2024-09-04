import '../repositories/auth_repository.dart';

class AuthenticateUser {
  final AuthRepository repository;

  AuthenticateUser(this.repository);

  Future<String> call(String phoneNumber) async {
    return await repository.sendOtp(phoneNumber);
  }
}
