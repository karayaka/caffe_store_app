import 'package:caffe_store_app/core/component_models/select_component_model.dart';
import 'package:caffe_store_app/datas/models/base_models/base_result.dart';
import 'package:caffe_store_app/datas/models/basket_models/basket_change_quantity_model.dart';
import 'package:caffe_store_app/datas/models/basket_models/basket_create_model.dart';
import 'package:caffe_store_app/datas/models/basket_models/basket_list_model.dart';
import 'package:caffe_store_app/datas/models/order_models/order_create_model.dart';
import 'package:caffe_store_app/datas/models/order_models/order_list_model.dart';
import 'package:caffe_store_app/datas/models/product_models/product_detail_model.dart';
import 'package:caffe_store_app/datas/models/product_models/product_model.dart';
import 'package:caffe_store_app/datas/models/security_models/register_model.dart';
import 'package:caffe_store_app/datas/services/base_service.dart';
import 'package:dio/dio.dart';

class HomeRepository {
  Future<BaseResult> getProduct(
    int categoryID,
  ) async {
    try {
      BaseResult model = await BaseService.instance!.dioGet<ProductModel>(
          "Product/GetProductList/$categoryID", ProductModel());
      return model;
    } catch (e) {
      throw e;
    }
  }

  Future<BaseResult> getProductDetail(int ID, String token) async {
    try {
      BaseResult model = await BaseService.instance!.dioGet<ProductDetailModel>(
          "Product/GetProductDetail/${ID}", ProductDetailModel(),
          token: token);
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

  Future<BaseResult> addBasket(
      BasketCreateModel createModel, String token) async {
    try {
      var formData = FormData.fromMap(createModel.toMap());
      BaseResult model = await BaseService.instance!.dioPost<BasketCreateModel>(
        "Basket/AddBasket",
        BasketCreateModel(),
        formData,
        token: token,
      );
      return model;
    } catch (e) {
      throw e;
    }
  }

  Future<BaseResult> deleteBasket(int ID, String token) async {
    try {
      return await BaseService.instance!.dioGet<BasketListModel>(
          "Basket/DeleteBasket/${ID}", BasketListModel(),
          token: token);
    } catch (e) {
      throw e;
    }
  }

  Future<BaseResult> getProvidence(String token) async {
    try {
      return await BaseService.instance!.dioGet<SelectComponentModel>(
        "Defination/GetProvince",
        SelectComponentModel(),
        token: token,
      );
    } catch (e) {
      throw e;
    }
  }

  Future<BaseResult> getPeriot(String token) async {
    try {
      return await BaseService.instance!.dioGet<SelectComponentModel>(
        "Defination/GetPeriot",
        SelectComponentModel(),
        token: token,
      );
    } catch (e) {
      throw e;
    }
  }

  Future<BaseResult> getDistrict(String token, int id) async {
    try {
      return await BaseService.instance!.dioGet<SelectComponentModel>(
        "Defination/GetDistrict/${id}",
        SelectComponentModel(),
        token: token,
      );
    } catch (e) {
      throw e;
    }
  }

  Future<BaseResult> getNeighborhood(String token, int id) async {
    try {
      return await BaseService.instance!.dioGet<SelectComponentModel>(
        "Defination/GetNeighborhood/${id}",
        SelectComponentModel(),
        token: token,
      );
    } catch (e) {
      throw e;
    }
  }

  Future<BaseResult> getCategory() async {
    try {
      return await BaseService.instance!.dioGet<SelectComponentModel>(
        "Defination/GetCategorys",
        SelectComponentModel(),
      );
    } catch (e) {
      throw e;
    }
  }

  Future<BaseResult> changeBasketQuantity(
      BasketChangeQuantityModel model, String token) {
    try {
      var formData = FormData.fromMap(model.toMap());
      return BaseService.instance!.dioPost<BasketChangeQuantityModel>(
        "Basket/ChangeBasketQuantity",
        BasketChangeQuantityModel(),
        formData,
        token: token,
      );
    } catch (e) {
      throw e;
    }
  }

  Future<BaseResult> addOrder(OrderCreateModel model, String token) {
    try {
      var formData = FormData.fromMap(model.toMap());
      return BaseService.instance!.dioPost<BasketChangeQuantityModel>(
        "Order/AddOrder",
        BasketChangeQuantityModel(),
        formData,
        token: token,
      );
    } catch (e) {
      throw e;
    }
  }

  Future<BaseResult> getOrders(String token, int id) async {
    try {
      return await BaseService.instance!.dioGet<OrderListModel>(
        "Order/GetOrders/${id}",
        OrderListModel(),
        token: token,
      );
    } catch (e) {
      throw e;
    }
  }

  Future<BaseResult> getProfile(String token) async {
    try {
      return await BaseService.instance!.dioGet<RegisterModel>(
        "Security/GetProfile",
        RegisterModel(),
        token: token,
      );
    } catch (e) {
      throw e;
    }
  }

  Future<BaseResult> updateProfile(RegisterModel model, String token) {
    try {
      var formData = FormData.fromMap(model.toMap());
      return BaseService.instance!.dioPost<RegisterModel>(
        "Security/UpdateProfile",
        RegisterModel(),
        formData,
        token: token,
      );
    } catch (e) {
      throw e;
    }
  }
}
