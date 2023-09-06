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
    Timer(
        Duration(seconds: 20),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignInScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.fromLTRB(5, 300, 5, 20),
      decoration:
          BoxDecoration(color: Theme.of(context).colorScheme.background),
      child: Column(
        children: <Widget>[
          Image.asset('assets/images/logo.png'),
          SizedBox(
            height: 25,
          ),
          Text(
            'Fresh Fruits',
            style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 38,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          )
        ],
      ),
    );
  }
}
