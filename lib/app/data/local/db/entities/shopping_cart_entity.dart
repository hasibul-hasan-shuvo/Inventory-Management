import 'package:drift/drift.dart';

class ShoppingCartEntity extends Table {
  IntColumn get id => integer()();

  IntColumn get inventoryId => integer()();

  TextColumn get product => text()();

  IntColumn get quantity => integer()();

  DateTimeColumn get modified =>
      dateTime().withDefault(Constant(DateTime.now().toUtc()))();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
