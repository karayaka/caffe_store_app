import 'package:cached_network_image/cached_network_image.dart';
import 'package:caffe_store_app/app_tools/tools.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageComponent extends StatelessWidget {
  String url = "";
  BoxFit? fit = BoxFit.fitWidth;
  CachedNetworkImageComponent({Key? key, required this.url, this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (url == "") {
      return Icon(Icons.error);
    } else {
      return CachedNetworkImage(
        fit: fit,
        imageUrl: "${Tools.baseUrl}/assets/productImage/${url}",
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      );
    }
  }
}
