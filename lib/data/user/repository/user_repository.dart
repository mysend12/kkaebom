import 'package:kkaebom/data/user/model/user_database.dart';

class UserRepository {
  UserRepository(this._database);

  final UserDatabase _database;

  Future<UserEntityData> save(UserEntityData entity) async {
    int id = await _database.into(_database.userEntity).insert(entity);

    return await (_database.select(_database.userEntity)
          ..where((e) => e.id.equals(id)))
        .getSingle();
  }
}
