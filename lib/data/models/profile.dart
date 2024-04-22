class Profile {
  final String name;
  final String email;
  final String photo;
  final String phoneNum;
  final String address;

  Profile({
    required this.name,
    required this.email,
    required this.photo,
    required this.phoneNum,
    required this.address,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json['name'],
      email: json['email'],
      photo: json['photo'],
      phoneNum: json['phoneNum'],
      address: json['address'],
    );
  }

  factory Profile.empty() {
    return Profile(
      name: '',
      email: '',
      photo: '',
      phoneNum: '',
      address: '',
    );
  }
}
