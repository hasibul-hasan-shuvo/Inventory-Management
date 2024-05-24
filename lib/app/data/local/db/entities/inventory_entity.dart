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

  TextColumn get created => text()();

  IntColumn get createdMilliSecond => integer()();

  TextColumn get modified => text()();

  IntColumn get modifiedMilliSecond => integer()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
