import 'package:get/get.dart';

import '../controllers/detail_chat_page_controller.dart';

class DetailChatPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailChatPageController>(
      () => DetailChatPageController(),
    );
  }
}
