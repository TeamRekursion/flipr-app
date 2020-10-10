import 'package:auto_size_text/auto_size_text.dart';
import 'package:flippr_app/controllers/helpline_controller.dart';
import 'package:flippr_app/models/api_response.dart';
import 'package:flippr_app/models/helpline_response.dart';
import 'package:flippr_app/presentation/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_data_table/lazy_data_table.dart' as lt;

class HelplineScreen extends StatefulWidget {
  @override
  _HelplineScreenState createState() => _HelplineScreenState();
}

class _HelplineScreenState extends State<HelplineScreen> {
  final controller = Get.find<HelplineController>();

  @override
  void initState() {
    controller.getHelplineDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.helplineDetails.status == Status.COMPLETED) {
        List<Regional> regionals =
            controller.helplineDetails.data.data.contacts.regional;

        List<String> columnHeader = [
          "State",
          "Helpline",
        ];

        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            height: (40 * regionals.length.toDouble() + 70),
            child: lt.LazyDataTable(
              rows: regionals.length,
              columns: columnHeader.length,
              tableDimensions: lt.DataTableDimensions(
                cellHeight: 40,
                cellWidth: MediaQuery.of(context).size.width / 2 - 24,
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
                Regional region = regionals[i];
                List<String> cellValues = [
                  region.loc,
                  region.number,
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
        );
      }
      if (controller.helplineDetails.status == Status.ERROR) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 32),
          child: Center(child: Text("Something went wrong!")),
        );
      }
      return Center(child: CircularProgressIndicator());
    });
  }
}
