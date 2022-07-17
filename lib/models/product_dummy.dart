import 'dart:convert';

class Product {
  int? id;
  String? name;
  String? description;
  int? unitPrice;
  Product({
    this.id,
    this.name,
    this.description,
    this.unitPrice
  });

  Product copyWith({
    int? id,
    String? name,
    String? description,
    int? unitPrice,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? name,
      description: description ?? description,
      unitPrice: unitPrice ?? unitPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'unitPrice': unitPrice,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      unitPrice: map['unitPrice'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));

  @override
  String toString() => 'Product(id: $id, name: $name, description: $description, unitPrice: $unitPrice,)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product && other.id == id && other.name == name && other.description == description && other.unitPrice == unitPrice;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ description.hashCode ^ unitPrice.hashCode;
}
