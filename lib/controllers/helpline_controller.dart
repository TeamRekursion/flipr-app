import 'dart:convert';
import 'dart:io';

import 'package:flippr_app/models/api_response.dart';
import 'package:flippr_app/models/helpline_response.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HelplineController extends GetxController {
  var helplineDetailsObs = ApiResponse<HelplineResponse>.loading("").obs;
  ApiResponse<HelplineResponse> get helplineDetails => helplineDetailsObs.value;

  getHelplineDetails() async {
    helplineDetailsObs.value = ApiResponse<HelplineResponse>.loading("");
    update();

    print("entered getHelplineDetails");
    final url = "https://api.rootnet.in/covid19-in/contacts";
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
          helplineDetailsObs.value = ApiResponse.completed(
            HelplineResponse.fromJson(json.decode(response.body)),
          );
          update();
          return;
          break;
        case 500:
          helplineDetailsObs.value = ApiResponse.error("Something went wrong!");
          update();
          return;
          break;
        default:
          helplineDetailsObs.value = ApiResponse.error("Something went wrong!");
          update();
          return;
          break;
      }
    } on SocketException {
      helplineDetailsObs.value = ApiResponse.error("Internet not available");
      update();
      return;
    } catch (e) {
      print(e.toString());
      helplineDetailsObs.value = ApiResponse.error("Something went wrong!");
      update();
      return;
    }
  }
}
