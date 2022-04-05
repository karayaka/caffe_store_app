import 'package:caffe_store_app/datas/controllers/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routings/route_couns.dart';

class MainController extends BaseController {
  late PageController pageController;

  @override
  void onInit() {
    pageController = PageController(initialPage: currentIndex.value);
    super.onInit();
  }

  var currentIndex = 0.obs;

  onTapChange(index) {
    if (index == 4) {
      Get.toNamed(RouteConst.login);
    } else {
      currentIndex.value = index;
      pageController.animateToPage(index,
          duration: const Duration(microseconds: 300), curve: Curves.bounceIn);
    }
  }
}
