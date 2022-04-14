import 'package:caffe_store_app/datas/models/base_models/base_result.dart';
import 'package:caffe_store_app/datas/models/basket_models/basket_list_model.dart';
import 'package:caffe_store_app/datas/models/product_models/product_detail_model.dart';
import 'package:caffe_store_app/datas/models/product_models/product_model.dart';
import 'package:caffe_store_app/datas/services/base_service.dart';

class HomeRepository {
  Future<BaseResult> getProduct(int pageID) async {
    try {
      BaseResult model = await BaseService.instance!.dioGet<ProductModel>(
          "Product/GetProductList/${pageID}", ProductModel());
      return model;
    } catch (e) {
      throw e;
    }
  }

  Future<BaseResult> getProductDetail(int ID) async {
    try {
      BaseResult model = await BaseService.instance!.dioGet<ProductDetailModel>(
          "Product/GetProductDetail/${ID}", ProductDetailModel());
      return model;
    } catch (e) {
      throw e;
    }
  }

  Future<BaseResult> getBaskets(String token) async {
    try {
      BaseResult model = await BaseService.instance!.dioGet<BasketListModel>(
        "Basket/GetBasket",
        BasketListModel(),
        token: token,
      );
      return model;
    } catch (e) {
      throw e;
    }
  }
}
