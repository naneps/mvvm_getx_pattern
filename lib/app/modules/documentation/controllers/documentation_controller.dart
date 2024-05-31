import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocumentationController extends GetxController {
  //TODO: Implement DocumentationController
  List<Map<String, TextStyle>> textStyles = [
    {'Title L': Get.textTheme.titleLarge!},
    {'Title M': Get.textTheme.titleMedium!},
    {'Title S': Get.textTheme.titleSmall!},
    {'Headline L': Get.textTheme.headlineLarge!},
    {'Headline M': Get.textTheme.headlineMedium!},
    {'Headline S': Get.textTheme.headlineSmall!},
    {'Body L': Get.textTheme.bodyLarge!},
    {'Body M': Get.textTheme.bodyMedium!},
    {'Body S': Get.textTheme.bodySmall!},
    {'Label L': Get.textTheme.labelLarge!},
    {'Label M': Get.textTheme.labelMedium!},
    {'Label S': Get.textTheme.labelSmall!},
    {'Display L': Get.textTheme.displayLarge!},
    {'Display M': Get.textTheme.displayMedium!},
    {'Display S': Get.textTheme.displaySmall!},
  ];

  final formKey = GlobalKey<FormState>();
}
