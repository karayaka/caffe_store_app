import 'package:caffe_store_app/datas/models/base_models/base_service_model.dart';
import 'package:caffe_store_app/datas/models/product_models/product_replay_model.dart';

class ProductQuestionModel extends BaseServiceModel {
  int? id;
  String? questionDesc;
  List<ProductReplayModel>? productFeaturesReplies;

  ProductQuestionModel({
    this.id,
    this.questionDesc,
    this.productFeaturesReplies,
  });

  @override
  fromMap(Map<String, dynamic> map) {
    List<ProductReplayModel> productFeaturesReplies = [];
    var prdct = ProductQuestionModel(
      id: map["id"],
      questionDesc: map["questionDesc"],
    );
    if (map["productFeaturesReplies"] != null) {
      for (var item in map["productFeaturesReplies"]) {
        productFeaturesReplies.add(ProductReplayModel().fromMap(item));
      }
    }
    prdct.productFeaturesReplies = productFeaturesReplies;
    return prdct;
  }

  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "questionDesc": questionDesc,
        "productFeaturesReplies":
            productFeaturesReplies?.map((e) => e.toMap()).toList(),
      };
}
