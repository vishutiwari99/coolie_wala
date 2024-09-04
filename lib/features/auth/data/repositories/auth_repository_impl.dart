import 'package:coolie_wala/features/auth/domain/entities/user.dart';
import 'package:coolie_wala/features/auth/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../datasources/firebase_auth_datasource.dart';
import '../datasources/firestore_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDataSource firebaseAuthDataSource;
  final FirestoreDataSource firestoreDataSource;

  AuthRepositoryImpl({
    required this.firebaseAuthDataSource,
    required this.firestoreDataSource,
  });

  @override
  Future<String> sendOtp(String phoneNumber) async {
    return await firebaseAuthDataSource.sendOtp(phoneNumber);
  }

  @override
  Future<UserEntity?> verifyOtp(String verificationId, String otp) async {
    User? user = await firebaseAuthDataSource.verifyOtp(verificationId, otp);
    if (user != null) {
      Map<String, dynamic>? userData =
          await firestoreDataSource.getUserData(user.uid);
      return UserEntity(
        userId: user.uid,
        phoneNumber: user.phoneNumber ?? '',
        address: userData?['address'],
      );
    }
    return null;
  }

  @override
  Future<void> saveAddress(String userId, String address) async {
    await firestoreDataSource.saveUserData(
      userId,
      {'address': address},
    );
  }

  @override
  UserEntity? getCurrentUser() {
    User? user = firebaseAuthDataSource.getCurrentUser();
    if (user != null) {
      return UserEntity(userId: user.uid, phoneNumber: user.phoneNumber ?? '');
    }
    return null;
  }

  @override
  Future<void> signOut() async {
    await firebaseAuthDataSource.signOut();
  }
}
