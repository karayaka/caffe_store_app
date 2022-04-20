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
                  item?.text ?? "",
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
            ),
      child: ListTile(
        title: Text(
          item.text ?? "",
        ),
      ),
    );
  }

  SelectComponentModel? getSelectedValue() {
    if (selectedId == null) {
      return null;
    } else if (items.any((element) => element.id == selectedId)) {
      return items.firstWhere((e) => e.id == selectedId);
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<SelectComponentModel>(
      selectedItem: getSelectedValue(),
      mode: Mode.DIALOG,
      popupBackgroundColor: Colors.white,
      searchFieldProps: TextFieldProps(
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: const InputDecoration(
              hintText: "   Ara",
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 0.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 0.5),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 0.5),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 0.5),
              ))),
      dropdownSearchDecoration: const InputDecoration(border: InputBorder.none),
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
