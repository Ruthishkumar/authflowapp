import 'package:auth_flow_app/utils/app_button.dart';
import 'package:auth_flow_app/utils/app_images.dart';
import 'package:auth_flow_app/utils/app_outline_form_field.dart';
import 'package:auth_flow_app/utils/app_routes.dart';
import 'package:auth_flow_app/utils/app_styles.dart';
import 'package:auth_flow_app/utils/screen_container.dart';
import 'package:auth_flow_app/utils/string_validation.dart';
import 'package:auth_flow_app/utils/toast_services.dart';
import 'package:auth_flow_app/view/authentication/screen/forgot_password_screen.dart';
import 'package:auth_flow_app/view/authentication/screen/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
        bodyWidget: Container(
      padding: EdgeInsets.fromLTRB(20.r, 40.r, 20.r, 0.r),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppImages.loginImage,
            SizedBox(height: 8.h),
            Text('Welcome Back!',
                style: AppStyles.instance.welcomeTextStyles(
                    fontSize: 27.sp, fontWeight: FontWeight.w700)),
            SizedBox(height: 6.h),
            Text('Login to your account',
                style: AppStyles.instance.loginTextStyle(
                    fontWeight: FontWeight.w500, fontSize: 16.sp)),
            SizedBox(height: 30.h),
            AppOutlineFormField(
              hintText: 'Email',
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: 15.h),
            AppOutlineFormField(
              hintText: 'Password',
              controller: passwordController,
              textInputAction: TextInputAction.done,
              inputFormatters: [
                LengthLimitingTextInputFormatter(20),
              ],
              isPassword: true,
            ),
            SizedBox(height: 25.h),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                AppRoutes()
                    .animationRoutes(context, const ForgotPasswordScreen());
              },
              child: Text('Forgot Password',
                  style: AppStyles.instance.welcomeTextStyles(
                      fontSize: 16.sp, fontWeight: FontWeight.w700)),
            ),
            SizedBox(height: 20.h),
            AppButton(
              label: 'Login',
              onTap: summitButton,
              type: AppButtonType.primary,
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have account?",
                    style: AppStyles.instance.greyTextStyles(
                        fontSize: 14.sp, fontWeight: FontWeight.w400)),
                SizedBox(width: 10.w),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    AppRoutes().animationRoutes(context, const SignUpScreen());
                  },
                  child: Text('Sign Up',
                      style: AppStyles.instance.greenTextStyles(
                          fontSize: 16.sp, fontWeight: FontWeight.w700)),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }

  /// validate form fields
  validate() {
    if (emailController.text == '') {
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
    } else {
      return true;
    }
  }

  /// summit button action
  summitButton() {
    if (validate()) {
      ToastServices().showSuccess('Login Verified Successfully!', context);
    }
  }
}
