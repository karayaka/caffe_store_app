import 'package:caffe_store_app/core/components/cached_network_image_component.dart';
import 'package:caffe_store_app/datas/models/product_models/product_model.dart';
import 'package:flutter/material.dart';

class ProductCardComponent extends StatelessWidget {
  ProductCardComponent({Key? key, required this.item, required this.onClick})
      : super(key: key);

  void Function()? onClick;
  final ProductModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      //decoration: BoxDecoration(border: Border.all()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImageComponent(url: ""),
          Text(
            item.name ?? "",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Expanded(
            child: Text(
              item.desc ?? "",
              style: const TextStyle(
                fontSize: 13,
              ),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                style:
                    OutlinedButton.styleFrom(primary: const Color(0xffe1be36)),
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
      ),
    );
  }
}
