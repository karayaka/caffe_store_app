import 'package:caffe_store_app/core/components/cached_network_image_component.dart';
import 'package:caffe_store_app/core/components/custom_circular_progress.dart';
import 'package:caffe_store_app/core/components/piece_select_component.dart';
import 'package:caffe_store_app/datas/controllers/add_basket_controller.dart';
import 'package:caffe_store_app/datas/models/product_models/product_question_model.dart';
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
          return const CustomCircularProgress();
        }
      }),
    );
  }

  _buildScrean() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 8,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [_buildTitleCard(), ..._buildQuestions()]),
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
            child: FittedBox(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PieceSelectComponent(
                      onChange: (p) {
                        ctrl.calculatePiece(p);
                      },
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Obx(
                      () => Text(
                        "Toplam: ${ctrl.totalCoust.toStringAsFixed(2)} ₺",
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    _buildSaveButton()
                  ]),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSaveButton() => Obx(() {
        if (ctrl.addButtonLoading.value) {
          return const CustomCircularProgress();
        } else {
          return ElevatedButton(
            onPressed: () {
              ctrl.adBasket();
            },
            child: const Text("Sepete Ekle"),
          );
        }
      });

  List<Widget> _buildQuestions() {
    var questions = ctrl.product.questions;
    if (ctrl.product.hasNotSpesification ?? true) {
      return [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(ctrl.product.desc ?? ""),
        ),
      ];
    } else {
      return questions!.map((e) {
        return GetBuilder<AddBasketController>(
          id: "select_${e.id}",
          builder: (ct) {
            return Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Get.theme.colorScheme.secondary))),
                child: _buildSelection(e));
          },
        );
      }).toList();
    }
  }

  Widget _buildSelection(ProductQuestionModel? question) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("${question?.questionDesc}:",
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      ..._buildSelectionDetail(question)
    ]);
  }

  List<Widget> _buildSelectionDetail(ProductQuestionModel? question) {
    return question!.productFeaturesReplies!.map((e) {
      return RadioListTile<int>(
          groupValue: question.selectedVal,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(e.replyDesc ?? ""),
              (e.extraCost! <= 0) ? Container() : Text("${e.extraCost} ₺"),
            ],
          ),
          value: e.id ?? 0,
          onChanged: (val) {
            question.selectedVal = val ?? 0;
            ctrl.calculateTotal(question.id ?? 0, e.id ?? 0);
          });
    }).toList();
  }

  Widget _buildTitleCard() {
    return Stack(
      children: [
        Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                //border: Border.all(),
                ),
            height: 200,
            child: CachedNetworkImageComponent(url: ctrl.product.image ?? "")),
        Positioned(
            bottom: 20,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Get.theme.colorScheme.primary),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${ctrl.product.price}₺",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffe1be36)),
                ),
              ),
            ))
      ],
    );
  }
}
