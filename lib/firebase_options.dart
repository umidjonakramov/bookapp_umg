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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDFshCx7XkOJW5dj--ys3dS4gZ-7-pcbyg',
    appId: '1:456021357500:web:f812c51fb20c5a20b4f1b9',
    messagingSenderId: '456021357500',
    projectId: 'audiobook-d7e60',
    authDomain: 'audiobook-d7e60.firebaseapp.com',
    storageBucket: 'audiobook-d7e60.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCATrJ5PNMR_5h9o0R08_n509N6eXIZZCs',
    appId: '1:456021357500:android:3a1c92ea86148d95b4f1b9',
    messagingSenderId: '456021357500',
    projectId: 'audiobook-d7e60',
    storageBucket: 'audiobook-d7e60.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA2RNGxwRVLZ0nWqp4315ZkrDGFFMtzbEI',
    appId: '1:456021357500:ios:06a381d6b6ad2fdfb4f1b9',
    messagingSenderId: '456021357500',
    projectId: 'audiobook-d7e60',
    storageBucket: 'audiobook-d7e60.appspot.com',
    androidClientId: '456021357500-og1ihgqro7t3drtbs44mhrs1bdenp001.apps.googleusercontent.com',
    iosClientId: '456021357500-rupis612c1uqsqv1532cnhagd73jksu9.apps.googleusercontent.com',
    iosBundleId: 'com.example.bookappUmg',
  );
}