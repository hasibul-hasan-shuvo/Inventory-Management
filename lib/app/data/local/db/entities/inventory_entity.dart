import 'package:drift/drift.dart';

class InventoryEntity extends Table {
  IntColumn get id => integer()();

  TextColumn get itemId => text()();

  TextColumn get product => text()();

  TextColumn get connectedCartItem => text()();

  IntColumn get maxCount => integer()();

  IntColumn get minCount => integer()();

  IntColumn get stockCount => integer()();

  IntColumn get fixedSuggestion => integer()();

  IntColumn get inventory => integer()();

  DateTimeColumn get created =>
      dateTime().withDefault(Constant(DateTime.now().toUtc()))();

  DateTimeColumn get modified =>
      dateTime().withDefault(Constant(DateTime.now().toUtc()))();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
