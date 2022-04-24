import 'package:caffe_store_app/core/component_models/address_select_result_model.dart';
import 'package:caffe_store_app/core/component_models/select_component_model.dart';
import 'package:caffe_store_app/core/components/custom_circular_progress.dart';
import 'package:caffe_store_app/core/components/custom_select_component.dart';
import 'package:flutter/material.dart';

class AdressSelectComponent extends StatefulWidget {
  List<SelectComponentModel> province;
  Future<List<SelectComponentModel>> Function(int providenceId)? getDistrict;
  Future<List<SelectComponentModel>> Function(int districtId)? getNeighborhood;
  List<SelectComponentModel> districtes = [];
  List<SelectComponentModel> neighborhoodes = [];
  Function? onChange;
  //0 görünme 1 loading 2 loaded 3 hata
  int showDistrict = 0;
  int showNeighborhood = 0;
  var result = AddressSelectResultModel();
  AdressSelectComponent({
    Key? key,
    required this.province,
    required this.getDistrict,
    required this.getNeighborhood,
    required this.onChange,
  }) : super(key: key);

  @override
  State<AdressSelectComponent> createState() => _AdressSelectComponentState();
}

class _AdressSelectComponentState extends State<AdressSelectComponent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.onChange!(widget.result);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSelectComponent(
          dropdownLabel: "İl Seçin",
          items: widget.province,
          onChange: (val) async {
            setState(() {
              widget.showDistrict = 1;
            });
            widget.result.provinceID = val.id;
            widget.districtes = await widget.getDistrict!(val.id);
            setState(() {
              widget.showDistrict = 2;
            });
            widget.onChange!(widget.result);
          },
          selectedId: widget.result.provinceID,
        ),
        _buildDistrict(),
        _buildNeighborhood(), //bu bölüm test edilecek!
      ],
    );
  }

  Widget _buildDistrict() {
    if (widget.showDistrict == 0) {
      return Container();
    } else if (widget.showDistrict == 1) {
      return CustomCircularProgress();
    } else {
      return CustomSelectComponent(
        items: widget.districtes,
        dropdownLabel: "İlçe Seçin",
        onChange: (val) async {
          if (val != null) {
            setState(() {
              widget.showNeighborhood = 1;
            });
            widget.result.districtID = val.id;
            widget.neighborhoodes = await widget.getNeighborhood!(val.id);
            setState(() {
              widget.showNeighborhood = 2;
            });
            widget.onChange!(widget.result);
          }
        },
        selectedId: widget.result.districtID,
      );
    }
  }

  Widget _buildNeighborhood() {
    print(widget.showDistrict);
    if (widget.showNeighborhood == 0) {
      return Container();
    } else if (widget.showNeighborhood == 1) {
      return CustomCircularProgress();
    } else {
      return CustomSelectComponent(
          items: widget.neighborhoodes,
          dropdownLabel: "Mahalle Seçin",
          onChange: (val) {
            widget.result.neighborhoodID = val.id;
            widget.onChange!(widget.result);
          },
          selectedId: widget.result.neighborhoodID);
    }
  }
}
