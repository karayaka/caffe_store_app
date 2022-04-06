import 'package:caffe_store_app/core/components/cached_network_image_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddBasketPage extends StatelessWidget {
  const AddBasketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: 200,
            title: Text("Ürün Adı Yazabilir"),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Get.back(canPop: false);
              },
            ),
            actions: [
              IconButton(icon: Icon(Icons.check), onPressed: () {}),
              const SizedBox(
                width: 6,
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImageComponent(url: ""),
            ),
          ),
          _buildContent()
        ],
      ),
    );
  }

  _buildContent() {
    return SliverToBoxAdapter(
      child: Column(children: [
        Expanded(child: _buildList()),
        Container(
          child: Row(children: [
            //button ve alt toplam yazılacak
          ]),
        )
      ]),
    );
  }

  ListView _buildList() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (_, i) {
        return ListTile(
          title: Text("${i}"),
        );
      },
    );
  }
}
