import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_btn.dart';
import 'custom_text_field.dart';

class CustomResetPasswordForm extends StatefulWidget {
  const CustomResetPasswordForm({super.key});

  @override
  State<CustomResetPasswordForm> createState() =>
      _CustomResetPasswordFormState();
}

class _CustomResetPasswordFormState extends State<CustomResetPasswordForm> {
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
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          CustomBtn(
            backgroundColor: AppColors.primary,
            onPressed: () async {
              if (_formKey.currentState!.validate()) {}
            },
            text: "Send link to reset password",
            height: MediaQuery.of(context).size.height * 0.05,
            width: double.infinity,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ],
      ),
    );
  }
}
