import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDbOX_2GvwKq8WzrbwCuX__nVc6NjMFC2Y",
            authDomain: "rawhub-25d03.firebaseapp.com",
            projectId: "rawhub-25d03",
            storageBucket: "rawhub-25d03.appspot.com",
            messagingSenderId: "137564755854",
            appId: "1:137564755854:web:33a2fa42bb000f9afdf6df",
            measurementId: "G-CYNM0SB3FR"));
  } else {
    await Firebase.initializeApp();
  }
}
