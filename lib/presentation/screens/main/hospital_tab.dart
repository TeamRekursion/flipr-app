import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flippr_app/controllers/healthcare_controller.dart';
import 'package:flippr_app/models/api_response.dart';
import 'package:flippr_app/models/hospital_response.dart';
import 'package:flippr_app/presentation/themes/theme.dart';
import 'package:flippr_app/presentation/widgets/hosptital_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_data_table/lazy_data_table.dart' as lt;

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
        List<Regional> regional = controller.hospitalDetails.data.data.regional;

        List<String> columnHeader = [
          "State",
          "Rural Hospitals",
          "Rural Beds",
          "Urban Hospitals",
          "Urban Beds",
          "Total Hospitals",
          "Total Beds",
        ];

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
            SizedBox(height: 24),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              height: (40 * regional.length.toDouble() + 70),
              child: lt.LazyDataTable(
                rows: regional.length,
                columns: columnHeader.length,
                tableDimensions: lt.DataTableDimensions(
                  cellHeight: 40,
                  cellWidth: 120,
                  columnHeaderHeight: 50,
                  rowHeaderWidth: 0,
                ),
                tableTheme: lt.DataTableTheme(
                  columnHeaderBorder: Border.all(color: Colors.black38),
                  rowHeaderBorder: Border.all(color: Colors.black38),
                  cellBorder: Border.all(color: Colors.black12),
                  cornerBorder: Border.all(color: Colors.black38),
                  columnHeaderColor: darkGrey,
                  rowHeaderColor: Colors.white60,
                  cellColor: lightGrey,
                  cornerColor: Colors.white38,
                ),
                columnHeaderBuilder: (i) => Center(
                  child: AutoSizeText(
                    "${columnHeader[i]}",
                    maxLines: 1,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                rowHeaderBuilder: (i) => Center(child: Text("Row: ${i + 1}")),
                dataCellBuilder: (i, j) {
                  Regional region = regional[i];
                  List<String> cellValues = [
                    region.state,
                    region.ruralHospitals.toString(),
                    region.ruralBeds.toString(),
                    region.urbanHospitals.toString(),
                    region.urbanBeds.toString(),
                    region.totalHospitals.toString(),
                    region.totalBeds.toString(),
                  ];

                  return Center(
                      child: AutoSizeText(
                    "${cellValues[j]}",
                    maxLines: 1,
                  ));
                },
                cornerWidget: Center(child: Text("Corner")),
              ),
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
