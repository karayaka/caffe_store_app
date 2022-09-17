import 'package:caffe_store_app/core/components/cached_network_image_component.dart';
import 'package:caffe_store_app/datas/models/product_models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCardComponent extends StatelessWidget {
  ProductCardComponent({Key? key, required this.item, required this.onClick})
      : super(key: key);

  void Function()? onClick;
  final ProductModel item;

  @override
  Widget build(BuildContext context) {
    var size = Get.size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            width: (size.width - 24),
            height: 120,
            child: CachedNetworkImageComponent(url: item.image ?? "")),
        Expanded(
          flex: 1,
          child: FittedBox(
            child: Text(
              item.name ?? "",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(height: 1),
        Expanded(
          flex: 3,
          child: Text(
            _buildText(item.desc),
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ),
        Row(
          children: [
            ElevatedButton(
              style: OutlinedButton.styleFrom(primary: const Color(0xffe1be36)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("${item.price} ₺"),
                    const VerticalDivider(
                      thickness: 3,
                      width: 5,
                      color: Color(0xffe1be36),
                    ),
                    const Icon(Icons.add_outlined)
                  ]),
              onPressed: onClick,
            ),
          ],
        ),
      ],
    );
  }

  String _buildText(String? text) {
    if (text == null)
      return "";
    else if (text.length > 80) {
      var txt = text.substring(0, 80);
      return "$txt...";
    } else
      return text;
  }
}
