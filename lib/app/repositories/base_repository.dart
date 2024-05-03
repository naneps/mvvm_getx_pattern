/// The base repository class for CRUD operations on a model.
///
/// This class provides the basic methods for creating, deleting, updating,
/// and retrieving data of type [T].
abstract class BaseRepository<T> {
  /// Creates a new instance of [T] in the repository.
  ///
  /// Returns a [Future] that completes with the created instance of [T].
  Future<T> create(T model);

  /// Deletes the specified instance of [T] from the repository.
  ///
  /// Returns a [Future] that completes with the deleted instance of [T].
  Future<T> delete(T model);

  /// Retrieves all instances of [T] from the repository.
  ///
  /// Returns a [Future] that completes with a list of instances of [T].
  Future<List<T>> getAll();

  /// Retrieves an instance of [T] with the specified [id] from the repository.
  ///
  /// Returns a [Future] that completes with the instance of [T] with the specified [id].
  Future<T> getById(int id);

  /// Updates the specified instance of [T] in the repository.
  ///
  /// Returns a [Future] that completes with the updated instance of [T].
  Future<T> update(T model);
}
