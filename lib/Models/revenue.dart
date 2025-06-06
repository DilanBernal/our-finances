class Revenue {
  final int id;
  final int idUser;
  String name;
  DateTime date;
  String? description;
  final double price;
  final int category;
  bool inCloud;

  Revenue(
      {required this.id,
      required this.idUser,
      required this.name,
      required this.date,
      this.description,
      required this.price,
      required this.category,
      required this.inCloud});

  Map<String, dynamic> toMap() {
    return {
      'id_user': idUser,
      'name': name,
      'date': date.toString(),
      'description': description,
      'price': price,
      'category': category,
      'inCloud': inCloud == true ? 1 : 0
    };
  }
  factory Revenue.fromMap(Map<String, dynamic> map) {
    return Revenue(
        id: map['id'],
        idUser: map['idUser'],
        name: map['name'],
        date: (map['date']).toDateTime(),
        price: (map['price'] as num).toDouble(),
        category: map['category'],
        inCloud: map['inCloud'] == 1
    );
  }

  factory Revenue.fromJson(Map<String, dynamic> json) {
    return Revenue(
        id: json['id'],
        idUser: json['idUser'],
        name: json['name'],
        date: json['date'],
        description: json['description'],
        price: json['price'],
        category: json['category'],
        inCloud: json['inCloud'] == 1
    );
  }
}
