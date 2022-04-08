import 'dart:html';

import 'package:caffe_store_app/datas/controllers/base_controller.dart';
import 'package:caffe_store_app/datas/models/basket_models/basket_detail_model.dart';
import 'package:caffe_store_app/datas/models/product_models/product_detail_model.dart';
import 'package:caffe_store_app/datas/repositorys/home_repository.dart';
import 'package:caffe_store_app/enums/screan_state.dart';
import 'package:get/get.dart';

class AddBasketController extends BaseController {
  int id = Get.arguments["ID"];
  String title = Get.arguments["title"];

  @override
  void onInit() {
    getProductDetail();
    super.onInit();
  }

  var product = ProductDetailModel();

  Rx<double> totalCoust = 0.0.obs;
  var piece = 1;

  var repo = Get.find<HomeRepository>();

  List<BasketDetailModel> baskets = [];

  getProductDetail() async {
    try {
      state.value = ScreanState.loding;
      try {
        var model = prepareServiceModel<ProductDetailModel>(
            await repo.getProductDetail(id));
        if (model != null) {
          product = model;
          totalCoust.value = model.price ?? 0;
        }
      } catch (e) {
        errorMessage(e.toString());
      }

      state.value = ScreanState.loaded;
    } catch (e) {
      errorMessage(e.toString());
      state.value = ScreanState.loaded;
    }
  }

  calculateTotal(int questionID, int replayID) {
    var question = product.questions?.firstWhere((e) => e.id == questionID);

    if (question != null) {
      if (baskets.any((e) => e.productFeaturesQuestionID == question.id)) {
        baskets.removeWhere((e) => e.productFeaturesQuestionID == question.id);
      }
      var replay =
          question.productFeaturesReplies?.firstWhere((e) => e.id == replayID);
      if (replay != null) {
        var baket = BasketDetailModel(
            id: 0,
            productFeaturesQuestionID: question.id,
            productFeaturesReplyID: replay.id,
            totalCoust: replay.extraCost ?? 0);
        baskets.add(baket);
      }
      double extraCoust = 0;
      for (var item in baskets) {
        extraCoust += item.totalCoust;
      }
      totalCoust.value = (product.price ?? 0) + extraCoust;
      update(["select_${questionID}"]);
    }
  }
}
