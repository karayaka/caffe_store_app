import 'package:caffe_store_app/app_tools/form_validations.dart';
import 'package:caffe_store_app/core/component_models/select_component_model.dart';
import 'package:caffe_store_app/core/components/adress_select_component.dart';
import 'package:caffe_store_app/core/components/custom_circular_progress.dart';
import 'package:caffe_store_app/core/components/custom_radio_component.dart';
import 'package:caffe_store_app/core/components/custom_select_component.dart';
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
              CustomRadioComponent(
                onChange: (val) {
                  ctrl.changeOrderTypeStatus(val);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              _buildAdressForm(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAdressForm(context) {
    print(ctrl.showAdressForm.value);
    return Obx(() {
      if (ctrl.lodingFormAdress.value) {
        return CustomCircularProgress();
      } else {
        return Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Visibility(
              visible: ctrl.showAdressForm.value,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Adres Bilgileri",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    AdressSelectComponent(
                      province: ctrl.provinces,
                      getDistrict: ctrl.getDistrict,
                      getNeighborhood: ctrl.getNeighborhood,
                      onChange: (val) {},
                    ),
                    Container(
                      height: 50,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        maxLines: 1,
                        validator: FormValidation.notEmty,
                        onChanged: (val) {},
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(-12),
                            border: OutlineInputBorder(),
                            hintText: "AdresDetail",
                            hintStyle: TextStyle()),
                      ),
                    )
                  ]),
            ),
          ),
        );
      }
    });
  }
}
