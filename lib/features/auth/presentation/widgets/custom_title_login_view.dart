import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';

class CustomTitleLoginView extends StatelessWidget {
  const CustomTitleLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Mafqud",
          style: CustomTextStyle.pacificoSplash.copyWith(
            fontFamily: 'Pacifico',
          ),
        ),
      ],
    );
  }
}
