import 'package:caffe_store_app/core/component_models/select_component_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HorizontalSelectComponent extends StatefulWidget {
  int initVal = 0;
  Function onChange;
  List<SelectComponentModel> items = [];

  HorizontalSelectComponent({
    Key? key,
    required this.initVal,
    required this.onChange,
    required this.items,
  }) : super(key: key);

  @override
  State<HorizontalSelectComponent> createState() =>
      _HorizontalSelectComponentState();
}

class _HorizontalSelectComponentState extends State<HorizontalSelectComponent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.onChange(widget.initVal);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.items.length,
      itemBuilder: (context, i) {
        var status = widget.items[i];
        return InkWell(
          onTap: () {
            setState(() {
              widget.initVal = status.id ?? -1;
              widget.onChange(widget.initVal);
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              decoration: _getDecoration(status.id ?? 0),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(status.text ?? "",
                    style: _getTextStayle(status.id ?? 0)),
              )),
            ),
          ),
        );
      },
    );
  }

  TextStyle _getTextStayle(int id) {
    if (widget.initVal == id) {
      return TextStyle(fontSize: 16, color: Colors.white);
    } else {
      return TextStyle(fontSize: 16, color: Get.theme.primaryColor);
    }
  }

  BoxDecoration _getDecoration(int id) {
    if (widget.initVal == id) {
      return BoxDecoration(
        border: Border.all(color: Get.theme.primaryColor),
        color: Get.theme.primaryColor.withOpacity(0.8),
      );
    } else {
      return BoxDecoration(border: Border.all(color: Get.theme.primaryColor));
    }
  }
}
