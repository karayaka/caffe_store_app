import 'package:caffe_store_app/app_tools/form_validations.dart';
import 'package:caffe_store_app/datas/controllers/add_order_controller.dart';
import 'package:caffe_store_app/theme_datas/my_colors.dart';
import 'package:caffe_store_app/theme_datas/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdressFormLayout extends StatelessWidget {
  var ctrl = Get.find<AddOrderController>();
  AdressFormLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.size.height - 250,
      child: Form(
        key: ctrl.adressFormKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  maxLines: 1,
                  validator: FormValidation.notEmty,
                  onChanged: (val) {},
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(-12),
                      border: InputBorder.none,
                      hintText: "Ad",
                      hintStyle: MyText.body1(context)!
                          .copyWith(color: MyColors.grey_40)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
