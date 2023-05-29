
class Room {
  final String id;
  final String name;
  final String description;
  final double price;
  final bool isAvailable;

  Room({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.isAvailable,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      isAvailable: json['isAvailable'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'isAvailable': isAvailable,
    };
  }
}