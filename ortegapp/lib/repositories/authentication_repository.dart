

import 'dart:convert';

import 'package:flutter_bloc_authentication/models/login.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_bloc_authentication/rest/rest.dart';

import '../models/register.dart';

@Order(-1)
@singleton
class AuthenticationRepository {

  late RestClient _client;

  AuthenticationRepository() {
    _client = GetIt.I.get<RestClient>();
    //_client = RestClient();
  }

  Future<dynamic> doLogin(String username, String password) async {
    String url = "/auth/login";

    var jsonResponse = await _client.post(url, LoginRequest(username: username, password: password));
    return LoginResponse.fromJson(jsonDecode(jsonResponse));

  }

    Future<RegisterResponse> registerClient(String username, String password,
      String verifyPassword, String email, String nombre, String telefono) async {
    String url = "/auth/register";

    var jsonResponse = await _client.post(
        url,
        RegisterRequest(
            username: username,
            password: password,
            email: email,
            telefono: telefono,
            nombre: nombre,
            verifyPassword: verifyPassword));
    return RegisterResponse.fromJson(jsonDecode(jsonResponse));
  }





}