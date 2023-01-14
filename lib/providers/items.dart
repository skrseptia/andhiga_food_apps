import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../util/constant.dart';
import '../models/item.dart';

class Items with ChangeNotifier {
  late Item _item;
  List<Item> _items = [];

  Item get item => _item;
  List<Item> get items => _items;

  void setItem(Item item) {
    _item = item;
    notifyListeners();
  }

  void setItems(List<Item> items) {
    _items = items;
    notifyListeners();
  }

  Future<void> fetchData() async {
    const url = "${Constant.baseURL}/items.json";

    try {
      final response = await http.get(Uri.parse(url));

      final data = jsonDecode(response.body) as List;
      log(data.toString());
      _items = data.map((e) => Item.fromMap(e)).toList();
      notifyListeners();
    } catch (error) {
      log('provider.items.fetchData()', error: error);
    }
  }

  Item findById(int id) {
    return _items.where((element) => element.id == id).first;
  }

  List<Item> filterByCategory(String category) {
    return _items.where((element) => element.category == category).toList();
  }

  void selectMenu(Item item) {
    _items = items;
    notifyListeners();
  }
}
