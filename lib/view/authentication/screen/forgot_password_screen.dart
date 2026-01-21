import 'package:auth_flow_app/utils/app_button.dart';
import 'package:auth_flow_app/utils/app_images.dart';
import 'package:auth_flow_app/utils/app_mixins.dart';
import 'package:auth_flow_app/utils/app_outline_form_field.dart';
import 'package:auth_flow_app/utils/app_styles.dart';
import 'package:auth_flow_app/utils/screen_container.dart';
import 'package:auth_flow_app/utils/string_validation.dart';
import 'package:auth_flow_app/utils/toast_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>
    with AppMixins {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
        appBar: appBar(context),
        bodyWidget: Container(
          padding: EdgeInsets.fromLTRB(20.r, 0.r, 20.r, 0.r),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppImages.forgotPasswordImage,
                Text('Forgot Password',
                    style: AppStyles.instance.welcomeTextStyles(
                        fontSize: 24.sp, fontWeight: FontWeight.w700)),
                SizedBox(height: 6.h),
                Text('Enter your email to reset your password',
                    style: AppStyles.instance.loginTextStyle(
                        fontWeight: FontWeight.w500, fontSize: 15.sp)),
                SizedBox(height: 80.h),
                AppOutlineFormField(
                  hintText: 'Email',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: 25.h),
                AppButton(
                    label: 'Reset Password',
                    onTap: summitButton,
                    type: AppButtonType.primary),
                SizedBox(height: 20.h),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('Remembered? Login',
                      style: AppStyles.instance.greenTextStylesWithUnderLine(
                          fontSize: 16.sp, fontWeight: FontWeight.w700)),
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
    } else {
      return true;
    }
  }

  /// summit button action
  summitButton() {
    if (validate()) {
      ToastServices().showSuccess(
          'Password reset link has been sent to your email', context);
    }
  }
}
