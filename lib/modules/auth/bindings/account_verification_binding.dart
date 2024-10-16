import 'package:get/get.dart';
import 'package:linkear/modules/auth/controllers/account_verification_controller.dart';

class AccountVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(AccountVerificationController.new);
  }
}
