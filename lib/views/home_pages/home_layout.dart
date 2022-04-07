import 'package:caffe_store_app/core/components/custom_circular_progress.dart';
import 'package:caffe_store_app/core/components/product_card_component.dart';
import 'package:caffe_store_app/datas/controllers/home_controller.dart';
import 'package:caffe_store_app/enums/screan_state.dart';
import 'package:caffe_store_app/routings/route_couns.dart';
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
    return NotificationListener<ScrollEndNotification>(
      onNotification: (t) {
        if (t.metrics.pixels > 0 && t.metrics.atEdge) {
          if (!ctrl.nextPageLoding) {
            //ctrl.getTestNextPage(); nextpage
          }
        }
        return false;
      },
      child: Column(
        children: [
          Expanded(child: _buildListview()),
          GetBuilder<HomeController>(
              id: "loding",
              builder: (contro) {
                if (ctrl.nextPageLoding) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomCircularProgress(),
                  );
                } else {
                  return Container();
                }
              }),
        ],
      ),
    );
  }

  Padding _buildListview() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RefreshIndicator(
        onRefresh: () {
          return ctrl.getProduct();
        },
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8),
            itemCount: ctrl.products.length,
            itemBuilder: (context, i) {
              var item = ctrl.products[i];
              return ProductCardComponent(
                item: item,
                onClick: () {
                  Get.toNamed(RouteConst.add_basket,
                      arguments: {"ID": item.id, "title": item.name});
                },
              );
            }),
      ),
    );
  }
}
