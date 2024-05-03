import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/data/todo_provider.dart';
import 'package:mvvm_getx_pattern/app/models/todo_model.dart';
import 'package:mvvm_getx_pattern/app/repositories/base_repository.dart';

class TodoRepository implements BaseRepository<TodoModel> {
  final TodoProvider provider = Get.find<TodoProvider>();
  final List<TodoModel> _todos = [];
  @override
  Future<TodoModel> create(TodoModel model) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<TodoModel> delete(model) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<TodoModel>> getAll() async {
    try {
      final response = await provider.getAll();
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        final List<TodoModel> todos = [];
        for (var item in response.body) {}
        return todos;
      }
    } on Exception catch (e) {
      return [];
    }
  }

  @override
  Future<TodoModel> getById(int id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<TodoModel> update(model) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
