import 'package:get/get.dart';

class MainPageController extends GetxController {
  //TODO: Implement MainPageController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    print("object");
  }

  @override
  void onReady() {
    super.onReady();
    print("object");
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
