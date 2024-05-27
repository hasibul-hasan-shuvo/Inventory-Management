import 'package:drift/drift.dart';

class ProductCountScannedItemEntity extends Table {
  IntColumn get id => integer()();

  IntColumn get stockCountChange => integer()();

  DateTimeColumn get modified =>
      dateTime().withDefault(Constant(DateTime.now().toUtc()))();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
