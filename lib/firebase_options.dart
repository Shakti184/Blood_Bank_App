
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyCCpLbR92aXHew0v4eiU6Pwpdi0T0hXhQ0',
    appId: '1:289482632814:web:3ff86a2ae0c4383a76c07f',
    messagingSenderId: '289482632814',
    projectId: 'blood-bank-app-df5a7',
    authDomain: 'blood-bank-app-df5a7.firebaseapp.com',
    storageBucket: 'blood-bank-app-df5a7.appspot.com',
    measurementId: 'G-L4QX8TXKGL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDQmUrFkEFmAWeGau-6YWI8LgripDd-pmw',
    appId: '1:289482632814:android:085333459c1e037576c07f',
    messagingSenderId: '289482632814',
    projectId: 'blood-bank-app-df5a7',
    storageBucket: 'blood-bank-app-df5a7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBgXG52JzLzTQMbQEitW8fntSMzOtEgWUs',
    appId: '1:289482632814:ios:2a365569d646f06176c07f',
    messagingSenderId: '289482632814',
    projectId: 'blood-bank-app-df5a7',
    storageBucket: 'blood-bank-app-df5a7.appspot.com',
    iosClientId: '289482632814-i89guioku85n7khmi72jl8rkcs74el88.apps.googleusercontent.com',
    iosBundleId: 'com.example.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBgXG52JzLzTQMbQEitW8fntSMzOtEgWUs',
    appId: '1:289482632814:ios:1fbb8b6e608619e976c07f',
    messagingSenderId: '289482632814',
    projectId: 'blood-bank-app-df5a7',
    storageBucket: 'blood-bank-app-df5a7.appspot.com',
    iosClientId: '289482632814-lqm3ha6n5rq55ladttcgh8pgck1907ia.apps.googleusercontent.com',
    iosBundleId: 'com.example.app.RunnerTests',
  );
}
