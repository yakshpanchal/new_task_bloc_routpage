import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_task_bloc_routpage/config/router/router.gr.dart';

@RoutePage()
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void _logout(BuildContext context) async {
    await _auth.signOut();
    AutoRouter.of(context).pushAndPopUntil(Login(), predicate: (route) => false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          Text('LogOut'),
          IconButton(
            icon:  SizedBox(
              height: 25,
                child: Image.asset('assets/images/logout.png')),
            onPressed: () => _logout(context),
          ),
        ],
      ),

      body: Center(
        child: Text('Welcome to the Profile Screen!'),
      ),

    );
  }

}
