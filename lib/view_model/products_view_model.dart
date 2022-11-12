import 'package:flutter/material.dart';
import 'package:untitled/data/models/products_model.dart';
import '../../data/common/response_state.dart';
import '../../repositories/product_repository.dart';

class ProductViewModel with ChangeNotifier {
  ResponseState<List<ProductsModel>>? product;

  Future<ResponseState<List<ProductsModel>>?> getAllProducts() async {
    product = await fetchProducts();

    notifyListeners();
    return product;
  }
}
