import 'package:flutter/material.dart';
import 'package:mafqud/core/function/navigation.dart';
import 'package:mafqud/core/utils/app_colors.dart';
import 'package:mafqud/core/widgets/custom_btn.dart';
import 'package:mafqud/features/add_post/widgets/add_post_government_drop_down_list.dart';
import 'package:mafqud/features/add_post/widgets/custom_image_picker_widget.dart';
import 'package:mafqud/features/auth/presentation/widgets/custom_text_field.dart';

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
        surfaceTintColor: Colors.transparent,
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
