import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
  TextEditingController emailC = TextEditingController(text: '');
  TextEditingController passwordC = TextEditingController(text: '');
  RxBool isLoading = false.obs;
}
