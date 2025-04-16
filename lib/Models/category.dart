class Category {
  final int id;
  String name;
  String icon;
  bool inCloud;

  Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.inCloud
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'inCloud': inCloud == true ? 1 : 0
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      name: map['name'],
      icon: map['name'],
      inCloud: map['name'] == 1
    );
  }
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      inCloud: json['inCloud'] == 1
    );
  }
}
