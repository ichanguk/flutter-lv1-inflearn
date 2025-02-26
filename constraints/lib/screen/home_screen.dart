import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
              child: Container(
                height: 200,
                width: 200,
                color: Colors.red,
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            ),
        ),
    );
  }
}
