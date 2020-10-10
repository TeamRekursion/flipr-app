import 'package:flippr_app/controllers/healthcare_controller.dart';
import 'package:flippr_app/models/api_response.dart';
import 'package:flippr_app/models/hospital_response.dart';
import 'package:flippr_app/presentation/widgets/hosptital_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HospitalTab extends StatefulWidget {
  @override
  _HospitalTabState createState() => _HospitalTabState();
}

class _HospitalTabState extends State<HospitalTab> {
  final controller = Get.find<HealthcareController>();

  @override
  void initState() {
    controller.getHospitalDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.hospitalDetails.status == Status.COMPLETED) {
        Summary summary = controller.hospitalDetails.data.data.summary;

        return Column(
          children: [
            GridView.count(
              crossAxisCount: 2,
              physics: NeverScrollableScrollPhysics(),
              children: [
                HospitalCard("Rural Hospitals", summary.ruralHospitals),
                HospitalCard("Rural Beds", summary.ruralBeds),
                HospitalCard("Urban Hospitals", summary.urbanHospitals),
                HospitalCard("Urban Beds", summary.urbanBeds),
                HospitalCard("Total Hospitals", summary.totalHospitals),
                HospitalCard("Total Beds", summary.totalBeds),
              ],
              shrinkWrap: true,
              childAspectRatio: 1.8,
              padding: EdgeInsets.all(24),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
          ],
        );
      }
      if (controller.hospitalDetails.status == Status.ERROR) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 32),
          child: Center(child: Text("Something went wrong!")),
        );
      }

      return Container(
        margin: EdgeInsets.symmetric(vertical: 32),
        child: Center(child: CircularProgressIndicator()),
      );
    });
  }
}
