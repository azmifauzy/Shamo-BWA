import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/app/models/user_model.dart';
import 'package:shamo_app/app/providers/auth_provider.dart';
import 'package:shamo_app/app/providers/product_provider.dart';
import 'package:shamo_app/theme.dart';
import 'package:shamo_app/app/widgets/ProductCard.dart';
import 'package:shamo_app/app/widgets/ProductTile.dart';
import 'package:shamo_app/app/widgets/SectionTitle.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    UserModel user = authProvider.user;
    final String urlPhoto = user.profilePhotoUrl == null
        ? "https://ui-avatars.com/api/?background=random&&name=${user.name!.toLowerCase()}"
        : user.profilePhotoUrl!;

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hallo, ${user.name}",
                    style: primaryTextStyle.copyWith(
                        fontSize: 24, fontWeight: semibold),
                  ),
                  Text(
                    "@${user.username}",
                    style: subtitleTextStyle.copyWith(
                        fontSize: 16, fontWeight: regular),
                  )
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: NetworkImage(urlPhoto))),
            )
          ],
        ),
      );
    }

    Widget categories() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: primaryColor),
                child: Text(
                  "All Shoes",
                  style: primaryTextStyle.copyWith(
                      fontSize: 13, fontWeight: medium),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    border: Border.all(color: subtitleColor),
                    borderRadius: BorderRadius.circular(12),
                    color: transparentColor),
                child: Text(
                  "Running",
                  style: subtitleTextStyle.copyWith(
                      fontSize: 13, fontWeight: medium),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    border: Border.all(color: subtitleColor),
                    borderRadius: BorderRadius.circular(12),
                    color: transparentColor),
                child: Text(
                  "Hiking",
                  style: subtitleTextStyle.copyWith(
                      fontSize: 13, fontWeight: medium),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    border: Border.all(color: subtitleColor),
                    borderRadius: BorderRadius.circular(12),
                    color: transparentColor),
                child: Text(
                  "Training",
                  style: subtitleTextStyle.copyWith(
                      fontSize: 13, fontWeight: medium),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget popularProducts() {
      return Container(
        margin:
            EdgeInsets.only(top: 14, left: defaultMargin, right: defaultMargin),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Row(
                children: productProvider.products
                    .map((product) => ProductCard(product))
                    .toList(),
              )
            ],
          ),
        ),
      );
    }

    Widget newArrivals() {
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: Column(
          children: productProvider.products
              .map((product) => ProductTile(product))
              .toList(),
        ),
      );
    }

    return ListView(
      children: [
        header(),
        categories(),
        SectionTitle(title: "Popular Products"),
        popularProducts(),
        SectionTitle(title: "New Arrivals"),
        newArrivals()
      ],
    );
  }
}
