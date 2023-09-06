import 'package:flutter/material.dart';
import 'package:hello_world/screens/signIn_screen.dart';
import 'package:hello_world/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Grocery',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme:
                ColorScheme.fromSwatch(backgroundColor: const Color(0xFFFEC54B))
                    .copyWith(secondary: Colors.deepOrange)),
        home: SplashScreen(),
        routes: {SignInScreen.routeName: (ctx) => SignInScreen()});
  }
}
