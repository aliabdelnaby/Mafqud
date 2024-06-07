import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:mafqud/core/function/navigation.dart';
import 'package:mafqud/core/utils/app_colors.dart';
import 'package:mafqud/core/utils/app_styles.dart';
import 'package:mafqud/core/widgets/custom_btn.dart';
import 'package:mafqud/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class AddPostView extends StatefulWidget {
  const AddPostView({super.key});

  @override
  State<AddPostView> createState() => _AddPostViewState();
}

class _AddPostViewState extends State<AddPostView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<CustomImagePickerWidgetState> imagePickerKey =
      GlobalKey<CustomImagePickerWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post'),
        leading: IconButton(
          onPressed: () {
            customPop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.primary,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              CustomImagePickerWidget(key: imagePickerKey),
              const CustomTextFormField(
                hintText: "Name",
              ),
              const CustomTextFormField(
                hintText: "Age (Years)",
                keyboardType: TextInputType.number,
              ),
              const CustomAddPostDropDownList(),
              const CustomTextFormField(
                hintText: "Contact number",
                keyboardType: TextInputType.number,
              ),
              const CustomTextFormField(
                hintText: "Last seen (Time and place)",
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              CustomBtn(
                onPressed: () async {
                  if (formKey.currentState!.validate() &&
                      imagePickerKey.currentState!.validate()) {
                    //! Logic
                  }
                },
                text: "Add Post",
                height: MediaQuery.of(context).size.height * 0.05,
                width: double.infinity,
                backgroundColor: AppColors.primary,
              )
            ],
          ),
        ),
      ),
    );
  }
}

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

class CustomImagePickerWidget extends StatefulWidget {
  const CustomImagePickerWidget({super.key});

  @override
  CustomImagePickerWidgetState createState() => CustomImagePickerWidgetState();
}

class CustomImagePickerWidgetState extends State<CustomImagePickerWidget> {
  File? file;
  final picker = ImagePicker();
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: pickImage,
          child: CircleAvatar(
            backgroundImage: file == null ? null : FileImage(file!),
            backgroundColor: AppColors.primary,
            radius: 80,
            child: file == null
                ? const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 50,
                  )
                : const SizedBox(),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        TextButton(
          onPressed: pickImage,
          child: const Align(
            child: Text(
              "Add Photo",
              style: CustomTextStyle.poppins300style16,
            ),
          ),
        ),
        if (_errorMessage != null)
          Text(
            _errorMessage!,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 12,
            ),
          ),
      ],
    );
  }

  void pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        file = File(image.path);
        _errorMessage = null; //* Clear the error message if a photo is selected
      });
    }
  }

  bool validate() {
    if (file == null) {
      setState(() {
        _errorMessage = 'Please add a photo.';
      });
      return false;
    }
    return true;
  }
}
