import 'package:flutter/material.dart';
import 'package:tt9_betweener_challenge/controllers/link_controller.dart';
import 'package:tt9_betweener_challenge/controllers/search_controller.dart';
import 'package:tt9_betweener_challenge/controllers/user_controller.dart';
import 'package:tt9_betweener_challenge/views/new_link_view.dart';

import '../constants.dart';
import '../models/link.dart';
import '../models/user.dart';

class SearchView extends StatefulWidget {
  static const id = '/searchView';
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late Future<User> user;
  late Future<User> user2;

  String get body => 'nesma';

  @override
  void initState() {
    user = getLocalUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLightPrimaryColor,
        title: const Text(
          "Search",
        ),
      ),
      // body: const Column(
      //   children: [],
      // ),
    );
  }
}
