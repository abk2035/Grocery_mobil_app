import 'package:flutter/material.dart';
import 'dart:async';
import 'package:hello_world/screens/signIn_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    @override
  void initState() {

    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    SignInScreen()
            )
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(color: ),);
  }
}