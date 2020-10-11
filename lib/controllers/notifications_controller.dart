import 'dart:convert';
import 'dart:io';

import 'package:flippr_app/models/api_response.dart';
import 'package:flippr_app/models/notifications_response.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NotificationsController extends GetxController {
  var notificationsObs = ApiResponse<NotificationsResponse>.loading("").obs;
  ApiResponse<NotificationsResponse> get notifications =>
      notificationsObs.value;

  getNotifications() async {
    notificationsObs.value = ApiResponse<NotificationsResponse>.loading("");
    update();

    print("entered getNotifications");
    final url = "https://api.rootnet.in/covid19-in/notifications";
    try {
      final response = await http.get(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
      );

      print(response.statusCode);

      switch (response.statusCode) {
        case 200:
          notificationsObs.value = ApiResponse.completed(
            NotificationsResponse.fromJson(json.decode(response.body)),
          );
          update();
          return;
          break;
        case 500:
          notificationsObs.value = ApiResponse.error("Something went wrong!");
          update();
          return;
          break;
        default:
          notificationsObs.value = ApiResponse.error("Something went wrong!");
          update();
          return;
          break;
      }
    } on SocketException {
      notificationsObs.value = ApiResponse.error("Internet not available");
      update();
      return;
    } catch (e) {
      print(e.toString());
      notificationsObs.value = ApiResponse.error("Something went wrong!");
      update();
      return;
    }
  }
}
