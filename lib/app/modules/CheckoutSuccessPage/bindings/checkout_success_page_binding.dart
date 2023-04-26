import 'package:get/get.dart';

import '../controllers/checkout_success_page_controller.dart';

class CheckoutSuccessPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckoutSuccessPageController>(
      () => CheckoutSuccessPageController(),
    );
  }
}
