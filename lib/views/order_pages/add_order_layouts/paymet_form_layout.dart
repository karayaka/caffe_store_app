import 'package:caffe_store_app/app_tools/form_validations.dart';
import 'package:caffe_store_app/datas/controllers/add_order_controller.dart';
import 'package:caffe_store_app/theme_datas/my_text.dart';
import 'package:caffe_store_app/theme_datas/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymetFormLayout extends StatelessWidget {
  var ctrl = Get.find<AddOrderController>();
  PaymetFormLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.size.height - 250,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: 242,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.redAccent.shade200,
                  elevation: 2,
                  margin: EdgeInsets.all(0),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset('assets/images/world_map.png',
                          fit: BoxFit.cover),
                      Container(
                        margin: const EdgeInsets.all(20),
                        alignment: Alignment.bottomRight,
                        child: Image.asset("assets/images/ic_copper_card.png",
                            width: 60, height: 60),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                const Spacer(),
                                Image.asset("assets/images/ic_visa_new.png",
                                    color: Colors.white,
                                    fit: BoxFit.cover,
                                    width: 60,
                                    height: 30),
                              ],
                            ),
                            Container(height: 10),
                            Obx(
                              () => Text(
                                ctrl.maskedCardNumber.value,
                                style: MyText.headline(context)!.copyWith(
                                    color: Colors.white,
                                    fontFamily: "monospace"),
                              ),
                            ),
                            Container(height: 10),
                            Row(
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("EXPIRE",
                                        style: MyText.body1(context)!
                                            .copyWith(color: MyColors.grey_10)),
                                    Container(height: 5),
                                    Obx(
                                      () => Text(
                                        ctrl.masketExpare.value,
                                        style: MyText.subhead(context)!
                                            .copyWith(
                                                color: Colors.white,
                                                fontFamily: "monospace"),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("CVV",
                                        style: MyText.body1(context)!
                                            .copyWith(color: MyColors.grey_10)),
                                    Container(height: 5),
                                    Obx(
                                      () => Text(
                                        ctrl.cardcvv.value,
                                        style: MyText.subhead(context)!
                                            .copyWith(
                                                color: Colors.white,
                                                fontFamily: "monospace"),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(width: 40)
                              ],
                            ),
                            Container(height: 25),
                            Obx(
                              () => Text(
                                ctrl.cardName.value,
                                style: MyText.subhead(context)!.copyWith(
                                    color: Colors.white,
                                    fontFamily: "monospace"),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Form(
                key: ctrl.paymentFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      validator: FormValidation.notEmty,
                      maxLines: 1,
                      maxLength: 19,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        ctrl.cardNmbrFormatter,
                      ],
                      decoration:
                          MyText.underLineInputDecoration("Kart Numarası"),
                      onChanged: (val) {
                        ctrl.maskedCardNumber.value =
                            ctrl.cardNmbrFormatter.getMaskedText();
                        ctrl.orderCreateModel.cardNumber =
                            ctrl.cardNmbrFormatter.getUnmaskedText();
                      },
                    ),
                    Container(height: 5),
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: TextFormField(
                            validator: FormValidation.notEmty,
                            maxLines: 1,
                            maxLength: 5,
                            inputFormatters: [
                              ctrl.expareFormatter,
                            ],
                            keyboardType: TextInputType.number,
                            decoration:
                                MyText.underLineInputDecoration("MM/YY"),
                            onChanged: (val) {
                              ctrl.masketExpare.value =
                                  ctrl.expareFormatter.getMaskedText();
                              ctrl.orderCreateModel.cardDate =val;
                            },
                          ),
                          flex: 1,
                        ),
                        Container(width: 5),
                        Flexible(
                          child: TextFormField(
                            validator: FormValidation.notEmty,
                            maxLines: 1,
                            maxLength: 3,
                            keyboardType: TextInputType.number,
                            decoration: MyText.underLineInputDecoration("CVV"),
                            onChanged: (val) {
                              ctrl.cardcvv.value = val;
                              ctrl.orderCreateModel.cvv = val;
                            },
                          ),
                          flex: 1,
                        )
                      ],
                    ),
                    Container(height: 5),
                    TextFormField(
                      validator: FormValidation.notEmty,
                      maxLines: 1,
                      maxLength: 50,
                      keyboardType: TextInputType.text,
                      decoration: MyText.underLineInputDecoration("Ad Soyad"),
                      onChanged: (val) {
                        ctrl.cardName.value = val;
                        ctrl.orderCreateModel.cardNameSurname = val;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
