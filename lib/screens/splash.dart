import 'dart:async';

import 'package:flutter/material.dart';

import 'login.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const Login(),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image.asset(
          //   'assets/logo.jpg',
          //   width: MediaQuery.of(context).size.width / 3,
          // ),
          Image.asset(
            'assets/logo2.png',
            width: MediaQuery.of(context).size.width / 1.2,
          ),
        ],
      ),
    );
  }
}
