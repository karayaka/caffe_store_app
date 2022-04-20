import 'package:caffe_store_app/datas/models/base_models/base_service_model.dart';

class OrderCreateModel extends BaseServiceModel {
  int? id;
  int? orderTypeStatus;
  int? provinceID;
  int? districtID;
  int? neighborhoodID;
  int? deliveryPeriotID;
  String? adress;

  OrderCreateModel(
      {this.id,
      this.adress,
      this.deliveryPeriotID,
      this.districtID = 0,
      this.neighborhoodID = 0,
      this.provinceID = 0,
      this.orderTypeStatus});

  @override
  fromMap(Map<String, dynamic> map) => OrderCreateModel(
        adress: map["adress"],
        deliveryPeriotID: map["deliveryPeriotID"],
        districtID: map["districtID"],
        id: map["id"],
        neighborhoodID: map["neighborhoodID"],
        orderTypeStatus: map["orderTypeStatus"],
        provinceID: map["provinceID"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "adress": adress,
        "deliveryPeriotID": deliveryPeriotID,
        "districtID": districtID,
        "neighborhoodID": neighborhoodID,
        "orderTypeStatus": orderTypeStatus,
        "provinceID": provinceID,
      };
}
