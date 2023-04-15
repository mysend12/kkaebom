import 'package:drift/drift.dart';
import 'package:kkaebom/data/platform/database_open_connector.dart';
import 'package:kkaebom/data/user/model/user.dart';

part 'user_database.g.dart';

@DriftDatabase(tables: [User])
class UserDatabase extends _$UserDatabase {
  UserDatabase(DatabaseOpenConnector connector) : super(connector.openConnection('user'));

  @override
  int get schemaVersion => 1;
}

