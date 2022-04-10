import 'package:caffe_store_app/datas/controllers/security_controller.dart';
import 'package:caffe_store_app/views/security_page/login_page.dart';
import 'package:caffe_store_app/views/security_page/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecurityPage extends StatelessWidget {
  var ctrl = Get.find<SecurityController>();
  SecurityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(""),
      ),
      body: PageView(
        children: [
          LoginPage(),
          RegisterPage(),
        ],
      ),
    );
  }
}
