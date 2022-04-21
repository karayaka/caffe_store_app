import 'package:caffe_store_app/datas/controllers/add_order_controller.dart';
import 'package:caffe_store_app/views/order_pages/add_order_layouts/address_form_layout.dart';
import 'package:caffe_store_app/views/order_pages/add_order_layouts/paymet_form_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddOrderPage extends StatelessWidget {
  var ctrl = Get.find<AddOrderController>();
  AddOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Siparişe Ekle"),
        ),
        body: Obx(() {
          return Stepper(
            type: StepperType.horizontal,
            currentStep: ctrl.currentSteps.value,
            onStepContinue: ctrl.onStepContinue(),
            onStepCancel: ctrl.onStepCancel(),
            steps: [
              Step(
                title: const Text("Adres Bilgileri"),
                content: Container(
                  child: AdressFormLayout(),
                ),
                isActive: ctrl.currentSteps.value == 0,
              ),
              Step(
                title: const Text("Ödeme Bilgileri"),
                content: PaymetFormLayout(),
                isActive: ctrl.currentSteps.value == 1,
              )
            ],
            controlsBuilder: (context, details) {
              return Row(children: [
                /*ElevatedButton(
                  child: const Text("Geri"),
                  onPressed: () {
                    ctrl.onStepCancel();
                  },
                ),
                const SizedBox(
                  width: 10,
                ),*/
                ElevatedButton(
                  child: const Text("İptal"),
                  onPressed: () {
                    Get.back();
                  },
                ),
                Spacer(),
                ElevatedButton(
                  child: const Text("Devam"),
                  onPressed: () {
                    ctrl.onStepContinue();
                  },
                )
              ]);
            },
          );
        }));
  }
}
