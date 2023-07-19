import 'package:ecommerce_admin/const/constants.dart';
import 'package:ecommerce_admin/screens/addProducts.dart/addEquipmentScreen.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

// String? selectedValue;

// ignore: must_be_immutable
class CustomDropDownListEquipments extends StatefulWidget {
  CustomDropDownListEquipments({
    super.key, required this.selectedValue,
  });
   String? selectedValue;
  List<String> items = [
    "Uk 6",
    "Uk 7",
    "Uk 8",
    "Uk 9",
    "Uk 10",
    "Uk 11",
  ];
  @override
  State<CustomDropDownListEquipments> createState() =>
      _CustomDropDownListEquipmentsState();
}

class _CustomDropDownListEquipmentsState
    extends State<CustomDropDownListEquipments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: Row(
              children: [
                Icon(
                  Icons.list,
                  size: 16,
                  color: darkShades,
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(
                    'Select Item',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: darkShades,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            items: widget.items
                .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: darkShades,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                .toList(),
            value:  widget.selectedValue,
            onChanged: (value) {
              setState(() {
                widget.selectedValue = value;
                AddingEquipmentsScreen.selectedValueNotifier.value = value!;
              });
            },
            buttonStyleData: ButtonStyleData(
              height: 50,
              width: 160,
              padding: const EdgeInsets.only(left: 14, right: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.black26,
                ),
                color: whiteShade,
              ),
              elevation: 2,
            ),
            iconStyleData: IconStyleData(
              icon: const Icon(
                Icons.arrow_forward_ios_outlined,
              ),
              iconSize: 14,
              iconEnabledColor: darkShades,
              iconDisabledColor: Colors.grey,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: greyShade,
              ),
              offset: const Offset(-20, 0),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: MaterialStateProperty.all(6),
                thumbVisibility: MaterialStateProperty.all(true),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
              padding: EdgeInsets.only(left: 14, right: 14),
            ),
          ),
        ),
      ),
    );
  }
}
