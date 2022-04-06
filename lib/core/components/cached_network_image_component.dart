import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageComponent extends StatelessWidget {
  String url = "BaeUrl";
  BoxFit? fit = BoxFit.cover;
  CachedNetworkImageComponent({Key? key, required this.url, this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
      imageUrl:
          "https://images.pexels.com/photos/3824139/pexels-photo-3824139.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
