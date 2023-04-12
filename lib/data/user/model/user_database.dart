import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:kkaebom/data/user/model/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'user_database.g.dart';

@DriftDatabase(tables: [User])
class UserDatabase extends _$UserDatabase {
  UserDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'user.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}