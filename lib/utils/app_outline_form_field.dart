import 'package:auth_flow_app/utils/app_colors.dart';
import 'package:auth_flow_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppOutlineFormField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  bool? isPassword;
  List<TextInputFormatter>? inputFormatters;
  TextInputType? keyboardType;
  AppOutlineFormField(
      {super.key,
      this.isPassword,
      required this.hintText,
      required this.controller,
      this.keyboardType,
      this.inputFormatters,
      required this.textInputAction});

  @override
  State<AppOutlineFormField> createState() => _AppOutlineFormFieldState();
}

class _AppOutlineFormFieldState extends State<AppOutlineFormField> {
  bool isPasswordShown = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextFormField(
            obscureText: widget.isPassword == true ? isPasswordShown : false,
            controller: widget.controller,
            textInputAction: widget.textInputAction,
            inputFormatters: widget.inputFormatters,
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
                fillColor: AppColors.whiteTextColor,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(
                        color: AppColors.greyTextColor, width: 1.5)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(
                        color: AppColors.buttonBackgroundColor, width: 1.5)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(
                        color: AppColors.greyTextColor, width: 1.5)),
                contentPadding: EdgeInsets.fromLTRB(20.sp, 14.sp, 0.sp, 14.sp),
                labelStyle: AppStyles.instance.welcomeTextStyles(
                    fontSize: 16.sp, fontWeight: FontWeight.w400),
                hintStyle: AppStyles.instance.greyTextStyles(
                    fontSize: 16.sp, fontWeight: FontWeight.w400),
                hintText: widget.hintText)),
        widget.isPassword == true
            ? Container(
                margin: EdgeInsets.only(right: 12.r),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isPasswordShown = !isPasswordShown;
                    });
                  },
                  child: Icon(
                    isPasswordShown ? Icons.visibility_off : Icons.visibility,
                    size: 20,
                    color: AppColors.greyTextColor,
                  ),
                ))
            : Container(),
      ],
    );
  }
}
