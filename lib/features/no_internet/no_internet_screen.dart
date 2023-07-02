import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:filter101/coordinator.dart';
import 'package:filter101/network/secure_storage.dart';
import 'package:filter101/routes.dart';
import 'package:flutter/material.dart';
import 'package:filter101/constants/asset_paths.dart';

import '../../constants/colour.dart';
import '../../constants/text_style.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Image.asset(
                AssetPaths.noInternet,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 100.0),
                child: Text(
                  'No Internet Connection',
                  style: TextStyles.heading(
                    color: Colour.black,
                    fontSize: 24.0,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  // Handle retry logic here

                  final secureStorage = SecureStorage();
                  final email = await secureStorage.getEmail();
                  final password = await secureStorage.getPassword();
                  final connectivityResult =
                      await (Connectivity().checkConnectivity());

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
                    // User is not connected to the internet, show a snackbar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('No Internet Connection'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colour.hunterGreen,
                ),
                child: Text(
                  'Try Again',
                  style: TextStyles.heading(color: Colour.white, fontSize: 22),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
