import 'package:caffe_store_app/app_tools/form_validations.dart';
import 'package:caffe_store_app/core/components/custom_circular_progress.dart';
import 'package:caffe_store_app/core/components/timer_button_component.dart';
import 'package:caffe_store_app/datas/controllers/forget_password_confirme_controller.dart';
import 'package:caffe_store_app/theme_datas/my_colors.dart';
import 'package:caffe_store_app/theme_datas/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';

class ForgetrPasswordConfirmePage extends StatelessWidget {
  var ctrl = Get.find<ForgetPasswordConfirmeController>();
  ForgetrPasswordConfirmePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Numara Doğrulama"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: ctrl.formKey,
          child: SingleChildScrollView(
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
                  Container(
                    height: 50,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      maxLines: 1,
                      obscureText: true,
                      validator: FormValidation.passwordValidator,
                      onChanged: (val) {
                        ctrl.password = val;
                      },
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(-12),
                          hintText: "Şifre",
                          hintStyle: MyText.body1(context)!
                              .copyWith(color: MyColors.grey_40)),
                    ),
                  ),
                  Container(
                    height: 50,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      maxLines: 1,
                      obscureText: true,
                      validator: FormValidation.passwordValidator,
                      onChanged: (val) {
                        ctrl.repeadPassword = val;
                      },
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(-12),
                          hintText: "Şifre Tekrar",
                          hintStyle: MyText.body1(context)!
                              .copyWith(color: MyColors.grey_40)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
          child: const Text("Şifreyi Sıfırla"),
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
          defaultBoxSize: 30.0,
          margin: 10,
          selectedBoxSize: 30.0,
          textStyle: const TextStyle(fontSize: 14),
          /*defaultDecoration: Get. _pinPutDecoration.copyWith(
              border: Border.all(
                  color: Theme.of(context).primaryColor.withOpacity(0.6))),
          selectedDecoration: _pinPutDecoration,*/
          onChange: (code) {
            ctrl.confirmedCode.value = code;
          });
    });
  }
}
