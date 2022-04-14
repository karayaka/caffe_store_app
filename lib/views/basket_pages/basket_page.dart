import 'package:caffe_store_app/core/components/custom_circular_progress.dart';
import 'package:caffe_store_app/datas/controllers/basket_controller.dart';
import 'package:caffe_store_app/enums/screan_state.dart';
import 'package:caffe_store_app/routings/route_couns.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasketPage extends StatelessWidget {
  var ctrl = Get.find<BasketController>();

  BasketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ctrl.isLogined.value) {
      return _buildPage();
    } else {
      return Center(
        child: ElevatedButton(
          child: Text("Giri/Kayıt"),
          onPressed: () {
            Get.toNamed(RouteConst.security);
          },
        ),
      );
    }
  }

  Widget _buildPage() {
    if (ctrl.state.value == ScreanState.loading) {
      return CustomCircularProgress();
    } else {
      return _buildListView();
    }
  }

  ///Basket Yapısı Kurgulacak Ad BAsket Yapılmalı
  ListView _buildListView() {
    return ListView.builder(
      itemCount: ctrl.baskets.length,
      itemBuilder: ((context, index) {
        return Text("Baskets");
      }),
    );
  }
}
