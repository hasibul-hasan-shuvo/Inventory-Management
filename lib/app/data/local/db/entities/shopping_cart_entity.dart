import 'package:drift/drift.dart';

class ShoppingCartEntity extends Table {
  IntColumn get id => integer()();

  IntColumn get inventoryId => integer()();

  TextColumn get product => text()();

  IntColumn get quantity => integer()();

  TextColumn get modified => text()();

  IntColumn get modifiedMilliSecond => integer()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
