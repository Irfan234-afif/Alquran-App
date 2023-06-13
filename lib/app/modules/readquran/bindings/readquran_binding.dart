import 'package:get/get.dart';

import '../controllers/readquran_controller.dart';

class ReadquranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReadquranController>(
      () => ReadquranController(),
    );
  }
}
