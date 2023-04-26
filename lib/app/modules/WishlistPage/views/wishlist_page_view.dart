import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/app/providers/wishlist_provider.dart';
import 'package:shamo_app/theme.dart';
import 'package:shamo_app/app/widgets/WishlistCard.dart';
import '../controllers/wishlist_page_controller.dart';

class WishlistPageView extends GetView<WishlistPageController> {
  const WishlistPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    Widget header() {
      return AppBar(
        backgroundColor: bgColor1,
        centerTitle: true,
        title: Text(
          "Favorite Shoes",
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyWishlist() {
      return Expanded(
        child: Container(
            width: double.infinity,
            color: bgColor3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/llove.png',
                  width: 80,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "You don't have dream shoes?",
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Let's find your favorite shoes",
                  style: secondaryTextStyle.copyWith(
                      fontSize: 14, fontWeight: regular),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 44,
                  child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          backgroundColor: primaryColor),
                      child: Text(
                        "Explore Store",
                        style: primaryTextStyle.copyWith(
                            fontWeight: medium, fontSize: 16),
                      )),
                )
              ],
            )),
      );
    }

    Widget content() {
      return Expanded(
          child: Container(
        color: bgColor3,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: wishlistProvider.wishlist
              .map((product) => WishlistCard(product))
              .toList(),
        ),
      ));
    }

    return Column(
      children: [
        header(),
        wishlistProvider.wishlist.length == 0 ? emptyWishlist() : content()
      ],
    );
  }
}
