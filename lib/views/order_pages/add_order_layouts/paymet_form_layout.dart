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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(height: 5),
          Container(
            height: 240,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.amber[900],
                elevation: 2,
                margin: EdgeInsets.all(0),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image.asset('assets/images/world_map.png',
                        fit: BoxFit.cover),
                    Container(
                      margin: EdgeInsets.all(20),
                      alignment: Alignment.bottomRight,
                      child: Image.asset("assets/images/ic_copper_card.png",
                          width: 60, height: 60),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Spacer(),
                              Image.asset("assets/images/ic_visa.png",
                                  color: Colors.white,
                                  fit: BoxFit.cover,
                                  width: 60,
                                  height: 30),
                            ],
                          ),
                          Container(height: 10),
                          Text("card no",
                              style: MyText.headline(context)!.copyWith(
                                  color: Colors.white,
                                  fontFamily: "monospace")),
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
                                  Text("Expare",
                                      style: MyText.subhead(context)!.copyWith(
                                          color: Colors.white,
                                          fontFamily: "monospace")),
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
                                  Text("CVV",
                                      style: MyText.subhead(context)!.copyWith(
                                          color: Colors.white,
                                          fontFamily: "monospace")),
                                ],
                              ),
                              Container(width: 40)
                            ],
                          ),
                          Container(height: 25),
                          Text("Card NAme",
                              style: MyText.subhead(context)!.copyWith(
                                  color: Colors.white,
                                  fontFamily: "monospace")),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                  maxLines: 1,
                  maxLength: 19,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Kart Numarası", counterText: ''),
                  onChanged: (val) {},
                ),
                Container(height: 15),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: TextField(
                        maxLines: 1,
                        maxLength: 5,
                        keyboardType: TextInputType.text,
                        decoration:
                            InputDecoration(hintText: "MM/YY", counterText: ''),
                        onChanged: (val) {
                          //tarih
                        },
                      ),
                      flex: 1,
                    ),
                    Container(width: 15),
                    Flexible(
                      child: TextField(
                        maxLines: 1,
                        maxLength: 3,
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(hintText: "CVV", counterText: ''),
                        onChanged: (val) {
                          //CVV
                        },
                      ),
                      flex: 1,
                    )
                  ],
                ),
                Container(height: 15),
                TextField(
                  maxLines: 1,
                  maxLength: 50,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Name on card", counterText: ''),
                  onChanged: (val) {
                    //Name
                  },
                ),
                Container(height: 25),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.amber[900], elevation: 0),
                    child: Text(
                      "CONTINUE",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
