import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/app/models/product_model.dart';
import 'package:shamo_app/app/providers/cart_provider.dart';
import 'package:shamo_app/app/providers/wishlist_provider.dart';
import 'package:shamo_app/app/routes/app_pages.dart';

import '../controllers/product_page_controller.dart';
import 'package:shamo_app/theme.dart';

class ProductPageView extends GetView<ProductPageController> {
  final ProductModel product = Get.arguments;

  List images = [
    'assets/images/shoes.png',
    'assets/images/shoes.png',
    'assets/images/shoes.png'
  ];

  List familiarShoes = [
    'assets/shoes/1.png',
    'assets/shoes/2.png',
    'assets/shoes/3.png',
    'assets/shoes/4.png',
    'assets/shoes/5.png',
    'assets/shoes/6.png',
    'assets/shoes/7.png',
    'assets/shoes/8.png',
    'assets/shoes/9.png',
    'assets/shoes/10.png',
    'assets/shoes/11.png',
    'assets/shoes/12.png',
    'assets/shoes/13.png',
    'assets/shoes/14.png',
    'assets/shoes/15.png',
    'assets/shoes/16.png',
    'assets/shoes/17.png',
    'assets/shoes/18.png',
    'assets/shoes/19.png',
    'assets/shoes/20.png',
    'assets/shoes/21.png',
    'assets/shoes/22.png',
    'assets/shoes/23.png',
    'assets/shoes/24.png',
    'assets/shoes/25.png',
  ];

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    Widget indicator(int index) {
      return Obx(
        () => Container(
          width: controller.indicatorIndex == index ? 16 : 4,
          height: 4,
          margin: EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: controller.indicatorIndex == index
                  ? primaryColor
                  : Color(0xffC4C4C4)),
        ),
      );
    }

    Widget header() {
      int index = -1;

      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: 20, left: defaultMargin, right: defaultMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.chevron_left),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.shopping_bag,
                    color: bgColor1,
                  ),
                ),
              ],
            ),
          ),
          CarouselSlider(
              items: images
                  .map((image) => Image.asset(
                        image,
                        width: MediaQuery.of(context).size.width,
                        height: 310,
                        fit: BoxFit.cover,
                      ))
                  .toList(),
              options: CarouselOptions(
                initialPage: 0,
                onPageChanged: (index, reason) {
                  controller.indicatorIndex.value = index;
                },
              )),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.map((e) {
              index++;
              return indicator(index);
            }).toList(),
          )
        ],
      );
    }

    Future<void> showSuccessDialog() async {
      return showDialog(
          context: context,
          builder: (BuildContext context) => Container(
                width: MediaQuery.of(context).size.width - (2 * defaultMargin),
                child: AlertDialog(
                  backgroundColor: bgColor3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  content: SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.close,
                              color: primaryTextColor,
                            ),
                          ),
                        ),
                        Image.asset(
                          "assets/images/Icon.png",
                          width: 100,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Hurray!",
                          style: primaryTextStyle.copyWith(
                              fontWeight: semibold, fontSize: 18),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Item added successfully",
                          style: secondaryTextStyle,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 154,
                          height: 44,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12))),
                              onPressed: () {
                                Navigator.pushNamed(context, "/cart-page");
                              },
                              child: Text(
                                "View My Cart",
                                style: primaryTextStyle.copyWith(
                                    fontSize: 16, fontWeight: medium),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ));
    }

    Widget familiarShoesCard(String url) {
      return Container(
        width: 54,
        height: 54,
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(url)),
            borderRadius: BorderRadius.circular(6)),
      );
    }

    Widget content() {
      int indexFamiliarShoes = -1;

      return Container(
        margin: EdgeInsets.only(top: 17),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            color: bgColor1),
        child: Column(
          children: [
            // CONTENT HEADER
            Container(
              margin: EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name!,
                          style: primaryTextStyle.copyWith(
                              fontSize: 18, fontWeight: semibold),
                        ),
                        Text(product.category!.name!,
                            style: secondaryTextStyle.copyWith(fontSize: 12)),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      wishlistProvider.setProduct(product);

                      if (wishlistProvider.isWishlist(product)) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: secondaryColor,
                            content: Text("Has been added to the Wishlist",
                                textAlign: TextAlign.center)));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: alertColor,
                            content: Text("Has been removed from the Wishlist",
                                textAlign: TextAlign.center)));
                      }
                    },
                    child: Image.asset(
                      wishlistProvider.isWishlist(product)
                          ? "assets/images/lovebutton.png"
                          : "assets/images/love-unactive-button.png",
                      width: 46,
                    ),
                  )
                ],
              ),
            ),

            // CONTENT PRICE
            Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              margin: EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin),
              decoration: BoxDecoration(
                  color: bgColor3, borderRadius: BorderRadius.circular(4)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Price starts from",
                    style: primaryTextStyle,
                  ),
                  Text(
                    "\$${product.price}",
                    style: priceTextStyle.copyWith(
                        fontSize: 16, fontWeight: semibold),
                  )
                ],
              ),
            ),

            // CONTENT DESCRIPTION
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: primaryTextStyle.copyWith(fontWeight: medium),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    product.description!,
                    style: subtitleTextStyle.copyWith(fontWeight: light),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),

            // CONTENT FAMILIAR SHOES
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Text(
                      "Familiar Shoes",
                      style: primaryTextStyle.copyWith(fontWeight: medium),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: familiarShoes.map((img) {
                        indexFamiliarShoes++;
                        return Container(
                            margin: EdgeInsets.only(
                                left: indexFamiliarShoes == 0
                                    ? defaultMargin
                                    : 0),
                            child: familiarShoesCard(img));
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),

            // CONTENT BUTTONS
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(defaultMargin),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.DETAIL_CHAT_PAGE, arguments: product);
                    },
                    child: Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/button-chat.png"))),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      height: 54,
                      child: TextButton(
                          onPressed: () {
                            cartProvider.addCard(product);
                            showSuccessDialog();
                          },
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              backgroundColor: primaryColor),
                          child: Text(
                            "Add to Cart",
                            style: primaryTextStyle,
                          )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: bgColor6,
        body: ListView(
          children: [header(), content()],
        ));
  }
}
