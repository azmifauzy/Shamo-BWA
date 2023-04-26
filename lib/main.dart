import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/app/modules/MainPage/bindings/main_page_binding.dart';
import 'package:shamo_app/app/modules/splash_page/views/splash_page_view.dart';
import 'package:shamo_app/app/providers/auth_provider.dart';
import 'package:shamo_app/app/providers/product_provider.dart';
import 'package:shamo_app/app/providers/wishlist_provider.dart';
import 'package:shamo_app/app/providers/cart_provider.dart';
import 'package:shamo_app/app/providers/transaction_provider.dart';

import 'app/routes/app_pages.dart';
import 'package:shamo_app/app/controllers/page_index_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final pageController = Get.put(PageIndexController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => WishlistProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => TransactionProvider()),
      ],
      child: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 3)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return MaterialApp(
                  debugShowCheckedModeBanner: false, home: SplashPageView());
            } else {
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: "Application",
                initialRoute: Routes.LOGIN,
                // initialRoute: AppPages.INITIAL,
                getPages: AppPages.routes,
              );
            }
          }),
    );
  }
}
