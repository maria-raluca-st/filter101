import 'dart:async';
import 'package:filter101/constants/asset_paths.dart';
import 'package:filter101/constants/colour.dart';
import 'package:filter101/constants/variables.dart';
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
    const duration = Duration(seconds: 2);
    return Timer(duration, route);
  }

  route() {
    Coordinator.of(context).push(RouteEntity.loginScreen());
  }

  initScreen(BuildContext context) {
    return
        // ResponsiveBreakpoints.builder(
        //   breakpoints: [
        //     const Breakpoint(start: 0, end: 450, name: MOBILE),
        //     const Breakpoint(start: 451, end: 800, name: TABLET),
        //   ],
        // child:
        Scaffold(
      backgroundColor: Colors.white,
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
              // Spacer(),
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
