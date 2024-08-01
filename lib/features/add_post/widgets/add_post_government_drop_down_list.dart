import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:mafqud/core/utils/app_colors.dart';
import 'package:mafqud/core/utils/app_styles.dart';

class CustomAddPostDropDownList extends StatefulWidget {
  const CustomAddPostDropDownList({super.key});

  @override
  State<CustomAddPostDropDownList> createState() =>
      _CustomAddPostDropDownListState();
}

class _CustomAddPostDropDownListState extends State<CustomAddPostDropDownList> {
  final List<String> governorates = [
    'Cairo',
    'Giza',
    'Alexandria',
    'Aswan',
    'Asyut',
    'Beheira',
    'Beni Suef',
    'Dakahlia',
    'Damietta',
    'Faiyum',
    'Gharbia',
    'Ismailia',
    'Kafr El Sheikh',
    'Luxor',
    'Matruh',
    'Minya',
    'Monufia',
    'New Valley (El Wadi El Gedid)',
    'North Sinai',
    'Port Said',
    'Qalyubia',
    'Qena',
    'Red Sea',
    'Sharqia',
    'Sohag',
    'South Sinai',
    'Suez'
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: DropdownButtonFormField2<String>(
        decoration: const InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primary,
            ),
          ),
        ),
        hint: const Text(
          'Select a governorate',
          style: CustomTextStyle.poppins300style16,
        ),
        items: governorates
            .map(
              (item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: CustomTextStyle.poppins300style16,
                ),
              ),
            )
            .toList(),
        validator: (value) {
          if (value == null) {
            return "This field is required";
          }
          return null;
        },
        onChanged: (value) {},
        onSaved: (value) {
          selectedValue = value.toString();
        },
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.keyboard_arrow_down_outlined,
            color: AppColors.primary,
          ),
          iconSize: 24,
        ),
        dropdownStyleData: DropdownStyleData(
          width: MediaQuery.of(context).size.width * 0.5,
          maxHeight: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}
