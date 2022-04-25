import 'package:caffe_store_app/bindings/initial_binding.dart';
import 'package:caffe_store_app/routings/route_couns.dart';
import 'package:caffe_store_app/routings/route_pages.dart';
import 'package:caffe_store_app/theme_datas/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'STRABORN',
      theme: coffeStoreTheme,
      initialBinding: InitialBinding(),
      getPages: RoutePages.pages,
      initialRoute: RouteConst.splash,
    );
  }
}
