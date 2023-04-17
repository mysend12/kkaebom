import 'package:drift/drift.dart';
import 'package:kkaebom/data/shared_state/model/base_colors.dart';
import 'package:kkaebom/data/shared_state/model/shared_state_entity.dart';

part 'shared_state_database.g.dart';

@DriftDatabase(tables: [SharedStateEntity])
class SharedStateDatabase extends _$SharedStateDatabase {
  SharedStateDatabase(queryExecutor) : super(queryExecutor);

  @override
  int get schemaVersion => 1;

  // @override
  // MigrationStrategy get migration => MigrationStrategy(
  //   onCreate: (Migrator m) async {
  //     await m.createAll();
  //     // await m.drop(sharedStateEntity);
  //     // await m.create(sharedStateEntity);
  //   },
  //   onUpgrade: (Migrator m, int from, int to) async {
  //
  //   },
  // );
}