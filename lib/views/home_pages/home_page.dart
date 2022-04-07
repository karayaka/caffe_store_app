import 'package:caffe_store_app/datas/controllers/main_controller.dart';
import 'package:caffe_store_app/views/basket_pages/basket_page.dart';
import 'package:caffe_store_app/views/home_pages/home_layout.dart';
import 'package:caffe_store_app/views/order_pages/order_page.dart';
import 'package:caffe_store_app/views/profile_pages/profile_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  var ctrl = Get.find<MainController>();
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Obx(() => _buildTitle()),
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
            onTap: ctrl.onTapChange,
            currentIndex: ctrl.currentIndex.value,
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Get.theme.primaryColor,
                  icon: const Icon(Icons.home_outlined),
                  label: "Ana Sayfa"),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_basket_outlined), label: "Sepatim"),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.local_shipping_outlined),
                  label: "Siparişlerim"),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.people), label: "Profilim")
            ]);
      }),
      body: PageView(
        onPageChanged: ctrl.onTapChange,
        controller: ctrl.pageController,
        children: [HomeLayout(), BasketPage(), OrderPage(), ProfilePage()],
      ),
    );
  }

  Widget _buildTitle() {
    return AnimatedSwitcher(
      duration: Duration(seconds: 1),
      switchInCurve: Curves.easeInBack,
      switchOutCurve: Curves.easeInBack,
      transitionBuilder: (child, animation) {
        return SizeTransition(
          sizeFactor: animation,
          axis: Axis.horizontal,
          child: child,
        );
      },
      child: Text(
        ctrl.titles[ctrl.currentIndex.value],
        key: Key(ctrl.currentIndex.value.toString()),
      ),
    );
  }

  /*Widget _buildTitle() {
    return AnimatedSwitcher(
      duration: Duration(seconds: 1),
      switchInCurve: Curves.easeInBack,
      switchOutCurve: Curves.easeInBack,
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: Text(
        ctrl.titles[ctrl.currentIndex.value],
        key: Key(ctrl.currentIndex.value.toString()),
      ),
    );
  }*/

}
