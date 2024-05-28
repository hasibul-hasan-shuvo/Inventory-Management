import 'package:drift/drift.dart';

class ShoppingCartEntity extends Table {
  TextColumn get itemId => text()();

  IntColumn get cartId => integer().nullable()();

  TextColumn get product => text()();

  IntColumn get quantity => integer()();

  DateTimeColumn get modified =>
      dateTime().withDefault(Constant(DateTime.now().toUtc()))();

  @override
  Set<Column<Object>>? get primaryKey => {itemId};
}
