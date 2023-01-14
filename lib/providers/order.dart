import 'package:flutter/cupertino.dart';

import '../models/item_order.dart';

class Order with ChangeNotifier {
  final List<ItemOrder> _orders = [];
  List<ItemOrder> get orders => _orders;

  void addToOrder(ItemOrder itemOrder) {
    _orders.add(itemOrder);

    notifyListeners();
  }
}
