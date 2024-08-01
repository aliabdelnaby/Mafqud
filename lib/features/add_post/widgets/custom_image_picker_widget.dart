import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mafqud/core/utils/app_colors.dart';
import 'package:mafqud/core/utils/app_styles.dart';

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
