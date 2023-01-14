// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ItemCart {
  int? id;
  String name;
  double price;
  int qty;
  double subtotal;
  ItemCart({
    this.id,
    required this.name,
    required this.price,
    required this.qty,
    required this.subtotal,
  });

  ItemCart copyWith({
    int? id,
    String? name,
    double? price,
    int? qty,
    double? subtotal,
  }) {
    return ItemCart(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      qty: qty ?? this.qty,
      subtotal: subtotal ?? this.subtotal,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'qty': qty,
      'subtotal': subtotal,
    };
  }

  factory ItemCart.fromMap(Map<String, dynamic> map) {
    return ItemCart(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      price: map['price'] as double,
      qty: map['qty'] as int,
      subtotal: map['subtotal'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemCart.fromJson(String source) =>
      ItemCart.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ItemCart(id: $id, name: $name, price: $price, qty: $qty, subtotal: $subtotal)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ItemCart &&
        other.id == id &&
        other.name == name &&
        other.price == price &&
        other.qty == qty &&
        other.subtotal == subtotal;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        price.hashCode ^
        qty.hashCode ^
        subtotal.hashCode;
  }
}
