import 'package:caffe_store_app/core/component_models/select_component_model.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class CustomSelectComponent extends StatelessWidget {
  List<SelectComponentModel> items;
  Function onChange;
  int selectedId;
  String dropdownLabel;
  CustomSelectComponent({
    Key? key,
    required this.items,
    required this.dropdownLabel,
    required this.onChange,
    required this.selectedId,
  }) : super(key: key);

  Widget _customDropDownExample(
      BuildContext context, SelectComponentModel? item) {
    return Container(
        child: (item?.value == null)
            ? ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  dropdownLabel,
                ),
              )
            : ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  item?.value ?? "",
                ),
              ));
  }

  Widget _customPopupItemBuilderExample(
      BuildContext context, SelectComponentModel item, bool isSelected) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
      child: ListTile(
        title: Text(
          item.value ?? "",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<SelectComponentModel>(
      selectedItem: (selectedId != null)
          ? items.firstWhere((e) => e.id == selectedId)
          : null,
      mode: Mode.BOTTOM_SHEET,
      popupBackgroundColor: Colors.white,

      dropdownSearchDecoration: InputDecoration(
        border: InputBorder.none,
        //labelStyle: textStyle,
      ),
      items: items, //DropDownDataları Getirilcek
      showSearchBox: true,
      autoValidateMode: AutovalidateMode.onUserInteraction,
      //validator:(val)=>FormValidations.requaredDropdown(val),
      hint: dropdownLabel,
      //popupItemDisabled: (Provincial s) => s.ID==2,
      onChanged: (SelectComponentModel? d) {
        if (onChange != null) onChange(d);
      },
      popupTitle: Center(
          child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          dropdownLabel,
          style: TextStyle(color: Colors.black),
        ),
      )),
      dropdownBuilder: _customDropDownExample,
      popupItemBuilder: _customPopupItemBuilderExample,
    );
  }
}
