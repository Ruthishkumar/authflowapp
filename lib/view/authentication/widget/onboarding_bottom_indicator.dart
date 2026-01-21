import 'package:auth_flow_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomIndicator extends StatelessWidget {
  final bool isSelected;

  const BottomIndicator({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 6.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 6.0,
        width: 6.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3.r)),
          color: isSelected
              ? AppColors.secondaryButtonColor
              : AppColors.greyTextColor,
        ),
      ),
    );
  }
}
