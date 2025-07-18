import 'dart:io';

import 'package:dental_inventory/app/data/local/db/entities/deleted_inventory_entity.dart';
import 'package:dental_inventory/app/data/local/db/entities/inventory_changes_entity.dart';
import 'package:dental_inventory/app/data/local/db/entities/inventory_entity.dart';
import 'package:dental_inventory/app/data/local/db/entities/product_count_scanned_item_entity.dart';
import 'package:dental_inventory/app/data/local/db/entities/product_in_scanned_item_entity.dart';
import 'package:dental_inventory/app/data/local/db/entities/product_out_scanned_item_entity.dart';
import 'package:dental_inventory/app/data/local/db/entities/shopping_cart_changes_entity.dart';
import 'package:dental_inventory/app/data/local/db/entities/shopping_cart_entity.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(
    () async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(path.join(dbFolder.path, 'dental.sqlite'));

      return NativeDatabase.createInBackground(file);
    },
  );
}

@DriftDatabase(tables: [
  InventoryEntity,
  InventoryChangesEntity,
  DeletedInventoryEntity,
  ProductInScannedItemEntity,
  ProductOutScannedItemEntity,
  ProductCountScannedItemEntity,
  ShoppingCartEntity,
  ShoppingCartChangesEntity,
])
class AppDatabase extends _$AppDatabase {
  static final AppDatabase _instance = AppDatabase._internal();

  factory AppDatabase() {
    return _instance;
  }

  AppDatabase._internal() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {
          if (from < 2) {
            _migrationScheme02(m);
          }
        },
      );

  Future<void> _migrationScheme02(Migrator m) async {
    await m.addColumn(
      inventoryChangesEntity,
      inventoryChangesEntity.replaceWith,
    );
  }
}
