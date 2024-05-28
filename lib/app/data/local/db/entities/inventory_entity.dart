import 'package:drift/drift.dart';

class InventoryEntity extends Table {
  IntColumn get id => integer().nullable()();

  TextColumn get itemId => text()();

  TextColumn get productName => text()();

  TextColumn get product => text()();

  IntColumn get maxCount => integer().nullable()();

  IntColumn get minCount => integer().nullable()();

  IntColumn get stockCount => integer().withDefault(const Constant(0))();

  IntColumn get fixedSuggestion => integer().nullable()();

  DateTimeColumn get created =>
      dateTime().withDefault(Constant(DateTime.now().toUtc()))();

  DateTimeColumn get modified =>
      dateTime().withDefault(Constant(DateTime.now().toUtc()))();

  @override
  Set<Column<Object>>? get primaryKey => {itemId};
}
