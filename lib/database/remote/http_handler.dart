// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/user_model.dart';
import 'config.dart';

class HttpHandler {
  var client = http.Client();

//get all users
  Future<dynamic> getusers() async {
    try {
      final uri = Uri.parse(baseUrl + EndPoints.users);
      var _header = {"Content-Type": "application/json"};
      final response = await client.get(uri, headers: _header);

      if (response.statusCode == 200) {
        //return list of users
        final userslist = (json.decode(response.body) as List)
            .map((i) => User.fromJson(i))
            .toList();

        return userslist;
      }
    } catch (err) {
      return null;
    } finally {
      client.close();
    }
  }

//post a user
  Future<dynamic> postuser(User user) async {
    try {
      final uri = Uri.parse(baseUrl + EndPoints.users);
      var _header = {"Content-Type": "application/json"};
      final _payload = jsonEncode(user.toJson());
      print(_payload);
      final response = await client.post(uri, headers: _header, body: _payload);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      }
    } catch (err) {
      return null;
    } finally {
      client.close();
    }
  }
}
