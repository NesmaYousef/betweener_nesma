import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:tt9_betweener_challenge/views/followers_view.dart';
import 'package:tt9_betweener_challenge/views/following_view.dart';
import 'package:tt9_betweener_challenge/views/home_view.dart';
import 'package:tt9_betweener_challenge/views/loading_view.dart';
import 'package:tt9_betweener_challenge/views/login_view.dart';
import 'package:tt9_betweener_challenge/views/main_app_view.dart';
import 'package:tt9_betweener_challenge/views/new_link_view.dart';
import 'package:tt9_betweener_challenge/views/profile_view.dart';
import 'package:tt9_betweener_challenge/views/receive_view.dart';
import 'package:tt9_betweener_challenge/views/register_view.dart';
import 'package:tt9_betweener_challenge/views/search_view.dart';
import 'package:tt9_betweener_challenge/views/update_profile.dart';
import 'package:tt9_betweener_challenge/views/update_view.dart';

import 'constants.dart';

void main() async {
  runApp(
    Phoenix(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Betweener',
      theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: kPrimaryColor,
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
            ),
          ),
          scaffoldBackgroundColor: kScaffoldColor),
      home: const LoadingView(),
      routes: {
        LoadingView.id: (context) => const LoadingView(),
        LoginView.id: (context) => const LoginView(),
        RegisterView.id: (context) => const RegisterView(),
        HomeView.id: (context) => const HomeView(),
        SearchView.id: (context) => SearchView(),
        NewLinkView.id: (context) => const NewLinkView(),
        UpdateLinkView.id: (context) => UpdateLinkView(
              title: '',
              link: '',
            ),
        MainAppView.id: (context) => const MainAppView(),
        FollowingView.id: (context) => FollowingView(),
        FollowerView.id: (context) => FollowerView(),
        ProfileView.id: (context) => const ProfileView(),
        UpdateProfileView.id: (context) => UpdateProfileView(
              name: '',
              email: '',
            ),
        ReceiveView.id: (context) => const ReceiveView(),
      },
    );
  }
}
