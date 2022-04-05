import 'package:caffe_store_app/core/component_models/base_component.dart/custom_circular_progress.dart';
import 'package:caffe_store_app/datas/controllers/home_controller.dart';
import 'package:caffe_store_app/enums/screan_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeLayout extends StatelessWidget {
  var ctrl = Get.find<HomeController>();
  HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (ctrl.state.value == ScreanState.loding) {
        return const CustomCircularProgress();
      } else {
        return _buildList();
      }
    });
  }

  Widget _buildList() {
    return ListView.builder(
        itemCount: ctrl.products.length,
        itemBuilder: (_, i) {
          var item = ctrl.products[i];
          return Text(item.name ?? "");
        });
  }
}
