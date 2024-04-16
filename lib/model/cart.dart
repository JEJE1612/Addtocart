import 'package:addtocart/model/item.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  List<Item> _item = [];
  double _Price = 0.0;
  void add(Item item) {
    _item.add(item);
    _Price += item.price;
    notifyListeners();
  }

  void remove(Item item) {
    _item.remove(item);
    _Price -= item.price;
    notifyListeners();
  }

  int get count {
    return _item.length;
  }

  double get totalprice {
    return _Price;
  }

  List<Item> get basketitem {
    return _item;
  }
}
