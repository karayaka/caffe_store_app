import 'package:caffe_store_app/core/components/cached_network_image_component.dart';
import 'package:caffe_store_app/core/components/custom_circular_progress.dart';
import 'package:caffe_store_app/core/components/piece_select_component.dart';
import 'package:caffe_store_app/datas/controllers/basket_controller.dart';
import 'package:caffe_store_app/datas/models/basket_models/basket_list_model.dart';
import 'package:caffe_store_app/routings/route_couns.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasketPage extends StatelessWidget {
  var ctrl = Get.find<BasketController>();

  BasketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(() {
        if (ctrl.isLogined.value) {
          return _buildPage();
        } else {
          return Center(
            child: ElevatedButton(
              child: const Text("Giriş/Kayıt"),
              onPressed: () {
                Get.toNamed(RouteConst.security);
              },
            ),
          );
        }
      });

  Widget _buildPage() {
    if (ctrl.basketListLoading.value) {
      return const CustomCircularProgress();
    } else {
      return _buildListView();
    }
  }

  ///Basket Yapısı Kurgulacak Ad BAsket Yapılmalı
  Widget _buildListView() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: ctrl.baskets.length,
            itemBuilder: ((context, index) {
              var basket = ctrl.baskets[index];
              return _buildBasketCard(basket, index);
            }),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                blurStyle: BlurStyle.outer,
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(5),
          ),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: _buildTotalWidget(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _buildButton(),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildButton() {
    if (ctrl.orderButtonLoading.value) {
      return CustomCircularProgress();
    } else {
      return ElevatedButton(
        child: const Text("Sipariş Et"),
        onPressed: () {
          Get.toNamed(RouteConst.addOrder);
        },
      );
    }
  }

  Obx _buildTotalWidget() {
    return Obx(() => Text(
          "${ctrl.basketTotal.value.toStringAsFixed(2)} ₺",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ));
  }

  Widget _buildBasketCard(BasketListModel basket, int i) {
    return Container(
      decoration: BoxDecoration(
        color: (i % 2 == 0) ? Colors.white : Colors.grey.shade100,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: CachedNetworkImageComponent(
              url: basket.image ?? "",
            ),
          ),
          Expanded(
            flex: 6,
            child: ListTile(
              title: Text(basket.productName ?? ""),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(basket.desc ?? ""),
                  Text("${basket.unitPrice} ₺"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PieceSelectComponent(
                        initCount: basket.quantity ?? 0,
                        onChange: (val) {
                          if (val != basket.quantity) {
                            ctrl.changeBasketQuantity(basket.id ?? 0, val);
                          }
                        },
                      ),
                      _buildCardTotal(basket),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(flex: 1, child: _buildDeleteButton(basket)),
        ],
      ),
    );
  }

  Widget _buildDeleteButton(BasketListModel basket) {
    return GetBuilder<BasketController>(
      id: "delete_${basket.id}",
      builder: (contoller) {
        if (ctrl.deletedLodingID == basket.id) {
          return const CustomCircularProgress();
        } else {
          return TextButton(
            onPressed: () {
              ctrl.deleteBasket(basket.id ?? 0);
            },
            child: const Text(
              "Sil",
              style: TextStyle(color: Colors.red),
            ),
          );
        }
      },
    );
  }

  Widget _buildCardTotal(BasketListModel basket) {
    return GetBuilder<BasketController>(
        id: "cardTota_${basket.id}",
        builder: ((controller) {
          if (ctrl.pieceLodingID == basket.id) {
            return CustomCircularProgress();
          } else {
            return Text(
              "${basket.totalPrice?.toStringAsFixed(2)} ₺",
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            );
          }
        }));
  }
}
