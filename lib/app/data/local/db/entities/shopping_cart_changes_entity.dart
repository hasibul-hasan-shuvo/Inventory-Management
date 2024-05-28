import 'package:drift/drift.dart';

class ShoppingCartChangesEntity extends Table {
  TextColumn get itemId => text()();

  IntColumn get quantityChange => integer()();

  DateTimeColumn get modified =>
      dateTime().withDefault(Constant(DateTime.now().toUtc()))();

  @override
  Set<Column<Object>>? get primaryKey => {itemId};
}
