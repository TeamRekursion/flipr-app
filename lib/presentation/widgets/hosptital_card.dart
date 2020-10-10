import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flippr_app/presentation/themes/theme.dart';
import 'package:flutter/material.dart';

class HospitalCard extends StatelessWidget {
  final String type;
  final int count;

  HospitalCard(this.type, this.count);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: cardRadius10,
        ),
        margin: EdgeInsets.all(8),
        child: Container(
          margin: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 2),
                height: 30,
                width: 30,
                child: Image.asset("assets/images/hospital.png"),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AutoSizeText(type, maxLines: 1),
                    SizedBox(height: 2),
                    AutoSizeText(
                      count.toString(),
                      style: TextStyle(
                        color: blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
