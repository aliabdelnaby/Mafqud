import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqud/core/function/navigation.dart';
import 'package:mafqud/features/auth/cubit/auth_cubit.dart';
import 'package:mafqud/features/auth/cubit/auth_state.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_btn.dart';
import 'custom_text_field.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          if (FirebaseAuth.instance.currentUser!.emailVerified) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Welcome Back!"),
                backgroundColor: AppColors.primary,
              ),
            );
            customReplacementNavigate(context, "/homeView");
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Please Verify Your Account"),
                backgroundColor: Colors.red,
              ),
            );
          }
        } else if (state is LoginFailureState) {
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
          key: authCubit.loginForm,
          child: Column(
            children: [
              CustomTextFormField(
                hintText: "Email",
                onChanged: (email) {
                  authCubit.email = email;
                },
                keyboardType: TextInputType.emailAddress,
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              state is LoginLoadingState
                  ? const CircularProgressIndicator(color: AppColors.primary)
                  : CustomBtn(
                      onPressed: () async {
                        if (authCubit.loginForm.currentState!.validate()) {
                          await authCubit.loginWithEmailAndPassword();
                        }
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            ],
          ),
        );
      },
    );
  }
}
