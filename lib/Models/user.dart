class User {
  final int id;
  final String name;
  final double balance;

  User({required this.id, required this.name, required this.balance});
  Map<String, dynamic> toMap() {
    return {'name': name, 'balance': balance};
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(id: map['id'], name: map['name'], balance: (map['balance'] as num).toDouble());
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(id: json['id'], name: json['name'], balance: json['balance']);
  }
}
