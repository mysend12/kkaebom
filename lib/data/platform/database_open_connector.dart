import 'package:drift/drift.dart';

abstract class DatabaseOpenConnector {
  QueryExecutor openConnection();

}