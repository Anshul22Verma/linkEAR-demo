import 'package:get/get.dart';
import 'package:linkear/modules/calling/controllers/start_channel_controller.dart';

class StartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(StartChannelController.new);
  }
}
