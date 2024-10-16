import 'package:get/get.dart';
import 'package:linkear/modules/calling/controllers/channel_controller.dart';

class CallingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(ChannelController.new);
  }
}
