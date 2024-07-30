import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoom/resources/auth_methods.dart';
import 'package:zoom/screens/home_screen.dart';
import 'package:zoom/screens/login_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:zoom/screens/video_call_screen.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: dotenv.env['apiKey'] as String,
    appId: dotenv.env['appId'] as String,
    messagingSenderId: dotenv.env['messagingSenderId'] as String,
    projectId: dotenv.env['projectId'] as String,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Zoom',
        theme: ThemeData.dark(useMaterial3: true),
        routes: {
          "/login": (context) => const LoginScreen(),
          "/home": (context) => const HomeScreen(),
          "/video-call": (context) => const VideoCallScreen()
        },
        home: StreamBuilder(
          stream: AuthMethods().authChanges,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: const CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              return HomeScreen();
            }
            return const LoginScreen();
          },
        ));
  }
}
