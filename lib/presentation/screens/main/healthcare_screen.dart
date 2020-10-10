import 'package:flippr_app/presentation/screens/main/college_tab.dart';
import 'package:flippr_app/presentation/screens/main/hospital_tab.dart';
import 'package:flippr_app/presentation/themes/theme.dart';
import 'package:flippr_app/presentation/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class HealthScreen extends StatefulWidget {
  @override
  _HealthScreenState createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final _tabs = [HospitalTab(), CollegeTab()];
  int _currIndex = 0;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            onTap: (value) {
              setState(() {
                _currIndex = value;
              });
            },
            tabs: [
              Tab(text: 'Hospitals'),
              Tab(text: 'Medical Colleges'),
            ],
            labelColor: blue,
            unselectedLabelColor: disabledColor,
            indicatorColor: blue,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            labelPadding: EdgeInsets.symmetric(horizontal: 48),
            isScrollable: true,
          ),
          SizedBox(height: 16),
          _tabs[_currIndex],
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
