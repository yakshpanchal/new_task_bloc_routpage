import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: CheckLoginStatus.page, initial: true),
        AutoRoute(page: Login.page),
        AutoRoute(page: SignUp.page),
        AutoRoute(page: MainRoute.page, children: [
          AutoRoute(page: DashBoard.page),
          AutoRoute(page: PropertyRequest.page),
          AutoRoute(page: ShowUserRequest.page),
          AutoRoute(page: Profile.page)
        ]),
      ];
}
