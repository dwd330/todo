// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo/database/stoarge/getstoarge.dart';
import 'package:todo/models/user_model.dart';

import 'config.dart';

class HttpHandler {
  var client = http.Client();

  Future<User?> login(String email, String password) async {
    try {
      final uri = Uri.parse(baseUrl + EndPoints.login);
      var _header = {"Content-Type": "application/json"};
      final _payload = jsonEncode({"email": email, "password": password});
      final response = await client.post(uri, headers: _header, body: _payload);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return userFromJson(response.body);
      }

      //refresh token
      else if (response.statusCode == 401) {
        //refresh token and call getUser again
        final uri = Uri.parse(baseUrl + EndPoints.refreshtoken);
        final refreshtoken = GetStorageServices().readusertoken();
        var _header = {
          'grant_type': 'refresh_token',
          'refresh_token': '$refreshtoken'
        };
        final response = await client.post(uri, headers: _header);
        return userFromJson(response.body);
      }
    } catch (err) {
      return null;
    } finally {
      client.close();
    }
    return null;
  }
}
