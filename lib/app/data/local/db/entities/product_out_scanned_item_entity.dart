import 'package:drift/drift.dart';

class ProductOutScannedItemEntity extends Table {
  TextColumn get itemId => text()();

  IntColumn get stockCountChange => integer()();

  DateTimeColumn get modified =>
      dateTime().withDefault(Constant(DateTime.now().toUtc()))();

  @override
  Set<Column<Object>>? get primaryKey => {itemId};
}
