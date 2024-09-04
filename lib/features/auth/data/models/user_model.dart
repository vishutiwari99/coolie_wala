class UserModel {
  final String userId;
  final String phoneNumber;
  final String? address;

  UserModel({
    required this.userId,
    required this.phoneNumber,
    this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'phoneNumber': phoneNumber,
      'address': address,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'],
      phoneNumber: map['phoneNumber'],
      address: map['address'],
    );
  }
}
