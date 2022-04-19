import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomRadioComponent extends StatefulWidget {
  int selectedValue = 0;
  Function onChange;
  CustomRadioComponent({
    Key? key,
    required this.onChange,
    this.selectedValue = 0,
  }) : super(key: key);

  @override
  State<CustomRadioComponent> createState() => _CustomRadioComponentState();
}

class _CustomRadioComponentState extends State<CustomRadioComponent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.onChange(widget.selectedValue);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                widget.selectedValue = 0;
                widget.onChange(widget.selectedValue);
              });
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: _buildGetitSeleced(),
              child: const Center(
                child: Text(
                  "Gel Al",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                widget.selectedValue = 1;
                widget.onChange(widget.selectedValue);
              });
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: _buildDeliverySelect(),
              child: Center(child: Text("Adrese Teslim")),
            ),
          ),
        ),
      ],
    );
  }

  BoxDecoration _buildDeliverySelect() {
    if (widget.selectedValue == 1) {
      return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Get.theme.accentColor,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 243, 194, 33).withOpacity(0.6),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      );
    } else {
      return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Get.theme.accentColor,
      );
    }
  }

  BoxDecoration _buildGetitSeleced() {
    if (widget.selectedValue == 0) {
      return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Get.theme.primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.6),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      );
    } else {
      return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Get.theme.primaryColor,
      );
    }
  }
}
