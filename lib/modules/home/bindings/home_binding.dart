import 'package:get/get.dart';
import 'package:linkear/modules/home/controllers/home_controller.dart';
import 'package:linkear/modules/profile/controllers/edit_profile_picture_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(HomeController.new);
    Get.lazyPut(EditProfilePictureController.new, fenix: true);
  }
}
