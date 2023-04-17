import 'package:drift/drift.dart';
import 'package:kkaebom/data/shared_state/model/base_colors.dart';
import 'package:kkaebom/data/shared_state/model/shared_state_database.dart';

class SharedStateRepository {
  SharedStateRepository(this._database);

  final SharedStateDatabase _database;

  Future<SharedStateEntityData> save(BaseColors color) async {
    int id = await _database
        .into(_database.sharedStateEntity)
        .insert(SharedStateEntityCompanion.insert(baseColor: color));

    return await (_database.select(_database.sharedStateEntity)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  Future<SharedStateEntityData?> findLastData() async {
    return (_database.select(_database.sharedStateEntity)
          ..orderBy([
            (entity) => OrderingTerm(
                  expression: entity.id,
                  mode: OrderingMode.desc,
                )
          ])..limit(1))
        .getSingleOrNull();
  }
}
