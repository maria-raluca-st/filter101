// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCqX70vb1R-kfE6j2GDA1GMPiG65ivmXW4',
    appId: '1:360463300441:web:37fefecb59983c4239fe48',
    messagingSenderId: '360463300441',
    projectId: 'filter101-3b3fe',
    authDomain: 'filter101-3b3fe.firebaseapp.com',
    storageBucket: 'filter101-3b3fe.appspot.com',
    measurementId: 'G-32TXS90GR4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCN9fiKq1yJAvQppxd4yxtZJymb4MMle_Q',
    appId: '1:360463300441:android:9b4e6f8537fce25639fe48',
    messagingSenderId: '360463300441',
    projectId: 'filter101-3b3fe',
    storageBucket: 'filter101-3b3fe.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAR5JLT3eh7B0GWzh5mio2Pc9nBptmZ4IY',
    appId: '1:360463300441:ios:4453dd2f0a0a948a39fe48',
    messagingSenderId: '360463300441',
    projectId: 'filter101-3b3fe',
    storageBucket: 'filter101-3b3fe.appspot.com',
    iosClientId: '360463300441-oeahl92tfdn0e7b4ch6hlt3ibvd60u2r.apps.googleusercontent.com',
    iosBundleId: 'com.example.filter101',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAR5JLT3eh7B0GWzh5mio2Pc9nBptmZ4IY',
    appId: '1:360463300441:ios:4453dd2f0a0a948a39fe48',
    messagingSenderId: '360463300441',
    projectId: 'filter101-3b3fe',
    storageBucket: 'filter101-3b3fe.appspot.com',
    iosClientId: '360463300441-oeahl92tfdn0e7b4ch6hlt3ibvd60u2r.apps.googleusercontent.com',
    iosBundleId: 'com.example.filter101',
  );
}
