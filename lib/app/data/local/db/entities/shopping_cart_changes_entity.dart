import 'package:drift/drift.dart';

class ShoppingCartChangesEntity extends Table {
  IntColumn get id => integer()();

  IntColumn get quantityChange => integer()();

  TextColumn get modified => text()();

  IntColumn get modifiedMilliSecond => integer()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
