import 'package:drift/drift.dart';
import 'package:kkaebom/data/user/model/user_entity.dart';

part 'user_database.g.dart';

@DriftDatabase(tables: [UserEntity])
class UserDatabase extends _$UserDatabase {
  UserDatabase(queryExecutor) : super(queryExecutor);

  @override
  int get schemaVersion => 1;

}

