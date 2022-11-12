import 'package:flutter/material.dart';
import 'package:untitled/ui/screens/app_body/items.dart';

class CartViewModel with ChangeNotifier {
  List<Items> items = [];
  double price = 0.0;

  void add(Items item) {
    items.add(item);
    price += (item.price).toDouble();
    notifyListeners();
  }

  void delete(Items item) {
    items.remove(item);
    price -= (item.price).toDouble();
    notifyListeners();
  }

  int get count {
    return items.length;
  }

  double get totalPrice {
    return price;
  }

  List<Items> get basketItem {
    return items;
  }
}
