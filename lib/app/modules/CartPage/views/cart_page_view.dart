import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/app/providers/cart_provider.dart';

import 'package:shamo_app/theme.dart';
import 'package:get/get.dart';
import 'package:shamo_app/app/widgets/CartCard.dart';
import '../controllers/cart_page_controller.dart';

class CartPageView extends GetView<CartPageController> {
  const CartPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    Widget header() {
      return AppBar(
        backgroundColor: bgColor1,
        centerTitle: true,
        title: Text(
          "Your Cart",
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
        elevation: 0,
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
            "Opss! Your Cart is Empty",
            style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Let's find your favorite shoes",
            style:
                secondaryTextStyle.copyWith(fontSize: 14, fontWeight: regular),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 44,
            child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
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
      ));
    }

    Widget listCart() {
      return Container(
        color: bgColor3,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: cartProvider.carts.map((cart) => CartCard(cart)).toList(),
        ),
      );
    }

    Widget customBottomNav() {
      return Container(
        height: 180,
        child: Column(
          children: [
            Container(
              margin:
                  EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Subtotal",
                    style: primaryTextStyle,
                  ),
                  Text(
                    "\$${cartProvider.totalPrice()}",
                    style: priceTextStyle.copyWith(
                        fontSize: 16, fontWeight: semibold),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 0.3,
              color: subtitleColor,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              height: 50,
              child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/checkout-page");
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: EdgeInsets.symmetric(horizontal: 20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Continue to Checkout",
                        style: primaryTextStyle.copyWith(
                            fontWeight: semibold, fontSize: 16),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: primaryTextColor,
                      )
                    ],
                  )),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar:
          PreferredSize(preferredSize: Size.fromHeight(70), child: header()),
      body: cartProvider.carts.length == 0 ? emptyCart() : listCart(),
      bottomNavigationBar:
          cartProvider.carts.length == 0 ? SizedBox() : customBottomNav(),
    );
  }
}
