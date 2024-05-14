import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_btn.dart';
import 'custom_text_field.dart';

class CustomLoginForm extends StatefulWidget {
  const CustomLoginForm({super.key});

  @override
  State<CustomLoginForm> createState() => _CustomLoginFormState();
}

class _CustomLoginFormState extends State<CustomLoginForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: "Email",
            onChanged: (email) {},
          ),
          CustomTextFormField(
            hintText: "Password",
            onChanged: (password) {},
            suffixIcon: IconButton(
              color: AppColors.primary,
              icon: const Icon(
                Icons.visibility_off_outlined,
              ),
              onPressed: () {},
            ),
          ),
          const SizedBox(height: 40),
          CustomBtn(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {}
            },
            backgroundColor: AppColors.primary,
            text: "Log in",
            height: MediaQuery.of(context).size.height * 0.05,
            width: double.infinity,
            color: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ],
      ),
    );
  }
}
