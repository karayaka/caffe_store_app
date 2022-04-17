import 'package:caffe_store_app/bindings/add_basket_binding.dart';
import 'package:caffe_store_app/bindings/add_order_binding.dart';
import 'package:caffe_store_app/bindings/forget_password_confirme_binding.dart';
import 'package:caffe_store_app/bindings/home_binding.dart';
import 'package:caffe_store_app/bindings/register_phoneconfirme_binding.dart';
import 'package:caffe_store_app/bindings/security_binding.dart';
import 'package:caffe_store_app/bindings/splash_binding.dart';
import 'package:caffe_store_app/routings/route_couns.dart';
import 'package:caffe_store_app/views/basket_pages/add_basket_page.dart';
import 'package:caffe_store_app/views/home_pages/home_page.dart';
import 'package:caffe_store_app/views/order_pages/add_order_page.dart';
import 'package:caffe_store_app/views/security_page/forget_password_confirme_page.dart';
import 'package:caffe_store_app/views/security_page/register_phoneconfirme_page.dart';
import 'package:caffe_store_app/views/security_page/security_page.dart';
import 'package:caffe_store_app/views/security_page/splash_page.dart';
import 'package:get/get.dart';

class RoutePages {
  static final pages = [
    GetPage(
      name: RouteConst.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RouteConst.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: RouteConst.security,
      page: () => SecurityPage(),
      binding: SecurityBinding(),
    ),
    GetPage(
      name: RouteConst.add_basket,
      page: () => AddBasketPage(),
      binding: AddBasketBinding(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: RouteConst.registerConfirmPhone,
      page: () => RegisterPhoneConfirmePage(),
      binding: RegisterPhoneConfirmeBinding(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: RouteConst.resetPasswordConfirmPhone,
      page: () => ForgetrPasswordConfirmePage(),
      binding: ForgetPasswordConfirmeBinding(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: RouteConst.addOrder,
      page: () => AddOrderPage(),
      binding: AddOrderBinding(),
      fullscreenDialog: true,
    ),
  ];
}
