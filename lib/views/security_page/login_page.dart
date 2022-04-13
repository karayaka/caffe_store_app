import 'package:caffe_store_app/app_tools/form_validations.dart';
import 'package:caffe_store_app/core/components/custom_circular_progress.dart';
import 'package:caffe_store_app/datas/controllers/security_controller.dart';
import 'package:caffe_store_app/theme_datas/my_colors.dart';
import 'package:caffe_store_app/theme_datas/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  var ctrl = Get.find<SecurityController>();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      scrollDirection: Axis.vertical,
      child: Align(
        alignment: Alignment.topCenter,
        child: Form(
          key: ctrl.loginFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(height: 5),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red[400]),
                  ),
                  Container(width: 15),
                  Text("Giriş Yapın",
                      style: MyText.subhead(context)!
                          .copyWith(color: MyColors.grey_80)),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Container(height: 20),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 1,
                margin: const EdgeInsets.all(0),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        maxLines: 1,
                        validator: FormValidation.phoneNumberValidator,
                        keyboardType: TextInputType.number,
                        onChanged: (val) {
                          ctrl.loginModel.userName = val;
                        },
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(-12),
                            hintText: "Telefon",
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
                        validator: FormValidation.notEmty,
                        onChanged: (val) {
                          ctrl.loginModel.password = val;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(-12),
                            border: InputBorder.none,
                            hintText: "Şifre",
                            hintStyle: MyText.body1(context)!
                                .copyWith(color: MyColors.grey_40)),
                      ),
                    ),
                    _buildButton(context),
                  ],
                ),
              ),
              Container(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      ctrl.jumpToPage(0);
                    },
                    child: Text("Kayıt Ol",
                        style: MyText.subhead(context)!.copyWith(
                            color: Get.theme.colorScheme.secondary,
                            fontWeight: FontWeight.bold)),
                  ),
                  Text("veya",
                      style: MyText.subhead(context)!
                          .copyWith(color: MyColors.grey_60)),
                  TextButton(
                    onPressed: () {
                      ctrl.jumpToPage(2);
                    },
                    child: Text("Şifre Sıfırla",
                        style: MyText.subhead(context)!.copyWith(
                            color: Get.theme.colorScheme.secondary,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Obx(() {
      if (ctrl.loginLoading.value) {
        return const Padding(
          padding: EdgeInsets.all(8),
          child: CustomCircularProgress(),
        );
      } else {
        return Material(
          color: Get.theme.primaryColor,
          child: InkWell(
              highlightColor: Colors.black.withOpacity(0.2),
              splashColor: Colors.black.withOpacity(0.2),
              onTap: () {
                ctrl.login();
              },
              child: Container(
                height: 50,
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Text("Kayıt Ol",
                    style:
                        MyText.body2(context)!.copyWith(color: Colors.white)),
              )),
        );
      }
    });
  }
}
