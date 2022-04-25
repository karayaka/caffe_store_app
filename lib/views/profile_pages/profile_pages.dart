import 'package:caffe_store_app/app_tools/form_validations.dart';
import 'package:caffe_store_app/core/components/custom_circular_progress.dart';
import 'package:caffe_store_app/datas/controllers/profile_controller.dart';
import 'package:caffe_store_app/routings/route_couns.dart';
import 'package:caffe_store_app/theme_datas/my_colors.dart';
import 'package:caffe_store_app/theme_datas/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  var ctrl = Get.find<ProfileController>();
  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (ctrl.showLoginButton.value) {
        return Center(
          child: ElevatedButton(
            child: const Text("Giriş/Kayıt"),
            onPressed: () {
              Get.toNamed(RouteConst.security);
            },
          ),
        );
      } else {
        return _buildPage(context);
      }
    });
  }

  Widget _buildPage(BuildContext context) {
    return Obx(() {
      if (ctrl.pageLoading.value) {
        return CustomCircularProgress();
      } else {
        return _buildProfileForm(context);
      }
    });
  }

  Widget _buildProfileForm(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      scrollDirection: Axis.vertical,
      child: Align(
        alignment: Alignment.topCenter,
        child: Form(
          key: ctrl.profileFormKey,
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
                  Text("Hesap Bilgileri",
                      style: MyText.subhead(context)!
                          .copyWith(color: MyColors.grey_80)),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "(Zorunlu Alan)",
                    style: MyText.body1(context),
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
                        validator: FormValidation.phoneNumberValidator,
                        keyboardType: TextInputType.phone,
                        initialValue: ctrl.profile.phoneNumber,
                        maxLines: 1,
                        onChanged: (val) {
                          ctrl.profile.phoneNumber = val;
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
                        initialValue: ctrl.profile.password,
                        validator: FormValidation.passwordValidator,
                        onChanged: (val) {
                          ctrl.profile.password = val;
                        },
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(-12),
                            border: InputBorder.none,
                            hintText: "Şifre",
                            hintStyle: MyText.body1(context)!
                                .copyWith(color: MyColors.grey_40)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(height: 25),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green.shade300),
                  ),
                  Container(width: 15),
                  Text("Profil Bilgileri",
                      style: MyText.subhead(context)!
                          .copyWith(color: MyColors.grey_80))
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
                        initialValue: ctrl.profile.name,
                        validator: FormValidation.notEmty,
                        onChanged: (val) {
                          ctrl.profile.name = val;
                        },
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(-12),
                            border: InputBorder.none,
                            hintText: "Ad",
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
                        initialValue: ctrl.profile.surname,
                        validator: FormValidation.notEmty,
                        onChanged: (val) {
                          ctrl.profile.surname = val;
                        },
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(-12),
                            border: InputBorder.none,
                            hintText: "Soyad",
                            hintStyle: MyText.body1(context)!
                                .copyWith(color: MyColors.grey_40)),
                      ),
                    ),
                    Container(
                      height: 50,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        initialValue: ctrl.profile.email,
                        onChanged: (val) {
                          ctrl.profile.email = val;
                        },
                        validator: (val) {
                          return FormValidation.emailValidator(val: val ?? "");
                        },
                        maxLines: 1,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(-12),
                            border: InputBorder.none,
                            hintText: "Email",
                            hintStyle: MyText.body1(context)!
                                .copyWith(color: MyColors.grey_40)),
                      ),
                    ),
                    _loadingButon(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loadingButon(BuildContext context) => Obx(() {
        if (ctrl.saveLoading.value) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: CustomCircularProgress(),
          );
        } else {
          return Material(
            color: Get.theme.primaryColor,
            child: InkWell(
                highlightColor: Colors.black.withOpacity(0.2),
                splashColor: Colors.black.withOpacity(0.2),
                onTap: () {
                  ctrl.updateProfile();
                },
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Text("Güncelle",
                      style:
                          MyText.body2(context)!.copyWith(color: Colors.white)),
                )),
          );
        }
      });
}
