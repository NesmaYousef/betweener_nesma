import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tt9_betweener_challenge/models/user.dart';
import 'package:tt9_betweener_challenge/views/update_profile.dart';
import '../constants.dart';
import '../controllers/follow_controller.dart';
import '../controllers/user_controller.dart';

class FollowingView extends StatefulWidget {
  static const String id = '/followingView';
  @override
  State<FollowingView> createState() => _FollowingViewState();
}

class _FollowingViewState extends State<FollowingView> {
  late Future<List<UserClass>> following;
  String? name = '';
  String? email = '';
  @override
  void initState() {
    following = getFollowing();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Following'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: FutureBuilder(
            future: following,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                  height: 400,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                            padding: const EdgeInsets.all(12),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              name = snapshot.data?[index].name;
                              email = snapshot.data?[index].email;

                              print(name);
                              return Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    color: kLightPrimaryColor,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage:
                                            AssetImage('assets/imgs/img.png'),
                                      ),
                                      title: Text(
                                        name!,
                                        style: TextStyle(
                                          letterSpacing: 3.0,
                                          color: kPrimaryColor,
                                        ),
                                      ),
                                      subtitle: Text(email!),
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 16,
                              );
                            },
                            itemCount: snapshot.data!.length),
                      ),
                    ],
                  ),
                );
              }
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return Text('loading');
            },
          ),
        ),
        // child: FutureBuilder<List<User>>(
        //   future: following,
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return CircularProgressIndicator();
        //     } else if (snapshot.hasError) {
        //       return Text('Error: ${snapshot.error}');
        //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
        //       return Text('No following data available.');
        //     } else {
        //       List<User> followingList = snapshot.data!;
        //       return ListView.builder(
        //         itemCount: followingList.length,
        //         itemBuilder: (context, index) {
        //           User user = followingList[index];
        //           String name = user.user?.name ?? '';
        //
        //           print('name------$name');
        //           String email = user.user?.email ?? '';
        //           print('name------$email');
        //
        //           return ListTile(
        //             leading: CircleAvatar(
        //               backgroundImage: AssetImage('assets/imgs/img.png'),
        //             ),
        //             title: Text(name),
        //             subtitle: Text(email),
        //           );
        //         },
        //       );
        //     }
        //   },
        // ),
      ),
    );
  }
}
