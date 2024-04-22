class Token {
  final String token;
  final String userId;

  Token({
    required this.token,
    required this.userId,
  });

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      token: json['token'],
      userId: json['userId'],
    );
  }

  factory Token.empty() {
    return Token(
      token: '',
      userId: '',
    );
  }
}
