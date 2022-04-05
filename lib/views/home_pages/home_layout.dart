import 'package:caffe_store_app/datas/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeLayout extends StatelessWidget {
  var ctrl = Get.find<HomeController>();
  HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Home"),
    );
  }
}
