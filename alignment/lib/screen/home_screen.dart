import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.red,
          child: Align(
            alignment: Alignment(
              -0.5, -0.5
            ),
            child: Container(
              width: 50,
              height: 50,
              color: Colors.blue,
            ),
          ),
        ),
      )),
    );
  }
}
