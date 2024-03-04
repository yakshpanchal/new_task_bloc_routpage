// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:new_task_bloc_routpage/src/authentication/presenatation/CheckisLoginOrNot.dart'
    as _i1;
import 'package:new_task_bloc_routpage/src/authentication/presenatation/Login.dart'
    as _i2;
import 'package:new_task_bloc_routpage/src/authentication/presenatation/SignUp.dart'
    as _i8;
import 'package:new_task_bloc_routpage/src/HomeScreen/presentation/main_screen.dart'
    as _i3;
import 'package:new_task_bloc_routpage/src/Profile/presentation/Profile.dart'
    as _i4;
import 'package:new_task_bloc_routpage/src/PropertyRequest/presentation/pages/PropertyRequest.dart'
    as _i5;
import 'package:new_task_bloc_routpage/src/ShowUserRequests/presentation/pages/ShowUserPropertyRequests.dart'
    as _i7;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    CheckLoginStatus.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CheckLoginStatus(),
      );
    },
    Login.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.Login(),
      );
    },
    MainRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MainScreen(),
      );
    },
    Profile.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.Profile(),
      );
    },
    PropertyRequest.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.PropertyRequest(),
      );
    },
    ShowUserRequest.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ShowUserRequest(),
      );
    },
    SignUp.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SignUp(),
      );
    },
  };
}

/// generated route for
/// [_i1.CheckLoginStatus]
class CheckLoginStatus extends _i9.PageRouteInfo<void> {
  const CheckLoginStatus({List<_i9.PageRouteInfo>? children})
      : super(
          CheckLoginStatus.name,
          initialChildren: children,
        );

  static const String name = 'CheckLoginStatus';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.Login]
class Login extends _i9.PageRouteInfo<void> {
  const Login({List<_i9.PageRouteInfo>? children})
      : super(
          Login.name,
          initialChildren: children,
        );

  static const String name = 'Login';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MainScreen]
class MainRoute extends _i9.PageRouteInfo<void> {
  const MainRoute({List<_i9.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.Profile]
class Profile extends _i9.PageRouteInfo<void> {
  const Profile({List<_i9.PageRouteInfo>? children})
      : super(
          Profile.name,
          initialChildren: children,
        );

  static const String name = 'Profile';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.PropertyRequest]
class PropertyRequest extends _i9.PageRouteInfo<void> {
  const PropertyRequest({List<_i9.PageRouteInfo>? children})
      : super(
          PropertyRequest.name,
          initialChildren: children,
        );

  static const String name = 'PropertyRequest';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ScreenB]
class RouteB extends _i9.PageRouteInfo<void> {
  const RouteB({List<_i9.PageRouteInfo>? children})
      : super(
          RouteB.name,
          initialChildren: children,
        );

  static const String name = 'RouteB';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ShowUserRequest]
class ShowUserRequest extends _i9.PageRouteInfo<void> {
  const ShowUserRequest({List<_i9.PageRouteInfo>? children})
      : super(
          ShowUserRequest.name,
          initialChildren: children,
        );

  static const String name = 'ShowUserRequest';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SignUp]
class SignUp extends _i9.PageRouteInfo<void> {
  const SignUp({List<_i9.PageRouteInfo>? children})
      : super(
          SignUp.name,
          initialChildren: children,
        );

  static const String name = 'SignUp';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
