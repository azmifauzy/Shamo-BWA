import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shamo_app/app/controllers/page_index_controller.dart';
import 'package:shamo_app/app/modules/ChatPage/views/chat_page_view.dart';
import 'package:shamo_app/app/modules/ProfilePage/views/profile_page_view.dart';
import 'package:shamo_app/app/modules/WishlistPage/views/wishlist_page_view.dart';
import 'package:shamo_app/app/modules/home/views/home_view.dart';
import 'package:shamo_app/theme.dart';

import '../controllers/main_page_controller.dart';

class MainPageView extends GetView<MainPageController> {
  // const MainPageView({Key? key}) : super(key: key);

  final pageController = Get.find<PageIndexController>();

  @override
  Widget build(BuildContext context) {
    Widget cartButton() {
      return FloatingActionButton(
        backgroundColor: secondaryColor,
        onPressed: () {
          Navigator.pushNamed(context, "/cart-page");
        },
        child: Image.asset(
          'assets/icons/cart.png',
          width: 20,
        ),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            onTap: (int i) {
              pageController.changePage(i);
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: bgNavColor,
            items: [
              BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 20, bottom: 10),
                    child: Image.asset(
                      "assets/icons/hhome.png",
                      width: 21,
                      color: pageController.pageIndex.value == 0
                          ? primaryColor
                          : Color(0xff808191),
                    ),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 20, bottom: 10),
                    child: Image.asset(
                      "assets/icons/chat.png",
                      width: 20,
                      color: pageController.pageIndex.value == 1
                          ? primaryColor
                          : Color(0xff808191),
                    ),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 20, bottom: 10),
                    child: Image.asset(
                      "assets/icons/love.png",
                      width: 20,
                      color: pageController.pageIndex.value == 2
                          ? primaryColor
                          : Color(0xff808191),
                    ),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 20, bottom: 10),
                    child: Image.asset(
                      "assets/icons/pprofile.png",
                      width: 18,
                      color: pageController.pageIndex.value == 3
                          ? primaryColor
                          : Color(0xff808191),
                    ),
                  ),
                  label: ''),
            ],
          ),
        ),
      );
    }

    Widget body() {
      switch (pageController.pageIndex.value) {
        case 0:
          return HomeView();
          break;
        case 1:
          return ChatPageView();
          break;
        case 2:
          return WishlistPageView();
          break;
        case 3:
          return ProfilePageView();
          break;
        default:
          return HomeView();
      }
    }

    return Obx(
      () => Scaffold(
        backgroundColor: bgColor1,
        floatingActionButton: cartButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: customBottomNav(),
        body: body(),
      ),
    );
  }
}
