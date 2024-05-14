import 'package:flutter/material.dart';
import 'package:mafqud/core/utils/app_styles.dart';

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: const Align(
        alignment: Alignment.bottomRight,
        child: Text(
          "Already have an account ?",
          style: CustomTextStyle.poppins400style15,
        ),
      ),
    );
  }
}
