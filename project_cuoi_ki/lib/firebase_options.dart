// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyC5g4uy5b4Co_u3tXVxHbMUlTa6BgjD0dY',
    appId: '1:217861876968:web:d1cd01677828af96362d5d',
    messagingSenderId: '217861876968',
    projectId: 'projectcuoiky-1ef61',
    authDomain: 'projectcuoiky-1ef61.firebaseapp.com',
    storageBucket: 'projectcuoiky-1ef61.appspot.com',
    measurementId: 'G-6HMKK22FP9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD9AwhpNsQe1XpH3iySFyJOVRGlNb4aWus',
    appId: '1:217861876968:android:6d3b508c0e081973362d5d',
    messagingSenderId: '217861876968',
    projectId: 'projectcuoiky-1ef61',
    storageBucket: 'projectcuoiky-1ef61.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBy6T0hDSNDHzE0jFWkWv4Hm_zYTsUT8pU',
    appId: '1:217861876968:ios:bf11068d635d7510362d5d',
    messagingSenderId: '217861876968',
    projectId: 'projectcuoiky-1ef61',
    storageBucket: 'projectcuoiky-1ef61.appspot.com',
    iosBundleId: 'com.example.projectCuoiKi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBy6T0hDSNDHzE0jFWkWv4Hm_zYTsUT8pU',
    appId: '1:217861876968:ios:bf11068d635d7510362d5d',
    messagingSenderId: '217861876968',
    projectId: 'projectcuoiky-1ef61',
    storageBucket: 'projectcuoiky-1ef61.appspot.com',
    iosBundleId: 'com.example.projectCuoiKi',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC5g4uy5b4Co_u3tXVxHbMUlTa6BgjD0dY',
    appId: '1:217861876968:web:0543af4c213382ba362d5d',
    messagingSenderId: '217861876968',
    projectId: 'projectcuoiky-1ef61',
    authDomain: 'projectcuoiky-1ef61.firebaseapp.com',
    storageBucket: 'projectcuoiky-1ef61.appspot.com',
    measurementId: 'G-MNP1EHXKQQ',
  );
}
