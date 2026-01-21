import 'package:auth_flow_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

mixin AppMixins {
  PreferredSizeWidget appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      backgroundColor: AppColors.primaryColor,
      scrolledUnderElevation: 0.0,
      toolbarHeight: 60.h,
      leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_rounded,
              color: AppColors.loginTextColor)),
    );
  }
}
