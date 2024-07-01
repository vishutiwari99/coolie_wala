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
  @override
  Future<String> loginWithPhoneNumber(
      {required String phoneNumber, required String password}) {
    // TODO: implement loginWithPhoneNumber
    throw UnimplementedError();
  }

  @override
  Future<String> signUpWithPhoneNumber(
      {required String firmName,
      required String email,
      required String password,
      required String phoneNumber}) {
    // TODO: implement signUpWithPhoneNumber
    throw UnimplementedError();
  }
}
