import 'package:flutter/material.dart';
import 'package:mafqud/core/utils/app_colors.dart';
import 'package:mafqud/core/widgets/custom_btn.dart';
import 'package:mafqud/features/auth/presentation/widgets/custom_text_field.dart';

class CustomSignUpForm extends StatefulWidget {
  const CustomSignUpForm({super.key});

  @override
  State<CustomSignUpForm> createState() => _CustomSignUpFormState();
}

class _CustomSignUpFormState extends State<CustomSignUpForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: "Name",
            onChanged: (name) {},
          ),
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
          CustomTextFormField(
            hintText: "Mobile Phone",
            onChanged: (mobilePhone) {},
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          CustomBtn(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {}
            },
            backgroundColor: AppColors.primary,
            text: "Sign Up",
            height: MediaQuery.of(context).size.height * 0.05,
            width: double.infinity,
            color: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
