import 'package:caffe_store_app/core/components/cached_network_image_component.dart';
import 'package:caffe_store_app/core/components/custom_circular_progress.dart';
import 'package:caffe_store_app/datas/controllers/add_basket_controller.dart';
import 'package:caffe_store_app/datas/models/product_models/product_question_model.dart';
import 'package:caffe_store_app/datas/models/product_models/product_replay_model.dart';
import 'package:caffe_store_app/enums/screan_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddBasketPage extends StatelessWidget {
  AddBasketPage({Key? key}) : super(key: key);
  var ctrl = Get.find<AddBasketController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(ctrl.title),
      ),
      body: Obx(() {
        if (ctrl.isLoaded(ctrl.state)) {
          return _buildScrean();
        } else {
          return CustomCircularProgress();
        }
      }),
    );
  }

  _buildScrean() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildTitleCard(),
        SizedBox(
          height: 300,
          child: ListView.builder(
            itemCount: ctrl.product.questions?.length,
            itemBuilder: (context, i) {
              var question = ctrl.product.questions?[i];
              return _buildSelection(question);
            },
          ),
        )
      ],
    );
  }

  Widget _buildSelection(ProductQuestionModel? question) {
    double radioSize = (question?.productFeaturesReplies?.length ?? 0) * 50;
    return Container(
      height: (radioSize + 18),
      child: Column(children: [
        Text(question?.questionDesc ?? ""),
        SizedBox(
          height: radioSize,
          child: ListView.builder(
              itemCount: question?.productFeaturesReplies?.length,
              itemBuilder: (context, i) {
                var replay = question?.productFeaturesReplies?[i];
                return RadioListTile<int>(
                    title: Text(replay?.replyDesc ?? ""),
                    value: replay!.id ?? 0,
                    groupValue: question!.id ?? 0,
                    onChanged: (val) {
                      print(val);
                    });
              }),
        )
      ]),
    );
  }

  Widget _buildTitleCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              height: 200,
              child:
                  CachedNetworkImageComponent(url: ctrl.product.image ?? "")),
          Positioned(
              bottom: 20,
              right: 20,
              child: Text(
                "${ctrl.product.price}₺",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
