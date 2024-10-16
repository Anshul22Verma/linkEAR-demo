import 'package:get/get.dart';
import 'package:linkear/modules/auth/controllers/change_password_controller.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(ChangePasswordController.new);
  }
}
