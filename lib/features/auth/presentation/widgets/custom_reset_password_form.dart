import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqud/core/function/navigation.dart';
import 'package:mafqud/features/auth/cubit/auth_cubit.dart';
import 'package:mafqud/features/auth/cubit/auth_state.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_btn.dart';
import 'custom_text_field.dart';

class CustomResetPasswordForm extends StatelessWidget {
  const CustomResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:
                  Text("A password reset link has been sent to your email"),
              backgroundColor: AppColors.primary,
            ),
          );
          customReplacementNavigate(context, '/loginView');
        } else if (state is ResetPasswordFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        final authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.resetPasswordForm,
          child: Column(
            children: [
              CustomTextFormField(
                hintText: "Email",
                onChanged: (email) {
                  authCubit.email = email;
                },
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              state is ResetPasswordLoadingState
                  ? const CircularProgressIndicator(
                      color: AppColors.primary,
                    )
                  : CustomBtn(
                      backgroundColor: AppColors.primary,
                      onPressed: () async {
                        if (authCubit.resetPasswordForm.currentState!
                            .validate()) {
                          await authCubit.sendPasswordResetEmail();
                        }
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
      },
    );
  }
}
