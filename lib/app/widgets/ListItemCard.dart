import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shamo_app/app/models/cart_model.dart';
import 'package:shamo_app/theme.dart';

class ListItemCard extends StatelessWidget {
  final CartModel cart;
  ListItemCard(this.cart);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: bgNavColor),
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    image: AssetImage("assets/images/shoes.png"))),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cart.product!.name!,
                  style: primaryTextStyle.copyWith(fontWeight: semibold),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "\$${cart.product!.price}",
                  style: priceTextStyle,
                )
              ],
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            "${cart.quantity} Items",
            style: subtitleTextStyle.copyWith(fontWeight: light),
          )
        ],
      ),
    );
  }
}
