import 'package:flutter/material.dart';

void main() {
  runApp(
    /// MaterialApp은 항상 최상위에 위치한다.
    /// Scaffold는 바로 아래에 위치한다.
    /// 위젯 -> Widget
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text('Code Factory', style: TextStyle(color: Colors.white)),
        ),
      ),
    ),
  );
}
