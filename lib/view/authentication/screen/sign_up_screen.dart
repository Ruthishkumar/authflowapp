import 'dart:developer';

import 'package:auth_flow_app/utils/app_button.dart';
import 'package:auth_flow_app/utils/app_images.dart';
import 'package:auth_flow_app/utils/app_mixins.dart';
import 'package:auth_flow_app/utils/app_outline_form_field.dart';
import 'package:auth_flow_app/utils/app_routes.dart';
import 'package:auth_flow_app/utils/app_styles.dart';
import 'package:auth_flow_app/utils/screen_container.dart';
import 'package:auth_flow_app/utils/string_validation.dart';
import 'package:auth_flow_app/utils/toast_services.dart';
import 'package:auth_flow_app/view/authentication/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with AppMixins {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
        appBar: appBar(context),
        bodyWidget: Container(
          padding: EdgeInsets.fromLTRB(20.r, 0.r, 20.r, 0.r),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppImages.registerImage,
                Text('Create Account',
                    style: AppStyles.instance.welcomeTextStyles(
                        fontSize: 24.sp, fontWeight: FontWeight.w700)),
                SizedBox(height: 6.h),
                Text('Sign up to get started',
                    style: AppStyles.instance.loginTextStyle(
                        fontWeight: FontWeight.w500, fontSize: 15.sp)),
                SizedBox(height: 50.h),
                AppOutlineFormField(
                  hintText: 'Full Name',
                  controller: nameController,
                  textInputAction: TextInputAction.next,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(20),
                  ],
                ),
                SizedBox(height: 15.h),
                AppOutlineFormField(
                  hintText: 'Email',
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 15.h),
                AppOutlineFormField(
                  hintText: 'Password',
                  controller: passwordController,
                  textInputAction: TextInputAction.next,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(20),
                  ],
                  isPassword: true,
                ),
                SizedBox(height: 15.h),
                AppOutlineFormField(
                  hintText: 'Confirm Password',
                  controller: confirmPasswordController,
                  textInputAction: TextInputAction.done,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(20),
                  ],
                  isPassword: true,
                ),
                SizedBox(height: 20.h),
                AppButton(
                    label: 'Register',
                    onTap: summitButton,
                    type: AppButtonType.primary),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",
                        style: AppStyles.instance.greyTextStyles(
                            fontSize: 14.sp, fontWeight: FontWeight.w400)),
                    SizedBox(width: 10.w),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        AppRoutes()
                            .animationRoutes(context, const LoginScreen());
                      },
                      child: Text('Login',
                          style: AppStyles.instance.greenTextStyles(
                              fontSize: 16.sp, fontWeight: FontWeight.w700)),
                    )
                  ],
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ));
  }

  /// validate form fields
  validate() {
    if (nameController.text == '') {
      ToastServices().showError('Please Enter Full Name', context);
      return false;
    } else if (emailController.text == '') {
      ToastServices().showError('Please Enter Email', context);
      return false;
    } else if (!emailController.text.isValidEmail) {
      ToastServices().showError('Please Enter Valid Email', context);
      return false;
    } else if (passwordController.text == '') {
      ToastServices().showError('Please Enter Password', context);
      return false;
    } else if (!passwordController.text.isValidPassword) {
      ToastServices().showError('Please Provide Strong Password', context);
      return false;
    } else if (confirmPasswordController.text == '') {
      ToastServices().showError('Please Enter Confirm Password', context);
      return false;
    } else if (passwordController.text != confirmPasswordController.text) {
      ToastServices()
          .showError('Password and Confirm Password must be same', context);
      return false;
    } else {
      return true;
    }
  }

  /// summit button action
  summitButton() {
    if (validate()) {
      log('Success');
      ToastServices().showSuccess('Signup verified Successfully!', context);
    }
  }
}
