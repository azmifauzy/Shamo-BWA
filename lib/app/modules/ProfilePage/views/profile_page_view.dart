import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/app/models/user_model.dart';
import 'package:shamo_app/app/providers/auth_provider.dart';
import 'package:shamo_app/app/routes/app_pages.dart';
import 'package:shamo_app/theme.dart';

import '../controllers/profile_page_controller.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  const ProfilePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    final String urlPhoto = user.profilePhotoUrl == null
        ? "https://ui-avatars.com/api/?background=random&&name=${user.name!.toLowerCase()}"
        : user.profilePhotoUrl!;

    Widget header() {
      return AppBar(
        backgroundColor: bgColor1,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
            child: Container(
          padding: EdgeInsets.all(defaultMargin),
          child: Row(
            children: [
              ClipOval(
                child: Image.network(
                  urlPhoto,
                  width: 64,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hallo, ${user.name}",
                      style: primaryTextStyle.copyWith(
                          fontWeight: semibold, fontSize: 24),
                    ),
                    Text(
                      "@${user.username}",
                      style: subtitleTextStyle.copyWith(
                          fontWeight: regular, fontSize: 16),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login-page', (route) => false);
                },
                child: Image.asset(
                  "assets/icons/exit.png",
                  width: 20,
                ),
              )
            ],
          ),
        )),
      );
    }

    Widget menuItem(String text) {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: secondaryTextStyle.copyWith(fontSize: 13),
            ),
            Icon(
              Icons.chevron_right,
              color: primaryTextColor,
            )
          ],
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          color: bgColor3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Account",
                style: primaryTextStyle.copyWith(
                    fontWeight: semibold, fontSize: 16),
              ),
              GestureDetector(
                  onTap: () {
                    // Get.offAllNamed(Routes.EDIT_PROFILE_PAGE);
                    Navigator.pushNamed(context, '/edit-profile-page');
                  },
                  child: menuItem("Edit Profile")),
              menuItem("Your Orders"),
              menuItem("Help"),
              SizedBox(
                height: defaultMargin,
              ),
              Text(
                "General",
                style: primaryTextStyle.copyWith(
                    fontWeight: semibold, fontSize: 16),
              ),
              menuItem("Privacy & Policy"),
              menuItem("Term of Service"),
              menuItem("Rate App"),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [header(), content()],
    );
  }
}
