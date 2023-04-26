import 'package:get/get.dart';
import 'package:shamo_app/app/routes/app_pages.dart';

class PageIndexController extends GetxController {
  RxInt pageIndex = 0.obs;

  void changePage(int i) {
    pageIndex.value = i;
  }
}
