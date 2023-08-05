import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tt9_betweener_challenge/constants.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';

Future<List<User>> getFollowing() async {
  int followingCount = 0;
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  User user = userFromJson(prefs.getString('user')!);

  final response = await http.get(Uri.parse(followUrl),
      headers: {'Authorization': 'Bearer ${user.token}'});

  print(jsonDecode(response.body)['following']);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body)['following'] as List<dynamic>;

    List<User> followingList = data.map((e) => User.fromJson(e)).toList();
    followingCount = followingList.length;
    return followingList;
  }

  return Future.error('Something wrong');
}
