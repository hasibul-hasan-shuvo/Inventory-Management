import 'package:drift/drift.dart';

class ProductCountEntity extends Table {
  IntColumn get id => integer()();

  IntColumn get stockCountChange => integer()();

  TextColumn get modified => text()();

  IntColumn get modifiedMilliSecond => integer()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
