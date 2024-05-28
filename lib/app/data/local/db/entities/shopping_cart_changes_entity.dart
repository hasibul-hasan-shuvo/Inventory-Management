import 'package:drift/drift.dart';

class ShoppingCartChangesEntity extends Table {
  IntColumn get id => integer()();

  IntColumn get quantityChange => integer()();

  DateTimeColumn get modified =>
      dateTime().withDefault(Constant(DateTime.now().toUtc()))();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
