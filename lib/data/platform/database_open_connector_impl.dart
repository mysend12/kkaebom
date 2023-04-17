import 'package:drift/drift.dart';
import 'package:kkaebom/data/platform/database_open_connector.dart';

class DatabaseOpenConnectorImpl extends DatabaseOpenConnector {
  @override
  QueryExecutor openConnection() {
    throw Exception("Don't call this");
  }

}