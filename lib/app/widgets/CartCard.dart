import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/app/models/cart_model.dart';
import 'package:shamo_app/app/providers/cart_provider.dart';
import 'package:shamo_app/theme.dart';

import 'package:get/get.dart';

class CartCard extends StatelessWidget {
  final CartModel cart;
  CartCard(this.cart);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Container(
      margin: EdgeInsets.only(top: defaultMargin),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: bgNavColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "assets/images/shoes.png",
                    width: 60,
                  )),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cart.product!.name!,
                      style: primaryTextStyle.copyWith(
                          fontWeight: semibold, fontSize: 14),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "\$${cart.product!.price}",
                      style: priceTextStyle,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      cartProvider.addQuantity(cart.id!);
                    },
                    child: Image.asset(
                      "assets/icons/plus.png",
                      width: 16,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    cart.quantity!.toString(),
                    style: primaryTextStyle.copyWith(fontWeight: medium),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      cartProvider.reduceQuantity(cart.id!);
                    },
                    child: Image.asset(
                      "assets/icons/minus.png",
                      width: 16,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              cartProvider.removeCard(cart.id!);
            },
            child: Row(
              children: [
                Image.asset(
                  "assets/icons/trash.png",
                  width: 10,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "Remove",
                  style: GoogleFonts.poppins(
                      color: alertColor, fontWeight: light, fontSize: 12),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
