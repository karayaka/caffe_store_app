import 'package:caffe_store_app/app_tools/tools.dart';
import 'package:caffe_store_app/core/components/cached_network_image_component.dart';
import 'package:caffe_store_app/core/components/custom_circular_progress.dart';
import 'package:caffe_store_app/core/components/horizontal_select_component.dart';
import 'package:caffe_store_app/core/components/order_progress_component.dart';
import 'package:caffe_store_app/datas/controllers/order_controller.dart';
import 'package:caffe_store_app/datas/models/order_models/order_list_model.dart';
import 'package:caffe_store_app/routings/route_couns.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderPage extends StatelessWidget {
  var ctrl = Get.find<OrderController>();
  OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (ctrl.showLoginPage.value) {
        return Center(
          child: ElevatedButton(
            child: const Text("Giriş/Kayıt"),
            onPressed: () {
              Get.toNamed(RouteConst.security);
            },
          ),
        );
      } else {
        return _buildPage();
      }
    });
  }

  Widget _buildPage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 55,
            child: HorizontalSelectComponent(
              initVal: -1,
              items: Tools.orderStatuses,
              onChange: (int val) {
                ctrl.getPage(id: val);
              },
            ),
          ),
          Expanded(child: _listLoader()),
        ],
      ),
    );
  }

  Widget _listLoader() {
    return Obx(() {
      if (ctrl.pageLoding.value) {
        return CustomCircularProgress();
      } else {
        return Padding(
          padding: EdgeInsets.all(4),
          child: ListView.builder(
            itemCount: ctrl.orders.length,
            itemBuilder: (context, i) {
              var order = ctrl.orders[i];
              return _buildOrderItem(order);
            },
          ),
        );
      }
    });
  }

  Widget _buildOrderItem(OrderListModel order) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _cardHeaderBuilder(order),
          ),
          const Divider(),
          _cardDetailBuilder(order),
        ],
      ),
    );
  }

  Widget _cardDetailBuilder(OrderListModel order) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 110,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: order.baskets?.length,
          itemBuilder: (context, i) {
            var basket = order.baskets?[i];
            return InkWell(
              onTap: () {
                Get.toNamed(RouteConst.add_basket, arguments: {
                  "ID": basket?.id,
                  "title": basket?.productName
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CachedNetworkImageComponent(
                      url: basket?.image ?? "",
                      width: 60,
                      height: 60,
                    ),
                    Text(
                      "${basket?.productName}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "(${basket?.quantity})/${basket?.totalPrice} ₺",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _cardHeaderBuilder(OrderListModel order) {
    return SizedBox(
      height: 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FittedBox(
                child: Text(
                  "Kod: ${order.orderCode}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              OrderProgressComponent(orderStatus: order.orderStatus ?? 0),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text("Adet: ${order.productCount}"),
              const SizedBox(
                width: 20,
              ),
              Text("Toplam: ${order.orderTotal} ₺"),
            ],
          )
        ],
      ),
    );
  }
}
