// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Item {
  int? id;
  String? name;
  String? desc;
  double? price;
  String? image;
  String? category;
  Item({
    this.id,
    this.name,
    this.desc,
    this.price,
    this.image,
    this.category,
  });

  Item copyWith({
    int? id,
    String? name,
    String? desc,
    double? price,
    String? image,
    String? category,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      image: image ?? this.image,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'image': image,
      'category': category,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      desc: map['desc'] != null ? map['desc'] as String : null,
      price: map['price'] != null ? map['price'] as double : null,
      image: map['image'] != null ? map['image'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, image: $image, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.image == image &&
        other.category == category;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        image.hashCode ^
        category.hashCode;
  }
}
