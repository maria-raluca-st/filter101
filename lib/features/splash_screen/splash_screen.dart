import 'dart:async';
import 'package:filter101/constants/variables.dart';
import 'package:flutter/material.dart';
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
    const duration = Duration(seconds: 2);
    return Timer(duration, route);
  }

  route() {
    Coordinator.of(context).push(RouteEntity.loginScreen());
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Spacer(),
              // Center(
              //   child: SvgWrapper(
              //     AssetPaths.splashScreenLogo,
              //     height: 156.64,
              //     width: 198.55,
              //   ),
              // ),
              Spacer(),
              Padding(
                padding: EdgeInsets.all(32),
                child: Text(
                  Variables.splashScreenText,
                  style: TextStyle(fontSize: 24.0, color: Colors.lightGreen),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
