import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../config/router/router.gr.dart';

@RoutePage()
class CheckLoginStatus extends StatefulWidget {
  const CheckLoginStatus({super.key});

  @override
  State<CheckLoginStatus> createState() => _CheckLoginStatusState();
}

class _CheckLoginStatusState extends State<CheckLoginStatus> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user == null) {
      // Navigate to the Login route
      AutoRouter.of(context)
          .pushAndPopUntil(Login(), predicate: (route) => false);
    } else {
      // Navigate to the MainRoute route
      AutoRouter.of(context)
          .pushAndPopUntil(MainRoute(), predicate: (route) => false);
    }

    // Return an empty container. Navigation happens in the background.
    return Container();
  }
}
