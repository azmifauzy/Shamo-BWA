import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/app/providers/product_provider.dart';

// import '../controllers/splash_page_controller.dart';

import '../../../../theme.dart';

class SplashPageView extends StatefulWidget {
  const SplashPageView({super.key});

  @override
  State<SplashPageView> createState() => _SplashPageViewState();
}

class _SplashPageViewState extends State<SplashPageView> {
  @override
  void initState() {
    super.initState();
    getInit();
  }

  getInit() async {
    await Provider.of<ProductProvider>(context, listen: false).getProducts();
    Timer(Duration(seconds: 3),
        () => Navigator.pushNamed(context, "/login-page"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      body: Center(
        child: Container(
          width: 130,
          height: 150,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/image_splash.png"))),
        ),
      ),
    );
  }
}
