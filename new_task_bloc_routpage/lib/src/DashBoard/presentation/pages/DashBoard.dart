import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_task_bloc_routpage/src/DashBoard/data/fetch_data.dart';
import 'package:new_task_bloc_routpage/src/DashBoard/presentation/widgets/searchbar.dart';
import 'package:new_task_bloc_routpage/src/DashBoard/presentation/widgets/tenantViewSwitch.dart';

@RoutePage()
class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Rentl',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            CustomSwitch(
              value: _switchValue,
              onChanged: (value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),
            const CustomSearchField(),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Explore Available Propertys',
              style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const FetchAvilablePropertys(),
          ],
        ),
      ),
    );
  }
}
