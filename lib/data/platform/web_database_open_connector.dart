import 'package:drift/drift.dart';
import 'package:drift/web.dart';
import 'package:kkaebom/data/platform/database_open_connector.dart';

class DatabaseOpenConnectorImpl extends DatabaseOpenConnector {

  @override
  QueryExecutor openConnection(String name) {
    return WebDatabase(name);
  }
}
