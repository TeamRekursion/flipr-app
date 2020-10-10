import 'package:flippr_app/presentation/screens/main/container_screen.dart';
import 'package:flippr_app/presentation/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flipr Covid',
      theme: darkTheme,
      home: ContainerScreen(),
    );
  }
}
