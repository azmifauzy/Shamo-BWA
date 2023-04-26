import 'package:get/get.dart';

import '../modules/CartPage/bindings/cart_page_binding.dart';
import '../modules/CartPage/views/cart_page_view.dart';
import '../modules/ChatPage/bindings/chat_page_binding.dart';
import '../modules/ChatPage/views/chat_page_view.dart';
import '../modules/CheckoutPage/bindings/checkout_page_binding.dart';
import '../modules/CheckoutPage/views/checkout_page_view.dart';
import '../modules/CheckoutSuccessPage/bindings/checkout_success_page_binding.dart';
import '../modules/CheckoutSuccessPage/views/checkout_success_page_view.dart';
import '../modules/EditProfilePage/bindings/edit_profile_page_binding.dart';
import '../modules/EditProfilePage/views/edit_profile_page_view.dart';
import '../modules/MainPage/bindings/main_page_binding.dart';
import '../modules/MainPage/views/main_page_view.dart';
import '../modules/ProductPage/bindings/product_page_binding.dart';
import '../modules/ProductPage/views/product_page_view.dart';
import '../modules/ProfilePage/bindings/profile_page_binding.dart';
import '../modules/ProfilePage/views/profile_page_view.dart';
import '../modules/RegisterPage/bindings/register_page_binding.dart';
import '../modules/RegisterPage/views/register_page_view.dart';
import '../modules/WishlistPage/bindings/wishlist_page_binding.dart';
import '../modules/WishlistPage/views/wishlist_page_view.dart';
import '../modules/detailChatPage/bindings/detail_chat_page_binding.dart';
import '../modules/detailChatPage/views/detail_chat_page_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login_page/bindings/login_page_binding.dart';
import '../modules/login_page/views/login_page_view.dart';
import '../modules/splash_page/bindings/splash_page_binding.dart';
import '../modules/splash_page/views/splash_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashPageView(),
      binding: SplashPageBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_PAGE,
      page: () => const RegisterPageView(),
      binding: RegisterPageBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_PAGE,
      page: () => MainPageView(),
      binding: MainPageBinding(),
    ),
    GetPage(
      name: _Paths.WISHLIST_PAGE,
      page: () => WishlistPageView(),
      binding: WishlistPageBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_PAGE,
      page: () => ChatPageView(),
      binding: ChatPageBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_PAGE,
      page: () => ProfilePageView(),
      binding: ProfilePageBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_CHAT_PAGE,
      page: () => DetailChatPageView(),
      binding: DetailChatPageBinding(),
    ),
    GetPage(
      name: _Paths.CART_PAGE,
      page: () => const CartPageView(),
      binding: CartPageBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE_PAGE,
      page: () => const EditProfilePageView(),
      binding: EditProfilePageBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_PAGE,
      page: () => ProductPageView(),
      binding: ProductPageBinding(),
    ),
    GetPage(
      name: _Paths.CHECKOUT_PAGE,
      page: () => CheckoutPageView(),
      binding: CheckoutPageBinding(),
    ),
    GetPage(
      name: _Paths.CHECKOUT_SUCCESS_PAGE,
      page: () => const CheckoutSuccessPageView(),
      binding: CheckoutSuccessPageBinding(),
    ),
  ];
}
