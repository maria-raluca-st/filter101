import 'package:filter101/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import 'features/login/presentation/page/login_screen.dart';
import 'features/onboarding/presentation/page/onboarding.dart';
import 'features/register/presentation/page/register_screen.dart';

abstract class Routes {
  static const loginScreen = 'LOGIN_SCREEN';
  static const registerScreen = 'REGISTER_SCREEN';
  static const onboardingScreen = 'ONBOARDING_SCREEN';
  static const homeScreen = 'HOME_SCREEN';
}

class RouteEntity {
  final String name;
  final Widget view;

  RouteEntity.loginScreen()
      : name = Routes.loginScreen,
        view = const LoginScreen();
  RouteEntity.registerScreen()
      : name = Routes.registerScreen,
        view = const RegisterScreen();
  RouteEntity.onboardingScreen()
      : name = Routes.onboardingScreen,
        view = const OnboardingScreen();
  // RouteEntity.homeScreen()
  //     : name = Routes.homeScreen,
  //       view = const HomeScreen();
  RouteEntity.homeScreen()
      : name = Routes.homeScreen,
        view = const BottomNavigationScreen();
}
