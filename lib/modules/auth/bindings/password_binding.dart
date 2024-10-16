import 'package:get/get.dart';
import 'package:linkear/modules/auth/controllers/password_controller.dart';

class PasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(PasswordController.new);
  }
}
