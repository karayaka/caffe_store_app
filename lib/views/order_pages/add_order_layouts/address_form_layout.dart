import 'package:caffe_store_app/app_tools/form_validations.dart';
import 'package:caffe_store_app/core/components/adress_select_component.dart';
import 'package:caffe_store_app/core/components/custom_circular_progress.dart';
import 'package:caffe_store_app/core/components/custom_radio_component.dart';
import 'package:caffe_store_app/core/components/custom_select_component.dart';
import 'package:caffe_store_app/datas/controllers/add_order_controller.dart';
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
              Obx(() {
                if (ctrl.lodingFormAdress.value) {
                  return CustomCircularProgress();
                } else {
                  return _formLoading(context);
                }
              })
            ],
          ),
        ),
      ),
    );
  }

  Column _formLoading(BuildContext context) {
    return Column(
      children: [
        _buildAdressForm(context),
        const SizedBox(
          height: 10,
        ),
        _buildPeriotForm()
      ],
    );
  }

  Widget _buildPeriotForm() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Teslimat Zamanı",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomSelectComponent(
              items: ctrl.periots,
              dropdownLabel: "Teslimat Periyotu",
              onChange: (val) {},
              selectedId: 0,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAdressForm(context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Visibility(
          visible: ctrl.showAdressForm.value,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(-12),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    hintText: "AdresDetail",
                    hintStyle: TextStyle()),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
