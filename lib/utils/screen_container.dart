import 'package:auth_flow_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ScreenContainer extends StatelessWidget {
  final Widget bodyWidget;
  final PreferredSizeWidget? appBar;
  const ScreenContainer({super.key, required this.bodyWidget, this.appBar});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appBar,
      backgroundColor: AppColors.primaryColor,
      body: bodyWidget,
    ));
  }
}
