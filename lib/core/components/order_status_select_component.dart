import 'package:caffe_store_app/app_tools/tools.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderStatusSelectComponent extends StatefulWidget {
  int initVal = -1;
  Function onChange;
  OrderStatusSelectComponent({
    Key? key,
    this.initVal = -1,
    required this.onChange,
  }) : super(key: key);

  @override
  State<OrderStatusSelectComponent> createState() =>
      _OrderStatusSelectComponentState();
}

class _OrderStatusSelectComponentState
    extends State<OrderStatusSelectComponent> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: Tools.orderStatuses.length,
      itemBuilder: (context, i) {
        var status = Tools.orderStatuses[i];
        return InkWell(
          onTap: () {
            setState(() {
              widget.initVal = status.id ?? -1;
              widget.onChange(widget.initVal);
            });
          },
          child: Card(
            color: (status.id != widget.initVal)
                ? Colors.white
                : Get.theme.accentColor,
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(status.text ?? "",
                  style:
                      TextStyle(fontSize: 16, color: Get.theme.primaryColor)),
            )),
          ),
        );
      },
    );
  }
}
