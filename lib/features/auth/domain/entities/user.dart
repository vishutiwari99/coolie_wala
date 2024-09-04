class UserEntity {
  final String userId;
  final String phoneNumber;
  final String? address;

  UserEntity({
    required this.userId,
    required this.phoneNumber,
    this.address,
  });
}
