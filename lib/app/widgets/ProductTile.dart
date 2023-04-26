import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shamo_app/app/models/product_model.dart';
import 'package:shamo_app/app/modules/ProductPage/views/product_page_view.dart';
import 'package:shamo_app/app/routes/app_pages.dart';
import 'package:shamo_app/theme.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.PRODUCT_PAGE, arguments: product);
      },
      child: Container(
        margin: EdgeInsets.only(
            left: defaultMargin, right: defaultMargin, bottom: defaultMargin),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/shoes.png",
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              width: 12,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${product.category!.name}",
                  style: secondaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: regular),
                ),
                Text("${product.name}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    style: primaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: semibold)),
                Text("\$${product.price}",
                    style: priceTextStyle.copyWith(
                        fontSize: 14, fontWeight: medium)),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
