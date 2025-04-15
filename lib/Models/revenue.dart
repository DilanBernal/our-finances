class Revenue {
  final int id;
  final int idUser;
  final String name;
  final DateTime date;
  final String description;
  final double price;
  final int category;

  Revenue({
    required this.id,
    required this.idUser,
    required this.name,
    required this.date,
    required this.description,
    required this.price,
    required this.category
  });
  factory Revenue.fromJson(Map<String, dynamic> json) {
    return Revenue(
        id: json['id'],
        idUser: json['idUser'],
        name: json['name'],
        date: json['date'],
        description: json['description'],
        price: json['price'],
        category: json['category']
    );
  }
}