import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:untitled/data/models/products_model.dart';
import '../data/common/api_uri.dart';
import '../data/common/response_state.dart';

Future<ResponseState<List<ProductsModel>>> fetchProducts() async {
  const String uri = endpoint;
  var jsonData = await http.get(Uri.parse(uri));
  try {
    if (jsonData.statusCode == 200) {
      List allProducts = jsonDecode(jsonData.body);
      List<ProductsModel> productModel = [];
      for (var aProduct in allProducts) {
        ProductsModel product = ProductsModel.fromJson(aProduct);
        productModel.add(product);
      }

      return ResponseState(statusCode: jsonData.statusCode, data: productModel);
    } else {
      return ResponseState.error();
    }
  } catch (e) {
    if (e is SocketException) {
      return ResponseState.networkError();
    }
    return ResponseState.error();
  }
}
