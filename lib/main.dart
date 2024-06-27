import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/enviornment.dart';
import 'package:flutter_web_dashboard/my_dashboard.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Environment.init();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBQiAi2tBNGR4OByrs2Am1wGkuWorREW28",
            projectId: "admin-portfolio-template",
            messagingSenderId: "702670570563",
            appId: "1:702670570563:web:2b56e56e021ac0a11980f6"

            // apiKey: "AIzaSyBYfcWNpA-RUtqaA_cwsa3k1-6oHPzWsIo",
            // projectId: "portfolio-web-ad6f6",
            // messagingSenderId: "952845585342",
            // appId: "1:952845585342:web:b4ee5b7ffb31a3c570c7ef"
            ));
  }

  runApp(const MyDashboard());
}
