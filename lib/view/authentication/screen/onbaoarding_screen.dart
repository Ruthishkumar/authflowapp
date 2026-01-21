import 'package:auth_flow_app/utils/app_button.dart';
import 'package:auth_flow_app/utils/app_colors.dart';
import 'package:auth_flow_app/utils/app_routes.dart';
import 'package:auth_flow_app/utils/app_styles.dart';
import 'package:auth_flow_app/utils/screen_container.dart';
import 'package:auth_flow_app/view/authentication/model/onboarding_model.dart';
import 'package:auth_flow_app/view/authentication/screen/login_screen.dart';
import 'package:auth_flow_app/view/authentication/widget/onboarding_bottom_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
        bodyWidget: Container(
      padding: EdgeInsets.fromLTRB(40.r, 40.r, 40.r, 20.r),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            skipHeaderWidget(),
            SizedBox(height: 20.h),
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: 550.sp,
                child: Column(
                  children: [
                    Flexible(
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: tabs.length,
                        itemBuilder: (BuildContext context, int index) {
                          OnboardingModel tab = tabs[index];
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              tabs[_currentIndex].image,
                              Text(
                                tab.title,
                                style: AppStyles.instance.welcomeTextStyles(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                tab.description,
                                textAlign: TextAlign.center,
                                style: AppStyles.instance.loginTextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp),
                              ),
                            ],
                          );
                        },
                        onPageChanged: (value) {
                          _currentIndex = value;
                          setState(() {});
                        },
                      ),
                    ),
                    _currentIndex == 3
                        ? Container()
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              for (int index = 0; index < tabs.length; index++)
                                BottomIndicator(
                                    isSelected: index == _currentIndex),
                            ],
                          ),
                    SizedBox(height: 100.sp)
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (_currentIndex == 0) {
                  _pageController.animateTo(MediaQuery.of(context).size.width,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                } else if (_currentIndex == 1) {
                  _pageController.animateTo(
                      MediaQuery.of(context).size.width * 2,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                } else if (_currentIndex == 2) {
                  _pageController.animateTo(
                      MediaQuery.of(context).size.width * 3,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                }
              },
              child: _currentIndex == 3
                  ? AppButton(
                      label: 'Login',
                      onTap: () {
                        AppRoutes()
                            .animationRoutes(context, const LoginScreen());
                      },
                      type: AppButtonType.secondary)
                  : Container(
                      padding: const EdgeInsets.all(14.0),
                      decoration: const BoxDecoration(
                          color: AppColors.secondaryButtonColor,
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.08),
                                blurRadius: 20,
                                offset: Offset(3.5, 3.5),
                                spreadRadius: 20)
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: const Icon(
                        CupertinoIcons.chevron_right,
                        color: Colors.white,
                      ),
                    ),
            ),
          ],
        ),
      ),
    ));
  }

  /// skip header widget
  skipHeaderWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            AppRoutes().animationRoutes(context, const LoginScreen());
          },
          child: Text('Skip',
              style: AppStyles.instance.greyTextStyles(
                  fontSize: 16.sp, fontWeight: FontWeight.w500)),
        ),
      ],
    );
  }
}
