import 'package:flippr_app/presentation/widgets/hosptital_card.dart';
import 'package:flutter/material.dart';

class HospitalTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.count(
          crossAxisCount: 2,
          physics: NeverScrollableScrollPhysics(),
          children: List.generate(6, (index) => HospitalCard()),
          shrinkWrap: true,
          childAspectRatio: 1.8,
          padding: EdgeInsets.all(24),
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
      ],
    );
  }
}
