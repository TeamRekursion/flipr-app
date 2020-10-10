import 'dart:ui';

import 'package:flippr_app/presentation/themes/theme.dart';
import 'package:flippr_app/presentation/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class ContainerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 32),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "COVID-19",
                        style: TextStyle(
                          color: blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Portal",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.notifications_none_rounded, color: blue, size: 30),
                ],
              ),
            ),
            SizedBox(height: 32),
            SearchBar(),
          ],
        ),
      ),
    );
  }
}
