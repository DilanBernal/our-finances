class User {
  final int id;
  final String name;
  final double balance;

  User({
    required this.id,
    required this.name,
    required this.balance
  });
  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'name': name,
      'balance': balance
    };
  }

  factory User.fromMap(Map<String, dynamic> map){
    return User(
        id: map['id'],
        name: map['name'],
        balance: map['balance']
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        name: json['name'],
        balance: json['balance']
    );
  }
}
