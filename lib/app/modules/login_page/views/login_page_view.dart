import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/app/providers/auth_provider.dart';
import 'package:shamo_app/app/widgets/LoadingButton.dart';
import 'package:shamo_app/theme.dart';

import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handleLogin() async {
      controller.isLoading.value = true;
      if (await authProvider.login(
        email: controller.emailC.text,
        password: controller.passwordC.text,
      )) {
        Navigator.pushNamed(context, "/main-page");
        controller.isLoading.value = false;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: alertColor,
            content: Text("Failed to Login.", textAlign: TextAlign.center)));
        controller.isLoading.value = false;
      }
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign In',
              style:
                  primaryTextStyle.copyWith(fontWeight: semibold, fontSize: 24),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Sign in to Continue',
              style:
                  subtitleTextStyle.copyWith(fontWeight: regular, fontSize: 14),
            ),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
          margin: EdgeInsets.only(top: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email Address',
                style:
                    primaryTextStyle.copyWith(fontWeight: medium, fontSize: 16),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: bgColor2,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/email.png',
                        width: 17,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: TextFormField(
                        controller: controller.emailC,
                        style: primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                            hintText: 'Your Email Address',
                            hintStyle: subtitleTextStyle),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ));
    }

    Widget passwordInput() {
      return Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Password',
                style:
                    primaryTextStyle.copyWith(fontWeight: medium, fontSize: 16),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: bgColor2,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/password.png',
                        width: 17,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: TextFormField(
                        obscureText: true,
                        controller: controller.passwordC,
                        style: primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                            hintText: 'Your Password Account',
                            hintStyle: subtitleTextStyle),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ));
    }

    Widget buttonLogin() {
      return Container(
          height: 50,
          width: double.infinity,
          margin: EdgeInsets.only(top: 30),
          child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              onPressed: () => handleLogin(),
              child: Text(
                'Sign In',
                style:
                    primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              )));
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account?',
              style:
                  subtitleTextStyle.copyWith(fontSize: 12, fontWeight: regular),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/register-page');
              },
              child: Text(' Sign Up',
                  style: purpleTextStyle.copyWith(
                      fontSize: 12, fontWeight: regular)),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor1,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              emailInput(),
              passwordInput(),
              Obx(() =>
                  controller.isLoading.value ? LoadingButton() : buttonLogin()),
              Spacer(),
              footer()
            ],
          ),
        ),
      ),
    );
  }
}
