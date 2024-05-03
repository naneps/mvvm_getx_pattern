import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/models/todo_model.dart';
import 'package:mvvm_getx_pattern/app/repositories/todo_repository.dart';

class TodoController extends GetxController with StateMixin<List<TodoModel>> {
  RxList<TodoModel> todos = <TodoModel>[].obs;
  final todoRepository = Get.find<TodoRepository>();
  void fetchTodos() async {}
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
