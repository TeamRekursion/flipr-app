import 'package:flippr_app/presentation/themes/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flipr Covid',
      theme: darkTheme,
      home: Scaffold(
        body: Container(),
      ),
    );
  }
}
