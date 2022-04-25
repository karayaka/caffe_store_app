import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PieceSelectComponent extends StatefulWidget {
  int initCount = 1;
  TextStyle style;
  Function(int) onChange;
  PieceSelectComponent(
      {this.initCount = 1,
      this.style = const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
      required this.onChange,
      Key? key})
      : super(key: key);

  @override
  State<PieceSelectComponent> createState() => _PieceSelectComponentState();
}

class _PieceSelectComponentState extends State<PieceSelectComponent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.onChange(
        widget.initCount); //generate olur olmaz içindeki değeri yazıyor
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 131,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Get.theme.colorScheme.primary),
      child: Row(
        children: [
          IconButton(
              iconSize: 15,
              color: Get.theme.colorScheme.primary,
              onPressed: () {
                if (widget.initCount > 1) {
                  setState(() {
                    widget.initCount--;
                  });
                  widget.onChange(widget.initCount);
                }
              },
              icon: const Icon(
                Icons.remove,
                color: Colors.white,
              )),
          Container(
            height: 33,
            width: 35,
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: Text(
                "${widget.initCount}",
                style: widget.style,
              ),
            ),
          ),
          IconButton(
              iconSize: 15,
              color: Get.theme.colorScheme.primary,
              onPressed: () {
                setState(() {
                  widget.initCount++;
                  widget.onChange(widget.initCount);
                });
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
