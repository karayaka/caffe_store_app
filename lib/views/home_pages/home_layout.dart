import 'package:caffe_store_app/core/components/custom_circular_progress.dart';
import 'package:caffe_store_app/core/components/horizontal_select_component.dart';
import 'package:caffe_store_app/core/components/product_card_component.dart';
import 'package:caffe_store_app/datas/controllers/home_controller.dart';
import 'package:caffe_store_app/enums/screan_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class HomeLayout extends StatelessWidget {
  var ctrl = Get.find<HomeController>();
  HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 55,
        child: _buildCategorySelector(),
      ),
      Expanded(
        child: _buildPage(),
      ),
    ]);
  }

  _buildCategorySelector() => Obx(() {
        if (ctrl.categoryLoading.value) {
          return const Center(
            child: LinearProgressIndicator(),
          );
        } else {
          return HorizontalSelectComponent(
            initVal: 0,
            items: ctrl.categorys,
            onChange: (val) {
              ctrl.getProduct(val);
            },
          );
        }
      });

  _buildPage() {
    return Obx(() {
      if (ctrl.listLoading.value) {
        return const CustomCircularProgress();
      } else {
        return _buildListview();
      }
    });
  }

  Widget _buildListview() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RefreshIndicator(
        onRefresh: () {
          return ctrl.getProduct(0);
        },
        child: AnimationLimiter(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.77,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8),
              itemCount: ctrl.products.length,
              itemBuilder: (context, i) {
                var item = ctrl.products[i];
                return AnimationConfiguration.staggeredGrid(
                  position: i,
                  duration: const Duration(milliseconds: 395),
                  columnCount: 2,
                  child: SlideAnimation(
                    horizontalOffset: 50.0,
                    child: FadeInAnimation(
                      child: ProductCardComponent(
                        item: item,
                        onClick: () {
                          ctrl.routeCheck(item.id ?? 0, item.name ?? "");
                        },
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
