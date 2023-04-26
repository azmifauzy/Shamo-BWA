import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegisterPageController extends GetxController {
  TextEditingController fullnameC = TextEditingController(text: '');
  TextEditingController usernameC = TextEditingController(text: '');
  TextEditingController emailC = TextEditingController(text: '');
  TextEditingController passwordC = TextEditingController(text: '');
  RxBool isLoading = false.obs;
}
