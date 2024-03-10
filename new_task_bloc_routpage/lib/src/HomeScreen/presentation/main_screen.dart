import 'package:auto_route/auto_route.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../../../config/router/router.gr.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        DashBoard(),
        PropertyRequest(),
        Profile(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: ConvexAppBar(
            items: const [
              TabItem(icon: Icons.dashboard, title: 'Dashboard'),
              TabItem(icon: Icons.add_box, title: 'Request'),
              TabItem(icon: Icons.person, title: 'Account'),
            ],
            height: 60,
            initialActiveIndex: tabsRouter.activeIndex,
            onTap: (value) {
              tabsRouter.setActiveIndex(value);
            },
            color: Colors.white,
            activeColor: Colors.white,
            backgroundColor: Colors.deepPurple,
          ),
        );
      },
    );
  }
}
