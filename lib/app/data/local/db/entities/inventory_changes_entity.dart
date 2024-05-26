import 'package:drift/drift.dart';

class InventoryChangesEntity extends Table {
  IntColumn get id => integer()();

  IntColumn get maxCount => integer().nullable()();

  IntColumn get minCount => integer().nullable()();

  IntColumn get stockCountChange => integer().withDefault(const Constant(0))();

  IntColumn get fixedSuggestion => integer().nullable()();

  DateTimeColumn get modified =>
      dateTime().withDefault(Constant(DateTime.now().toUtc()))();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
