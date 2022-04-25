import 'package:flutter/material.dart';

class OrderProgressComponent extends StatelessWidget {
  int orderStatus = 0;
  OrderProgressComponent({
    Key? key,
    this.orderStatus = 0,
  }) : super(key: key);
//gelen duruma göre renk ve yazılar ayarlancak
  @override
  Widget build(BuildContext context) {
    if (orderStatus == 0) {
      return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: Colors.grey,
        ),
        child: const Padding(
          padding: EdgeInsets.all(4.0),
          child: Text(
            "Bekliyor",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      );
    } else if (orderStatus == 1) {
      return Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: Colors.orange),
        child: const Padding(
          padding: EdgeInsets.all(4.0),
          child: Text(
            "Hazırlanıyor",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      );
    } else {
      return Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: Colors.green),
        child: const Padding(
          padding: EdgeInsets.all(4.0),
          child: Text(
            "Teslim Edildi",
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
        ),
      );
    }
  }
}
