import 'dart:ui';

import 'package:flippr_app/presentation/screens/main/healthcare_screen.dart';
import 'package:flippr_app/presentation/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class ContainerScreen extends StatefulWidget {
  @override
  _ContainerScreenState createState() => _ContainerScreenState();
}

class _ContainerScreenState extends State<ContainerScreen> {
  int _currIndex = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
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
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [HealthScreen(), Container(), Container()],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: darkGrey,
        child: SalomonBottomBar(
          currentIndex: _currIndex,
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          onTap: (value) {
            setState(() {
              _currIndex = value;
              _pageController.animateToPage(
                _currIndex,
                duration: Duration(milliseconds: 100),
                curve: Curves.easeInCubic,
              );
            });
          },
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.healing_rounded),
              title: Text('Healthcare Dashboard'),
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.stacked_line_chart_outlined),
              title: Text('State Analytics'),
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.phone),
              title: Text('State Helpline'),
            ),
          ],
        ),
      ),
    );
  }
}
