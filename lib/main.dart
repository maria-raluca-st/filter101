import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'coordinator.dart';
import 'firebase_options.dart';
import 'features/splash_screen/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: SplashScreen(),
      onGenerateRoute: Coordinator.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
