
import 'dart:convert';

import 'package:flutter_bloc_authentication/models/login.dart';
import 'package:flutter_bloc_authentication/models/producto.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;


import '../config/locator.dart';
import '../rest/rest_client.dart';
import '../services/localstorage_service.dart';

String url_base = "http://localhost:8080";
class ProductoRepository{


  late RestAuthenticatedClient _client;
  late LocalStorageService _localStorageService;

    ProductoRepository() {
    _client = getIt<RestAuthenticatedClient>();
    _localStorageService = getIt<LocalStorageService>();
  }


    Future<ProductoList> fetchProductos([int _startIndex = 0]) async {
    String page = "/producto/?page=${_startIndex}";

    String? token = _localStorageService.getFromDisk('user_token');

    final response = await http.get(
      Uri.parse(url_base + page),
      headers: {'Authorization': 'Bearer $token'},
    );
    print('aqui');
    print(response.body);
    return ProductoList.fromJson(jsonDecode(response.body));
  }

}