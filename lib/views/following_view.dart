import 'package:flutter/material.dart';
import 'package:tt9_betweener_challenge/models/user.dart';
import 'package:tt9_betweener_challenge/views/update_profile.dart';
import '../controllers/follow_controller.dart';
import '../controllers/user_controller.dart';

class FollowingView extends StatelessWidget {
  static const String id = '/followingView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Following'),
      ),
      body: SafeArea(
        child: FutureBuilder<List<User>>(
          future: getFollowing(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('No following data available.');
            } else {
              List<User> followingList = snapshot.data!;
              return ListView.builder(
                itemCount: followingList.length,
                itemBuilder: (context, index) {
                  User user = followingList[index];
                  String name = user.user?.name ?? '';
                  String email = user.user?.email ?? '';
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/imgs/img.png'),
                    ),
                    title: Text(name),
                    subtitle: Text(email),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
