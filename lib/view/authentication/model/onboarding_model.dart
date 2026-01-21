import 'package:auth_flow_app/utils/app_images.dart';
import 'package:flutter/material.dart';

class OnboardingModel {
  final Image image;
  final String title;
  final String description;

  OnboardingModel(
    this.image,
    this.title,
    this.description,
  );
}

List<OnboardingModel> tabs = [
  OnboardingModel(
    AppImages.onboardingImageOne,
    'Relax',
    'Start your journey to better mental well-being and a more peaceful life',
  ),
  OnboardingModel(
    AppImages.onboardingImageTwo,
    'Workout',
    'Improve your health and create positive habits that help you feel your best every day',
  ),
  OnboardingModel(
    AppImages.onboardingImageThree,
    'Travel ',
    'Discover beautiful destinations, immerse yourself in different cultures, and create unforgettable memories',
  ),
  OnboardingModel(
    AppImages.onboardingImageFour,
    'Welcome',
    'Stay organized and live stress-free with you-do app',
  ),
];
