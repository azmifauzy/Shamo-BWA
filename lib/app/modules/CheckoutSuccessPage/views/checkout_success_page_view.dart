import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shamo_app/theme.dart';

import '../controllers/checkout_success_page_controller.dart';

class CheckoutSuccessPageView extends GetView<CheckoutSuccessPageController> {
  const CheckoutSuccessPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: bgColor1,
        centerTitle: true,
        title: Text(
          "Checkout Success",
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyCart() {
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/cart.png',
            width: 80,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "You made a transaction",
            style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            width: 190,
            child: Text(
              "Stay at home while we prepare your dream shoes",
              textAlign: TextAlign.center,
              style: secondaryTextStyle.copyWith(
                  fontSize: 14, fontWeight: regular),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 196,
            height: 44,
            child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/home", (route) => false);
                },
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    backgroundColor: primaryColor),
                child: Text(
                  "Order Other Shoes",
                  style: primaryTextStyle.copyWith(
                      fontWeight: medium, fontSize: 16),
                )),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            width: 196,
            height: 44,
            child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    backgroundColor: Color(0xff39374B)),
                child: Text(
                  "View My Order",
                  style: primaryTextStyle.copyWith(
                      color: Color(0xffB7B6BF),
                      fontWeight: medium,
                      fontSize: 16),
                )),
          ),
        ],
      ));
    }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar:
          PreferredSize(preferredSize: Size.fromHeight(70), child: header()),
      body: emptyCart(),
    );
  }
}
