import 'dart:convert';
import '../models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRemoteDatasource {
  final http.Client client;

  ProductRemoteDatasource(this.client);

  Future<List<ProductModel>> getProducts() async {
    final response = await client.get(
      Uri.parse("https://fakestoreapi.com/products"),
    );

    final List data = jsonDecode(response.body);

    return data.map((json) => ProductModel.fromJson(json)).toList();
  }
}
