import 'package:flippr_app/controllers/healthcare_controller.dart';
import 'package:flippr_app/controllers/helpline_controller.dart';
import 'package:flippr_app/controllers/notifications_controller.dart';
import 'package:get/get.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HealthcareController(), permanent: true);
    Get.put(HelplineController(), permanent: true);
    Get.put(NotificationsController(), permanent: true);
  }
}
