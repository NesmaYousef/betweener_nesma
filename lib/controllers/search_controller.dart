import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tt9_betweener_challenge/constants.dart';
import 'package:tt9_betweener_challenge/models/user.dart';

import 'package:http/http.dart' as http;

Future<List<User>> searchUsers(Map<String, String> body) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  User user = userFromJson(prefs.getString('user')!);
  final response = await http.post(
    Uri.parse(searchUrl),
    headers: {'Authorization': 'Bearer ${user.token}'},
    body: body,
  );

  print(jsonDecode(response.body)['user']);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body)['user'] as List<dynamic>;

    return data.map((e) => User.fromJson(e)).toList();
  }

  return Future.error('Somthing wrong');
}
