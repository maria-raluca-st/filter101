import 'package:filter101/features/category_details/category_details_screen.dart';
import 'package:filter101/features/home/presentation/page/home.dart';
import 'package:filter101/features/search_screen/search_screen.dart';
import 'package:filter101/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import 'features/login/presentation/page/login_screen.dart';
import 'features/no_internet/no_internet_screen.dart';
import 'features/onboarding/presentation/page/onboarding.dart';
import 'features/register/presentation/page/register_screen.dart';
import 'features/search_screen/search_bloc.dart';

abstract class Routes {
  static const loginScreen = 'LOGIN_SCREEN';
  static const registerScreen = 'REGISTER_SCREEN';
  static const onboardingScreen = 'ONBOARDING_SCREEN';
  static const homeScreen = 'HOME_SCREEN';
  static const searchScreen = 'SEARCH_SCREEN';
  static const detailsScreen = 'DETAILS_SCREEN';
  static const noInternetScreen = 'NO_INTERNET_SCREEN';
}

class RouteEntity {
  final String name;
  final Widget view;

  RouteEntity.noInternetScreen()
      : name = Routes.noInternetScreen,
        view = const NoInternetScreen();

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

  RouteEntity.detailsScreen(category, posts, comments)
      : name = Routes.detailsScreen,
        view = CategoryDetailsScreen(
            category: category, posts: posts, comments: comments);
  // view = const HomePage();
  // RouteEntity.searchPage({required SearchBloc searchBloc})
  //     : name = Routes.searchScreen,
  //       view = SearchScreen(searchBloc: searchBloc);
  factory RouteEntity.searchPage({required SearchBloc searchBloc}) {
    return RouteEntity(
      name: Routes.searchScreen,
      view: SearchScreen(searchBloc: searchBloc),
    );
  }
  RouteEntity({required this.name, required this.view});
}
