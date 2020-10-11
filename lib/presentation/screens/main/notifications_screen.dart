import 'dart:ui';

import 'package:flippr_app/controllers/notifications_controller.dart';
import 'package:flippr_app/models/api_response.dart';
import 'package:flippr_app/models/notifications_response.dart';
import 'package:flippr_app/presentation/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final controller = Get.find<NotificationsController>();

  @override
  void initState() {
    controller.getNotifications();
    super.initState();
  }

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
                ],
              ),
            ),
            Expanded(child: buildTable(context)),
          ],
        ),
      ),
    );
  }

  Widget buildTable(BuildContext context) {
    return Obx(() {
      if (controller.notifications.status == Status.COMPLETED) {
        List<Notifications> notifications =
            controller.notifications.data.data.notifications;
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: ListView.builder(
            itemCount: notifications.length,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 24),
            itemBuilder: (context, index) => InkWell(
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  height: 100,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Text(
                            notifications[index].title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Icon(Icons.navigate_next_outlined),
                    ],
                  ),
                ),
              ),
              onTap: () async {
                var url = notifications[index].link;
                if (await canLaunch(url)) {
                  await launch(url);
                }
              },
            ),
            shrinkWrap: true,
          ),
        );
      }
      if (controller.notifications.status == Status.ERROR) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 32),
          child: Center(child: Text("Something went wrong!")),
        );
      }
      return Center(child: CircularProgressIndicator());
    });
  }
}
