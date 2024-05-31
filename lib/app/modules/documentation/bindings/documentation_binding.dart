import 'package:get/get.dart';

import '../controllers/documentation_controller.dart';

class DocumentationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DocumentationController>(
      () => DocumentationController(),
    );
  }
}
