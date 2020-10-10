import 'package:flippr_app/controllers/healthcare_controller.dart';
import 'package:get/get.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HealthcareController(), permanent: true);
  }
}
