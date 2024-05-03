import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/data/base_provider.dart';

class TodoProvider extends BaseProvider {
  Future<Response> create(Map<String, dynamic> body) {
    return post('/todos', body);
  }

  Future<Response> createWithFormData(Map<String, dynamic> body) {
    return patch(
      "todos",
      body,
      contentType: "application/x-www-form-urlencoded",
    );
  }

  Future<Response> deleteTodo(int id) {
    return delete('/todos/$id');
  }

  Future<Response> getAll() {
    return get('/todos');
  }

  Future<Response> getById(int id) {
    return get('/todos/$id');
  }

  Future<Response> update(int id, Map<String, dynamic> body) {
    return put('/todos/$id', body);
  }
}
