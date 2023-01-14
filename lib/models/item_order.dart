import 'dart:convert';

import 'package:flutter/foundation.dart';

import './item_cart.dart';

class ItemOrder {
  final String? id;
  final double? amount;
  final List<ItemCart> products;
  final DateTime dateTime;
  ItemOrder({
    this.id,
    this.amount,
    required this.products,
    required this.dateTime,
  });

  ItemOrder copyWith({
    String? id,
    double? amount,
    List<ItemCart>? products,
    DateTime? dateTime,
  }) {
    return ItemOrder(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      products: products ?? this.products,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (amount != null) {
      result.addAll({'amount': amount});
    }
    result.addAll({'products': products.map((x) => x.toMap()).toList()});
    result.addAll({'dateTime': dateTime.millisecondsSinceEpoch});

    return result;
  }

  factory ItemOrder.fromMap(Map<String, dynamic> map) {
    return ItemOrder(
      id: map['id'],
      amount: map['amount']?.toDouble(),
      products:
          List<ItemCart>.from(map['products']?.map((x) => ItemCart.fromMap(x))),
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemOrder.fromJson(String source) =>
      ItemOrder.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ItemOrder(id: $id, amount: $amount, products: $products, dateTime: $dateTime)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ItemOrder &&
        other.id == id &&
        other.amount == amount &&
        listEquals(other.products, products) &&
        other.dateTime == dateTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        amount.hashCode ^
        products.hashCode ^
        dateTime.hashCode;
  }
}
