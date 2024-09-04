import '../repositories/auth_repository.dart';

class SaveAddress {
  final AuthRepository repository;

  SaveAddress(this.repository);

  Future<void> call(String userId, String address) async {
    await repository.saveAddress(userId, address);
  }
}
