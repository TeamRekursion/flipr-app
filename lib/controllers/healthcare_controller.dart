import 'dart:convert';
import 'dart:io';

import 'package:flippr_app/models/api_response.dart';
import 'package:flippr_app/models/college_response.dart';
import 'package:flippr_app/models/hospital_response.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class HealthcareController extends GetxController {
  var hospitalDetailsObs = ApiResponse<HospitalResponse>.loading("").obs;
  ApiResponse<HospitalResponse> get hospitalDetails => hospitalDetailsObs.value;

  var collegeDetailsObs = ApiResponse<CollegeResponse>.loading("").obs;
  ApiResponse<CollegeResponse> get collegeDetails => collegeDetailsObs.value;

  getHospitalDetails() async {
    hospitalDetailsObs.value = ApiResponse<HospitalResponse>.loading("");
    update();

    print("entered getHospitalDetails");
    final url = "https://api.rootnet.in/covid19-in/hospitals/beds";
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
          hospitalDetailsObs.value = ApiResponse.completed(
            HospitalResponse.fromJson(json.decode(response.body)),
          );
          update();
          return;
          break;
        case 500:
          hospitalDetailsObs.value = ApiResponse.error("Something went wrong!");
          update();
          return;
          break;
        default:
          hospitalDetailsObs.value = ApiResponse.error("Something went wrong!");
          update();
          return;
          break;
      }
    } on SocketException {
      hospitalDetailsObs.value = ApiResponse.error("Internet not available");
      update();
      return;
    } catch (e) {
      print(e.toString());
      hospitalDetailsObs.value = ApiResponse.error("Something went wrong!");
      update();
      return;
    }
  }

  getCollegeDetails() async {
    collegeDetailsObs.value = ApiResponse<CollegeResponse>.loading("");
    update();

    print("entered getCollegeDetails");
    final url = "https://api.rootnet.in/covid19-in/hospitals/medical-colleges";
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
          collegeDetailsObs.value = ApiResponse.completed(
            CollegeResponse.fromJson(json.decode(response.body)),
          );
          update();
          return;
          break;
        case 500:
          collegeDetailsObs.value = ApiResponse.error("Something went wrong!");
          update();
          return;
          break;
        default:
          collegeDetailsObs.value = ApiResponse.error("Something went wrong!");
          update();
          return;
          break;
      }
    } on SocketException {
      collegeDetailsObs.value = ApiResponse.error("Internet not available");
      update();
      return;
    } catch (e) {
      print(e.toString());
      collegeDetailsObs.value = ApiResponse.error("Something went wrong!");
      update();
      return;
    }
  }
}
