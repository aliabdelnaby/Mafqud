import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqud/core/function/navigation.dart';
import 'package:mafqud/features/auth/cubit/auth_cubit.dart';
import 'package:mafqud/features/auth/cubit/auth_state.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_btn.dart';
import 'custom_text_field.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:
                  Text("Successfully, Check your email to verfiy your account"),
              backgroundColor: AppColors.primary,
            ),
          );
          customReplacementNavigate(context, '/loginView');
        } else if (state is SignUpFailureState) {
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
          key: authCubit.signupForm,
          child: Column(
            children: [
              CustomTextFormField(
                hintText: "Name",
                onChanged: (name) {
                  authCubit.name = name;
                },
              ),
              CustomTextFormField(
                hintText: "Email",
                onChanged: (email) {
                  authCubit.email = email;
                },
              ),
              CustomTextFormField(
                hintText: "Password",
                onChanged: (password) {
                  authCubit.password = password;
                },
                suffixIcon: IconButton(
                  color: AppColors.primary,
                  icon: Icon(
                    authCubit.obscurePasswordTextValue == true
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  onPressed: () {
                    authCubit.obscurePasswordText();
                  },
                ),
                obscureText: authCubit.obscurePasswordTextValue,
              ),
              CustomTextFormField(
                hintText: "Mobile Phone",
                onChanged: (mobilePhone) {
                  authCubit.mobilePhone = mobilePhone;
                },
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              state is SignUpLoadingState
                  ? const CircularProgressIndicator(
                      color: AppColors.primary,
                    )
                  : CustomBtn(
                      onPressed: () async {
                        if (authCubit.signupForm.currentState!.validate()) {
                          await authCubit.signUpWithEmailAndPassword();
                        }
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
      },
    );
  }
}
