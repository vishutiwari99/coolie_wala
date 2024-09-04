import '../entities/user.dart';

abstract class AuthRepository {
  Future<String> sendOtp(String phoneNumber);
  Future<UserEntity?> verifyOtp(String verificationId, String otp);
  Future<void> saveAddress(String userId, String address);
  UserEntity? getCurrentUser();
  Future<void> signOut();
}
