import 'package:flutter/material.dart';
import 'package:mvvm_getx_pattern/app/main_app.dart';
import 'package:mvvm_getx_pattern/app/services/app_translation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppTranslations appTranslations = AppTranslations();
  await appTranslations.load(); // Wait for translations to be loaded
  runApp(
    MainApp(translations: appTranslations),
  );
}
