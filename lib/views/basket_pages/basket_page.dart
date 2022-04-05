import 'package:caffe_store_app/datas/controllers/basket_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasketPage extends StatelessWidget {
  var ctrl = Get.find<BasketController>();

  BasketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("ctrl.bskd"),
    );
  }
}
