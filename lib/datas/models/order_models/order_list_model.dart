import 'package:caffe_store_app/datas/models/base_models/base_service_model.dart';
import 'package:caffe_store_app/datas/models/basket_models/basket_list_model.dart';

class OrderListModel extends BaseServiceModel {
  int? id;
  int? orderStatus;
  String? orderCode;
  double? orderTotal;
  int? productCount;
  List<BasketListModel>? baskets;

  OrderListModel({
    this.id,
    this.productCount,
    this.baskets,
    this.orderCode,
    this.orderStatus,
    this.orderTotal,
  });

  @override
  fromMap(Map<String, dynamic> map) {
    var order = OrderListModel(
      id: map["id"],
      orderCode: map["orderCode"],
      orderStatus: map["orderStatus"],
      orderTotal: map["orderTotal"],
      productCount: map["productCount"],
    );
    if (map["baskets"] != null) {
      List<BasketListModel> basketList = [];
      for (var basket in map["baskets"]) {
        basketList.add(BasketListModel().fromMap(basket));
      }
      order.baskets = basketList;
    }
    return order;
  }

  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "orderCode": orderCode,
        "orderStatus": orderStatus,
        "orderTotal": orderTotal,
        "productCount": productCount,
        "baskets": baskets?.map((e) => e.toMap()).toList(),
      };
}
