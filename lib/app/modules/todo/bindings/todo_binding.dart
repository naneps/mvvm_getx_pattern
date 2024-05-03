import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/data/todo_provider.dart';
import 'package:mvvm_getx_pattern/app/repositories/todo_repository.dart';

import '../controllers/todo_controller.dart';

class TodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoProvider>(() => TodoProvider());
    Get.lazyPut<TodoRepository>(() => TodoRepository());
    Get.lazyPut<TodoController>(() => TodoController());
  }
}
