import 'package:auto_size_text/auto_size_text.dart';
import 'package:flippr_app/controllers/healthcare_controller.dart';
import 'package:flippr_app/models/api_response.dart';
import 'package:flippr_app/models/college_response.dart';
import 'package:flippr_app/presentation/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_data_table/lazy_data_table.dart' as lt;

class CollegeTab extends StatefulWidget {
  @override
  _CollegeTabState createState() => _CollegeTabState();
}

class _CollegeTabState extends State<CollegeTab> {
  final controller = Get.find<HealthcareController>();

  List<String> columnHeader = [
    "State",
    "Name",
    "City",
    "Ownership",
    "Admission Capacity",
    "Hospital Beds",
  ];

  @override
  void initState() {
    controller.getCollegeDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.collegeDetails.status == Status.COMPLETED) {
        List<MedicalColleges> colleges =
            controller.collegeDetails.data.data.medicalColleges;

        return Column(
          children: [
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              height: (40 * colleges.length.toDouble() + 70),
              child: lt.LazyDataTable(
                rows: colleges.length,
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
                  rowHeaderColor: darkGrey,
                  cellColor: lightGrey,
                  cornerColor: darkGrey,
                ),
                columnHeaderBuilder: (i) => Center(
                  child: AutoSizeText(
                    "${columnHeader[i]}",
                    maxLines: 1,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                rowHeaderBuilder: (i) => Center(
                  child: Container(),
                ),
                dataCellBuilder: (i, j) {
                  MedicalColleges college = colleges[i];
                  List<String> cellValues = [
                    college.state.toString(),
                    college.name.toString(),
                    college.city.toString(),
                    college.ownership.toString(),
                    college.admissionCapacity.toString(),
                    college.hospitalBeds.toString(),
                  ];

                  return Center(
                      child: AutoSizeText(
                    "${cellValues[j]}",
                    maxLines: 1,
                  ));
                },
                cornerWidget: Center(child: Text("State")),
              ),
            ),
          ],
        );
      }
      if (controller.collegeDetails.status == Status.ERROR) {
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
