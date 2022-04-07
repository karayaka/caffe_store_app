import 'package:caffe_store_app/datas/controllers/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends BaseController {
  late PageController pageController;
  var titles = ["Ürünler", "Sepetim", "Siparişlerim", "Profilim"];

  @override
  void onInit() {
    pageController = PageController(initialPage: currentIndex.value);
    super.onInit();
  }

  var currentIndex = 0.obs;

  onTapChange(int index) {
    currentIndex.value = index;
    pageController.animateToPage(index,
        duration: const Duration(microseconds: 300), curve: Curves.bounceIn);
  }
}
