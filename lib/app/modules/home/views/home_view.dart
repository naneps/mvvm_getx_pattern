import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/commons/lang_switcher.dart';

import '../controllers/home_controller.dart';

main() {
  runApp(const GetMaterialApp(home: HomeView()));
}

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'.tr),
        centerTitle: true,
        actions: const [LangSwitcher()],
      ),
      body: Container(
        width: Get.width,
        decoration: const BoxDecoration(),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
