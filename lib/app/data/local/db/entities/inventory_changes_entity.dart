import 'package:drift/drift.dart';

class InventoryChangesEntity extends Table {
  IntColumn get id => integer()();

  TextColumn get product => text()();

  IntColumn get maxCount => integer()();

  IntColumn get minCount => integer()();

  IntColumn get stockCountChange => integer()();

  IntColumn get fixedSuggestion => integer()();

  TextColumn get modified => text()();

  IntColumn get modifiedMilliSecond => integer()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
