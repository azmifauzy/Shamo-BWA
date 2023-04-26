import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/app/providers/auth_provider.dart';
import 'package:shamo_app/app/providers/cart_provider.dart';
import 'package:shamo_app/app/providers/transaction_provider.dart';
import 'package:shamo_app/app/widgets/LoadingButton.dart';
import 'package:shamo_app/theme.dart';
import 'package:shamo_app/app/widgets/ListItemCard.dart';
import '../controllers/checkout_page_controller.dart';

class CheckoutPageView extends GetView<CheckoutPageController> {
  const CheckoutPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handleCheckout() async {
      controller.isLoading.value = true;
      if (await transactionProvider.checkout(authProvider.user.token!,
          cartProvider.carts, cartProvider.totalPrice())) {
        controller.isLoading.value = false;
        cartProvider.carts = [];
        Navigator.pushNamed(context, "/checkout-success-page");
      }
    }

    Widget header() {
      return AppBar(
        backgroundColor: bgColor1,
        centerTitle: true,
        title: Text(
          "Checkout Details",
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
        elevation: 0,
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          // LIST ITEMS
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "List Items",
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
                Column(
                  children: cartProvider.carts
                      .map((cart) => ListItemCard(cart))
                      .toList(),
                )
              ],
            ),
          ),

          // ADDRESS DETAIL
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: bgNavColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Address Details",
                  style: primaryTextStyle.copyWith(
                      fontWeight: semibold, fontSize: 16),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          "assets/images/wallet.png",
                          width: 40,
                        ),
                        Image.asset(
                          "assets/images/line.png",
                          height: 30,
                        ),
                        Image.asset(
                          "assets/images/location.png",
                          width: 40,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Store Location",
                          style: secondaryTextStyle.copyWith(
                              fontSize: 12, fontWeight: light),
                        ),
                        Text(
                          "Adidas Core",
                          style: primaryTextStyle.copyWith(
                              fontSize: 14, fontWeight: medium),
                        ),
                        SizedBox(
                          height: defaultMargin,
                        ),
                        Text(
                          "Your Address",
                          style: secondaryTextStyle.copyWith(
                              fontSize: 12, fontWeight: light),
                        ),
                        Text(
                          "Marsemoon",
                          style: primaryTextStyle.copyWith(
                              fontSize: 14, fontWeight: medium),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),

          // PAYMENT SUMMARY
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: bgNavColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Payment Summary",
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Product Quantity",
                      style: secondaryTextStyle.copyWith(
                          fontWeight: light, fontSize: 12),
                    ),
                    Text(
                      "${cartProvider.totalItems()} Items",
                      style: primaryTextStyle.copyWith(
                          fontSize: 14, fontWeight: medium),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Product Price",
                      style: secondaryTextStyle.copyWith(
                          fontWeight: light, fontSize: 12),
                    ),
                    Text(
                      "\$${cartProvider.totalPrice()}",
                      style: primaryTextStyle.copyWith(
                          fontSize: 14, fontWeight: medium),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Shipping",
                      style: secondaryTextStyle.copyWith(
                          fontWeight: light, fontSize: 12),
                    ),
                    Text(
                      "Free",
                      style: primaryTextStyle.copyWith(
                          fontSize: 14, fontWeight: medium),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Divider(
                  thickness: 1,
                  color: Color(0xff2E3141),
                ),
                SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: priceTextStyle.copyWith(
                          fontWeight: semibold, fontSize: 14),
                    ),
                    Text(
                      "\$${cartProvider.totalPrice()}",
                      style: priceTextStyle.copyWith(
                          fontWeight: semibold, fontSize: 14),
                    )
                  ],
                )
              ],
            ),
          ),

          // CHECKOUT BUTTON
          SizedBox(
            height: 30,
          ),
          Divider(
            thickness: 1,
            color: Color(0xff2E3141),
          ),
          Container(
            height: 50,
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: defaultMargin),
            child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () => handleCheckout(),
                child: Obx(
                  () => controller.isLoading.value
                      ? Container(
                          margin: EdgeInsets.only(bottom: defaultMargin),
                          child: LoadingButton())
                      : Text(
                          "Checkout Now",
                          style: primaryTextStyle.copyWith(
                              fontWeight: semibold, fontSize: 16),
                        ),
                )),
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar:
          PreferredSize(preferredSize: Size.fromHeight(70), child: header()),
      body: content(),
    );
  }
}
