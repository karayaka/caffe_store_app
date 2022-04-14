import 'package:caffe_store_app/core/components/custom_circular_progress.dart';
import 'package:caffe_store_app/core/components/timer_button_component.dart';
import 'package:caffe_store_app/datas/controllers/register_phoneconfirm_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';

class RegisterPhoneConfirmePage extends StatelessWidget {
  var ctrl = Get.find<RegisterPhoneConfirmController>();

  RegisterPhoneConfirmePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Numara Doğrulama"),
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Card(
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              _builVerification(),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TimerButtonComponent(
                  onPressed: () {
                    ctrl.reSendCode();
                  },
                ),
              ),
              _buildButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton() {
    return Obx(() {
      if (ctrl.isSending.value) {
        return const CustomCircularProgress();
      } else {
        return ElevatedButton(
          child: const Text("Doğrula"),
          onPressed: () {
            ctrl.confirmeCode();
          },
        );
      }
    });
  }

  Widget _builVerification() {
    return Obx(() {
      var data = ctrl.confirmedCode.value;

      return TextFieldPin(
          textController: ctrl.confirmeTextController,
          autoFocus: true,
          codeLength: 6,
          alignment: MainAxisAlignment.center,
          defaultBoxSize: 36.0,
          margin: 10,
          selectedBoxSize: 36.0,
          textStyle: const TextStyle(fontSize: 16),
          /*defaultDecoration: Get. _pinPutDecoration.copyWith(
              border: Border.all(
                  color: Theme.of(context).primaryColor.withOpacity(0.6))),
          selectedDecoration: _pinPutDecoration,*/
          onChange: (code) {
            print(code);
            ctrl.confirmedCode.value = code;
          });
    });
  }
}
