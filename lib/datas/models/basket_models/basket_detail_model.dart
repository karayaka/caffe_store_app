import 'package:caffe_store_app/datas/models/base_models/base_service_model.dart';

class BasketDetailModel extends BaseServiceModel {
  int? id;
  int? productFeaturesQuestionID;
  int? productFeaturesReplyID;
  double totalCoust;

  BasketDetailModel(
      {this.id,
      this.productFeaturesQuestionID,
      this.productFeaturesReplyID,
      this.totalCoust = 0});

  @override
  fromMap(Map<String, dynamic> map) => BasketDetailModel(
        id: map["id"],
        productFeaturesQuestionID: map["productFeaturesQuestionID"],
        productFeaturesReplyID: map["productFeaturesReplyID"],
        totalCoust: map["totalCoust"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "productFeaturesQuestionID": productFeaturesQuestionID,
        "productFeaturesReplyID": productFeaturesReplyID,
        "totalCoust": totalCoust
      };
}
