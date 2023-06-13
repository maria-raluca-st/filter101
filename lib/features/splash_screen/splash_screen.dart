import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:filter101/constants/asset_paths.dart';
import 'package:filter101/constants/colour.dart';
import 'package:filter101/constants/variables.dart';
import 'package:filter101/network/secure_storage.dart';
import 'package:flutter/material.dart';
import '../../constants/text_style.dart';
import '../../coordinator.dart';
import '../../routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    const duration = Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() async {
    final secureStorage = SecureStorage();
    final email = await secureStorage.getEmail();
    final password = await secureStorage.getPassword();
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile) {
      if (email != null && password != null) {
        // User is already logged in, navigate to the HomeScreen
        Coordinator.of(context).push(RouteEntity.homeScreen());
      }
      // User is not logged in, navigate to the LoginScreen
      else
        Coordinator.of(context).push(RouteEntity.loginScreen());
    } else {
      // no internet connection
      Coordinator.of(context).push(RouteEntity.noInternetScreen());
    }
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Center(
                child: Image.asset(
                  AssetPaths.appIcon,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0, bottom: 200),
                child: Text(Variables.splashScreenText,
                    style: TextStyles.heading(
                        color: Colour.black, fontSize: 40.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
