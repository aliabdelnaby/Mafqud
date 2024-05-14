import 'package:flutter/material.dart';
import '../../../../core/function/navigation.dart';
import '../../../../core/utils/app_styles.dart';

class CustomForgotPassWordAndCreateAccountText extends StatelessWidget {
  const CustomForgotPassWordAndCreateAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 26),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              customNavigate(context, '/forgotPasswordView');
            },
            child: const Text(
              "Forgot Password ?",
              style: CustomTextStyle.poppins200style13,
            ),
          ),
          InkWell(
            onTap: () {
              customReplacementNavigate(context, '/signUpView');
            },
            child: const Text(
              "Create an account",
              style: CustomTextStyle.poppins400style15,
            ),
          ),
        ],
      ),
    );
  }
}
