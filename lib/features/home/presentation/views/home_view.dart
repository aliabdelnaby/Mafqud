import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:mafqud/core/function/navigation.dart';
import 'package:mafqud/core/utils/app_colors.dart';
import 'package:mafqud/core/utils/app_styles.dart';
import 'package:mafqud/features/home/presentation/widgets/custom_card_mafqud_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          customNavigate(context, '/addPostView');
        },
        tooltip: "Add Post",
        backgroundColor: AppColors.primary,
        child: const Icon(
          Icons.add_card_rounded,
          color: AppColors.white,
          size: 30,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 90, bottom: 10, left: 15),
              child: CustomFilterDropDownList(),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const CustomCardMafqudItem();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomFilterDropDownList extends StatefulWidget {
  const CustomFilterDropDownList({super.key});

  @override
  State<CustomFilterDropDownList> createState() =>
      _CustomFilterDropDownListState();
}

class _CustomFilterDropDownListState extends State<CustomFilterDropDownList> {
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
          'Filter by governorate',
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
        // validator: (value) {
        //   if (value == null) {
        //     return "This field is required";
        //   }
        //   return null;
        // },
        onChanged: (value) {},
        onSaved: (value) {
          selectedValue = value.toString();
        },
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.filter_list_sharp,
            color: AppColors.primary,
          ),
          iconSize: 22,
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
