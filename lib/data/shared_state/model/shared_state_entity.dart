import 'package:drift/drift.dart';
import 'package:kkaebom/data/shared_state/model/base_colors.dart';

class SharedStateEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get baseColor => textEnum<BaseColors>()();

}