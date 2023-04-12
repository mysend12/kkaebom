import 'package:drift/drift.dart';

class User extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}