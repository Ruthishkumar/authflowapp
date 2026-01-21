import 'package:auth_flow_app/utils/app_colors.dart';
import 'package:auth_flow_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum AppButtonType { primary, secondary }

class AppButton extends StatelessWidget {
  final String label;
  final GestureTapCallback onTap;
  final AppButtonType type;

  const AppButton(
      {super.key,
      required this.label,
      required this.onTap,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.fromLTRB(20.r, 15.r, 20.r, 15.r),
          decoration: BoxDecoration(
              color: getBackGroundColor(),
              borderRadius: BorderRadius.all(Radius.circular(12.r))),
          child: labelWidget()),
    );
  }

  /// app background color
  Color getBackGroundColor() {
    if (type == AppButtonType.primary) {
      return AppColors.buttonBackgroundColor;
    } else if (type == AppButtonType.secondary) {
      return AppColors.secondaryButtonColor;
    }
    return AppColors.buttonBackgroundColor;
  }

  /// get label widget
  Widget labelWidget() {
    if (type == AppButtonType.primary) {
      return Center(
        child: Text(label,
            style: AppStyles.instance.buttonTextStyles(
                fontSize: 16.sp, fontWeight: FontWeight.w600)),
      );
    } else if (type == AppButtonType.secondary) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppStyles.instance
                .buttonTextStyles(fontSize: 18.sp, fontWeight: FontWeight.w700),
          ),
          const Icon(Icons.arrow_forward, color: AppColors.whiteTextColor)
        ],
      );
    }
    return Center(
      child: Text(
        label,
        style: AppStyles.instance
            .buttonTextStyles(fontSize: 18.sp, fontWeight: FontWeight.w700),
      ),
    );
  }
}
