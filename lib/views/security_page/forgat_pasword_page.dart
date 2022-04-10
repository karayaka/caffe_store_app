import 'package:caffe_store_app/theme_datas/my_colors.dart';
import 'package:caffe_store_app/theme_datas/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgatPasswordPage extends StatelessWidget {
  ForgatPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      scrollDirection: Axis.vertical,
      child: Align(
        alignment: Alignment.topCenter,
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
                Text("Şifre Sıfırla",
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
                      obscureText: true,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(-12),
                          border: InputBorder.none,
                          hintText: "Yeni Şifre",
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
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(-12),
                          border: InputBorder.none,
                          hintText: "Yeni Şifre Tekrar",
                          hintStyle: MyText.body1(context)!
                              .copyWith(color: MyColors.grey_40)),
                    ),
                  ),
                  Material(
                    color: Get.theme.primaryColor,
                    child: InkWell(
                        highlightColor: Colors.black.withOpacity(0.2),
                        splashColor: Colors.black.withOpacity(0.2),
                        onTap: () {},
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Text("Gönder",
                              style: MyText.body2(context)!
                                  .copyWith(color: Colors.white)),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
