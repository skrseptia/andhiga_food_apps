// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery_apps/models/item_cart.dart';

class Cart with ChangeNotifier {
  final List<ItemCart> _carts = [];

  List<ItemCart> get carts => _carts;

  void addToCart(ItemCart itemCart) {
    ItemCart? itemExist = _carts.firstWhereOrNull((e) => e.id == itemCart.id);
    if (itemExist != null) {
      var oldQty = itemExist.qty;
      var newQty = oldQty + itemCart.qty;
      itemExist.qty = newQty;
    } else {
      _carts.add(itemCart);
    }
    notifyListeners();
  }

  void removeAllCart() {
    _carts.clear();
    notifyListeners();
  }

  void removeItemById(int id) {
    var item = _carts.firstWhere((element) => element.id == id);
    _carts.remove(item);
    notifyListeners();
  }

  void addQty(ItemCart itemCart) {
    itemCart.qty += 1;
    notifyListeners();
  }

  void minusQty(ItemCart itemCart) {
    itemCart.qty -= 1;
    notifyListeners();
  }
}
