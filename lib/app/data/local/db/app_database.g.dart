// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $InventoryEntityTable extends InventoryEntity
    with TableInfo<$InventoryEntityTable, InventoryEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InventoryEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<String> itemId = GeneratedColumn<String>(
      'item_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _productNameMeta =
      const VerificationMeta('productName');
  @override
  late final GeneratedColumn<String> productName = GeneratedColumn<String>(
      'product_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _productMeta =
      const VerificationMeta('product');
  @override
  late final GeneratedColumn<String> product = GeneratedColumn<String>(
      'product', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _connectedCartItemMeta =
      const VerificationMeta('connectedCartItem');
  @override
  late final GeneratedColumn<String> connectedCartItem =
      GeneratedColumn<String>('connected_cart_item', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _maxCountMeta =
      const VerificationMeta('maxCount');
  @override
  late final GeneratedColumn<int> maxCount = GeneratedColumn<int>(
      'max_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _minCountMeta =
      const VerificationMeta('minCount');
  @override
  late final GeneratedColumn<int> minCount = GeneratedColumn<int>(
      'min_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _stockCountMeta =
      const VerificationMeta('stockCount');
  @override
  late final GeneratedColumn<int> stockCount = GeneratedColumn<int>(
      'stock_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _fixedSuggestionMeta =
      const VerificationMeta('fixedSuggestion');
  @override
  late final GeneratedColumn<int> fixedSuggestion = GeneratedColumn<int>(
      'fixed_suggestion', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _inventoryMeta =
      const VerificationMeta('inventory');
  @override
  late final GeneratedColumn<int> inventory = GeneratedColumn<int>(
      'inventory', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  @override
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now().toUtc()));
  static const VerificationMeta _modifiedMeta =
      const VerificationMeta('modified');
  @override
  late final GeneratedColumn<DateTime> modified = GeneratedColumn<DateTime>(
      'modified', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now().toUtc()));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        itemId,
        productName,
        product,
        connectedCartItem,
        maxCount,
        minCount,
        stockCount,
        fixedSuggestion,
        inventory,
        created,
        modified
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'inventory_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<InventoryEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('product_name')) {
      context.handle(
          _productNameMeta,
          productName.isAcceptableOrUnknown(
              data['product_name']!, _productNameMeta));
    } else if (isInserting) {
      context.missing(_productNameMeta);
    }
    if (data.containsKey('product')) {
      context.handle(_productMeta,
          product.isAcceptableOrUnknown(data['product']!, _productMeta));
    } else if (isInserting) {
      context.missing(_productMeta);
    }
    if (data.containsKey('connected_cart_item')) {
      context.handle(
          _connectedCartItemMeta,
          connectedCartItem.isAcceptableOrUnknown(
              data['connected_cart_item']!, _connectedCartItemMeta));
    } else if (isInserting) {
      context.missing(_connectedCartItemMeta);
    }
    if (data.containsKey('max_count')) {
      context.handle(_maxCountMeta,
          maxCount.isAcceptableOrUnknown(data['max_count']!, _maxCountMeta));
    } else if (isInserting) {
      context.missing(_maxCountMeta);
    }
    if (data.containsKey('min_count')) {
      context.handle(_minCountMeta,
          minCount.isAcceptableOrUnknown(data['min_count']!, _minCountMeta));
    } else if (isInserting) {
      context.missing(_minCountMeta);
    }
    if (data.containsKey('stock_count')) {
      context.handle(
          _stockCountMeta,
          stockCount.isAcceptableOrUnknown(
              data['stock_count']!, _stockCountMeta));
    } else if (isInserting) {
      context.missing(_stockCountMeta);
    }
    if (data.containsKey('fixed_suggestion')) {
      context.handle(
          _fixedSuggestionMeta,
          fixedSuggestion.isAcceptableOrUnknown(
              data['fixed_suggestion']!, _fixedSuggestionMeta));
    } else if (isInserting) {
      context.missing(_fixedSuggestionMeta);
    }
    if (data.containsKey('inventory')) {
      context.handle(_inventoryMeta,
          inventory.isAcceptableOrUnknown(data['inventory']!, _inventoryMeta));
    } else if (isInserting) {
      context.missing(_inventoryMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    }
    if (data.containsKey('modified')) {
      context.handle(_modifiedMeta,
          modified.isAcceptableOrUnknown(data['modified']!, _modifiedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InventoryEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InventoryEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      itemId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_id'])!,
      productName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_name'])!,
      product: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product'])!,
      connectedCartItem: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}connected_cart_item'])!,
      maxCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_count'])!,
      minCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}min_count'])!,
      stockCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}stock_count'])!,
      fixedSuggestion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}fixed_suggestion'])!,
      inventory: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}inventory'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      modified: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}modified'])!,
    );
  }

  @override
  $InventoryEntityTable createAlias(String alias) {
    return $InventoryEntityTable(attachedDatabase, alias);
  }
}

class InventoryEntityData extends DataClass
    implements Insertable<InventoryEntityData> {
  final int id;
  final String itemId;
  final String productName;
  final String product;
  final String connectedCartItem;
  final int maxCount;
  final int minCount;
  final int stockCount;
  final int fixedSuggestion;
  final int inventory;
  final DateTime created;
  final DateTime modified;
  const InventoryEntityData(
      {required this.id,
      required this.itemId,
      required this.productName,
      required this.product,
      required this.connectedCartItem,
      required this.maxCount,
      required this.minCount,
      required this.stockCount,
      required this.fixedSuggestion,
      required this.inventory,
      required this.created,
      required this.modified});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['item_id'] = Variable<String>(itemId);
    map['product_name'] = Variable<String>(productName);
    map['product'] = Variable<String>(product);
    map['connected_cart_item'] = Variable<String>(connectedCartItem);
    map['max_count'] = Variable<int>(maxCount);
    map['min_count'] = Variable<int>(minCount);
    map['stock_count'] = Variable<int>(stockCount);
    map['fixed_suggestion'] = Variable<int>(fixedSuggestion);
    map['inventory'] = Variable<int>(inventory);
    map['created'] = Variable<DateTime>(created);
    map['modified'] = Variable<DateTime>(modified);
    return map;
  }

  InventoryEntityCompanion toCompanion(bool nullToAbsent) {
    return InventoryEntityCompanion(
      id: Value(id),
      itemId: Value(itemId),
      productName: Value(productName),
      product: Value(product),
      connectedCartItem: Value(connectedCartItem),
      maxCount: Value(maxCount),
      minCount: Value(minCount),
      stockCount: Value(stockCount),
      fixedSuggestion: Value(fixedSuggestion),
      inventory: Value(inventory),
      created: Value(created),
      modified: Value(modified),
    );
  }

  factory InventoryEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InventoryEntityData(
      id: serializer.fromJson<int>(json['id']),
      itemId: serializer.fromJson<String>(json['itemId']),
      productName: serializer.fromJson<String>(json['productName']),
      product: serializer.fromJson<String>(json['product']),
      connectedCartItem: serializer.fromJson<String>(json['connectedCartItem']),
      maxCount: serializer.fromJson<int>(json['maxCount']),
      minCount: serializer.fromJson<int>(json['minCount']),
      stockCount: serializer.fromJson<int>(json['stockCount']),
      fixedSuggestion: serializer.fromJson<int>(json['fixedSuggestion']),
      inventory: serializer.fromJson<int>(json['inventory']),
      created: serializer.fromJson<DateTime>(json['created']),
      modified: serializer.fromJson<DateTime>(json['modified']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'itemId': serializer.toJson<String>(itemId),
      'productName': serializer.toJson<String>(productName),
      'product': serializer.toJson<String>(product),
      'connectedCartItem': serializer.toJson<String>(connectedCartItem),
      'maxCount': serializer.toJson<int>(maxCount),
      'minCount': serializer.toJson<int>(minCount),
      'stockCount': serializer.toJson<int>(stockCount),
      'fixedSuggestion': serializer.toJson<int>(fixedSuggestion),
      'inventory': serializer.toJson<int>(inventory),
      'created': serializer.toJson<DateTime>(created),
      'modified': serializer.toJson<DateTime>(modified),
    };
  }

  InventoryEntityData copyWith(
          {int? id,
          String? itemId,
          String? productName,
          String? product,
          String? connectedCartItem,
          int? maxCount,
          int? minCount,
          int? stockCount,
          int? fixedSuggestion,
          int? inventory,
          DateTime? created,
          DateTime? modified}) =>
      InventoryEntityData(
        id: id ?? this.id,
        itemId: itemId ?? this.itemId,
        productName: productName ?? this.productName,
        product: product ?? this.product,
        connectedCartItem: connectedCartItem ?? this.connectedCartItem,
        maxCount: maxCount ?? this.maxCount,
        minCount: minCount ?? this.minCount,
        stockCount: stockCount ?? this.stockCount,
        fixedSuggestion: fixedSuggestion ?? this.fixedSuggestion,
        inventory: inventory ?? this.inventory,
        created: created ?? this.created,
        modified: modified ?? this.modified,
      );
  @override
  String toString() {
    return (StringBuffer('InventoryEntityData(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('productName: $productName, ')
          ..write('product: $product, ')
          ..write('connectedCartItem: $connectedCartItem, ')
          ..write('maxCount: $maxCount, ')
          ..write('minCount: $minCount, ')
          ..write('stockCount: $stockCount, ')
          ..write('fixedSuggestion: $fixedSuggestion, ')
          ..write('inventory: $inventory, ')
          ..write('created: $created, ')
          ..write('modified: $modified')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      itemId,
      productName,
      product,
      connectedCartItem,
      maxCount,
      minCount,
      stockCount,
      fixedSuggestion,
      inventory,
      created,
      modified);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InventoryEntityData &&
          other.id == this.id &&
          other.itemId == this.itemId &&
          other.productName == this.productName &&
          other.product == this.product &&
          other.connectedCartItem == this.connectedCartItem &&
          other.maxCount == this.maxCount &&
          other.minCount == this.minCount &&
          other.stockCount == this.stockCount &&
          other.fixedSuggestion == this.fixedSuggestion &&
          other.inventory == this.inventory &&
          other.created == this.created &&
          other.modified == this.modified);
}

class InventoryEntityCompanion extends UpdateCompanion<InventoryEntityData> {
  final Value<int> id;
  final Value<String> itemId;
  final Value<String> productName;
  final Value<String> product;
  final Value<String> connectedCartItem;
  final Value<int> maxCount;
  final Value<int> minCount;
  final Value<int> stockCount;
  final Value<int> fixedSuggestion;
  final Value<int> inventory;
  final Value<DateTime> created;
  final Value<DateTime> modified;
  const InventoryEntityCompanion({
    this.id = const Value.absent(),
    this.itemId = const Value.absent(),
    this.productName = const Value.absent(),
    this.product = const Value.absent(),
    this.connectedCartItem = const Value.absent(),
    this.maxCount = const Value.absent(),
    this.minCount = const Value.absent(),
    this.stockCount = const Value.absent(),
    this.fixedSuggestion = const Value.absent(),
    this.inventory = const Value.absent(),
    this.created = const Value.absent(),
    this.modified = const Value.absent(),
  });
  InventoryEntityCompanion.insert({
    this.id = const Value.absent(),
    required String itemId,
    required String productName,
    required String product,
    required String connectedCartItem,
    required int maxCount,
    required int minCount,
    required int stockCount,
    required int fixedSuggestion,
    required int inventory,
    this.created = const Value.absent(),
    this.modified = const Value.absent(),
  })  : itemId = Value(itemId),
        productName = Value(productName),
        product = Value(product),
        connectedCartItem = Value(connectedCartItem),
        maxCount = Value(maxCount),
        minCount = Value(minCount),
        stockCount = Value(stockCount),
        fixedSuggestion = Value(fixedSuggestion),
        inventory = Value(inventory);
  static Insertable<InventoryEntityData> custom({
    Expression<int>? id,
    Expression<String>? itemId,
    Expression<String>? productName,
    Expression<String>? product,
    Expression<String>? connectedCartItem,
    Expression<int>? maxCount,
    Expression<int>? minCount,
    Expression<int>? stockCount,
    Expression<int>? fixedSuggestion,
    Expression<int>? inventory,
    Expression<DateTime>? created,
    Expression<DateTime>? modified,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemId != null) 'item_id': itemId,
      if (productName != null) 'product_name': productName,
      if (product != null) 'product': product,
      if (connectedCartItem != null) 'connected_cart_item': connectedCartItem,
      if (maxCount != null) 'max_count': maxCount,
      if (minCount != null) 'min_count': minCount,
      if (stockCount != null) 'stock_count': stockCount,
      if (fixedSuggestion != null) 'fixed_suggestion': fixedSuggestion,
      if (inventory != null) 'inventory': inventory,
      if (created != null) 'created': created,
      if (modified != null) 'modified': modified,
    });
  }

  InventoryEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? itemId,
      Value<String>? productName,
      Value<String>? product,
      Value<String>? connectedCartItem,
      Value<int>? maxCount,
      Value<int>? minCount,
      Value<int>? stockCount,
      Value<int>? fixedSuggestion,
      Value<int>? inventory,
      Value<DateTime>? created,
      Value<DateTime>? modified}) {
    return InventoryEntityCompanion(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      productName: productName ?? this.productName,
      product: product ?? this.product,
      connectedCartItem: connectedCartItem ?? this.connectedCartItem,
      maxCount: maxCount ?? this.maxCount,
      minCount: minCount ?? this.minCount,
      stockCount: stockCount ?? this.stockCount,
      fixedSuggestion: fixedSuggestion ?? this.fixedSuggestion,
      inventory: inventory ?? this.inventory,
      created: created ?? this.created,
      modified: modified ?? this.modified,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<String>(itemId.value);
    }
    if (productName.present) {
      map['product_name'] = Variable<String>(productName.value);
    }
    if (product.present) {
      map['product'] = Variable<String>(product.value);
    }
    if (connectedCartItem.present) {
      map['connected_cart_item'] = Variable<String>(connectedCartItem.value);
    }
    if (maxCount.present) {
      map['max_count'] = Variable<int>(maxCount.value);
    }
    if (minCount.present) {
      map['min_count'] = Variable<int>(minCount.value);
    }
    if (stockCount.present) {
      map['stock_count'] = Variable<int>(stockCount.value);
    }
    if (fixedSuggestion.present) {
      map['fixed_suggestion'] = Variable<int>(fixedSuggestion.value);
    }
    if (inventory.present) {
      map['inventory'] = Variable<int>(inventory.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (modified.present) {
      map['modified'] = Variable<DateTime>(modified.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventoryEntityCompanion(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('productName: $productName, ')
          ..write('product: $product, ')
          ..write('connectedCartItem: $connectedCartItem, ')
          ..write('maxCount: $maxCount, ')
          ..write('minCount: $minCount, ')
          ..write('stockCount: $stockCount, ')
          ..write('fixedSuggestion: $fixedSuggestion, ')
          ..write('inventory: $inventory, ')
          ..write('created: $created, ')
          ..write('modified: $modified')
          ..write(')'))
        .toString();
  }
}

class $InventoryChangesEntityTable extends InventoryChangesEntity
    with TableInfo<$InventoryChangesEntityTable, InventoryChangesEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InventoryChangesEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<String> itemId = GeneratedColumn<String>(
      'item_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _maxCountMeta =
      const VerificationMeta('maxCount');
  @override
  late final GeneratedColumn<int> maxCount = GeneratedColumn<int>(
      'max_count', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _minCountMeta =
      const VerificationMeta('minCount');
  @override
  late final GeneratedColumn<int> minCount = GeneratedColumn<int>(
      'min_count', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _stockCountChangeMeta =
      const VerificationMeta('stockCountChange');
  @override
  late final GeneratedColumn<int> stockCountChange = GeneratedColumn<int>(
      'stock_count_change', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _fixedSuggestionMeta =
      const VerificationMeta('fixedSuggestion');
  @override
  late final GeneratedColumn<int> fixedSuggestion = GeneratedColumn<int>(
      'fixed_suggestion', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _modifiedMeta =
      const VerificationMeta('modified');
  @override
  late final GeneratedColumn<DateTime> modified = GeneratedColumn<DateTime>(
      'modified', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now().toUtc()));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        itemId,
        maxCount,
        minCount,
        stockCountChange,
        fixedSuggestion,
        modified
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'inventory_changes_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<InventoryChangesEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('max_count')) {
      context.handle(_maxCountMeta,
          maxCount.isAcceptableOrUnknown(data['max_count']!, _maxCountMeta));
    }
    if (data.containsKey('min_count')) {
      context.handle(_minCountMeta,
          minCount.isAcceptableOrUnknown(data['min_count']!, _minCountMeta));
    }
    if (data.containsKey('stock_count_change')) {
      context.handle(
          _stockCountChangeMeta,
          stockCountChange.isAcceptableOrUnknown(
              data['stock_count_change']!, _stockCountChangeMeta));
    }
    if (data.containsKey('fixed_suggestion')) {
      context.handle(
          _fixedSuggestionMeta,
          fixedSuggestion.isAcceptableOrUnknown(
              data['fixed_suggestion']!, _fixedSuggestionMeta));
    }
    if (data.containsKey('modified')) {
      context.handle(_modifiedMeta,
          modified.isAcceptableOrUnknown(data['modified']!, _modifiedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InventoryChangesEntityData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InventoryChangesEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      itemId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_id'])!,
      maxCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_count']),
      minCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}min_count']),
      stockCountChange: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}stock_count_change'])!,
      fixedSuggestion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}fixed_suggestion']),
      modified: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}modified'])!,
    );
  }

  @override
  $InventoryChangesEntityTable createAlias(String alias) {
    return $InventoryChangesEntityTable(attachedDatabase, alias);
  }
}

class InventoryChangesEntityData extends DataClass
    implements Insertable<InventoryChangesEntityData> {
  final int id;
  final String itemId;
  final int? maxCount;
  final int? minCount;
  final int stockCountChange;
  final int? fixedSuggestion;
  final DateTime modified;
  const InventoryChangesEntityData(
      {required this.id,
      required this.itemId,
      this.maxCount,
      this.minCount,
      required this.stockCountChange,
      this.fixedSuggestion,
      required this.modified});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['item_id'] = Variable<String>(itemId);
    if (!nullToAbsent || maxCount != null) {
      map['max_count'] = Variable<int>(maxCount);
    }
    if (!nullToAbsent || minCount != null) {
      map['min_count'] = Variable<int>(minCount);
    }
    map['stock_count_change'] = Variable<int>(stockCountChange);
    if (!nullToAbsent || fixedSuggestion != null) {
      map['fixed_suggestion'] = Variable<int>(fixedSuggestion);
    }
    map['modified'] = Variable<DateTime>(modified);
    return map;
  }

  InventoryChangesEntityCompanion toCompanion(bool nullToAbsent) {
    return InventoryChangesEntityCompanion(
      id: Value(id),
      itemId: Value(itemId),
      maxCount: maxCount == null && nullToAbsent
          ? const Value.absent()
          : Value(maxCount),
      minCount: minCount == null && nullToAbsent
          ? const Value.absent()
          : Value(minCount),
      stockCountChange: Value(stockCountChange),
      fixedSuggestion: fixedSuggestion == null && nullToAbsent
          ? const Value.absent()
          : Value(fixedSuggestion),
      modified: Value(modified),
    );
  }

  factory InventoryChangesEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InventoryChangesEntityData(
      id: serializer.fromJson<int>(json['id']),
      itemId: serializer.fromJson<String>(json['itemId']),
      maxCount: serializer.fromJson<int?>(json['maxCount']),
      minCount: serializer.fromJson<int?>(json['minCount']),
      stockCountChange: serializer.fromJson<int>(json['stockCountChange']),
      fixedSuggestion: serializer.fromJson<int?>(json['fixedSuggestion']),
      modified: serializer.fromJson<DateTime>(json['modified']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'itemId': serializer.toJson<String>(itemId),
      'maxCount': serializer.toJson<int?>(maxCount),
      'minCount': serializer.toJson<int?>(minCount),
      'stockCountChange': serializer.toJson<int>(stockCountChange),
      'fixedSuggestion': serializer.toJson<int?>(fixedSuggestion),
      'modified': serializer.toJson<DateTime>(modified),
    };
  }

  InventoryChangesEntityData copyWith(
          {int? id,
          String? itemId,
          Value<int?> maxCount = const Value.absent(),
          Value<int?> minCount = const Value.absent(),
          int? stockCountChange,
          Value<int?> fixedSuggestion = const Value.absent(),
          DateTime? modified}) =>
      InventoryChangesEntityData(
        id: id ?? this.id,
        itemId: itemId ?? this.itemId,
        maxCount: maxCount.present ? maxCount.value : this.maxCount,
        minCount: minCount.present ? minCount.value : this.minCount,
        stockCountChange: stockCountChange ?? this.stockCountChange,
        fixedSuggestion: fixedSuggestion.present
            ? fixedSuggestion.value
            : this.fixedSuggestion,
        modified: modified ?? this.modified,
      );
  @override
  String toString() {
    return (StringBuffer('InventoryChangesEntityData(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('maxCount: $maxCount, ')
          ..write('minCount: $minCount, ')
          ..write('stockCountChange: $stockCountChange, ')
          ..write('fixedSuggestion: $fixedSuggestion, ')
          ..write('modified: $modified')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, itemId, maxCount, minCount,
      stockCountChange, fixedSuggestion, modified);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InventoryChangesEntityData &&
          other.id == this.id &&
          other.itemId == this.itemId &&
          other.maxCount == this.maxCount &&
          other.minCount == this.minCount &&
          other.stockCountChange == this.stockCountChange &&
          other.fixedSuggestion == this.fixedSuggestion &&
          other.modified == this.modified);
}

class InventoryChangesEntityCompanion
    extends UpdateCompanion<InventoryChangesEntityData> {
  final Value<int> id;
  final Value<String> itemId;
  final Value<int?> maxCount;
  final Value<int?> minCount;
  final Value<int> stockCountChange;
  final Value<int?> fixedSuggestion;
  final Value<DateTime> modified;
  const InventoryChangesEntityCompanion({
    this.id = const Value.absent(),
    this.itemId = const Value.absent(),
    this.maxCount = const Value.absent(),
    this.minCount = const Value.absent(),
    this.stockCountChange = const Value.absent(),
    this.fixedSuggestion = const Value.absent(),
    this.modified = const Value.absent(),
  });
  InventoryChangesEntityCompanion.insert({
    this.id = const Value.absent(),
    required String itemId,
    this.maxCount = const Value.absent(),
    this.minCount = const Value.absent(),
    this.stockCountChange = const Value.absent(),
    this.fixedSuggestion = const Value.absent(),
    this.modified = const Value.absent(),
  }) : itemId = Value(itemId);
  static Insertable<InventoryChangesEntityData> custom({
    Expression<int>? id,
    Expression<String>? itemId,
    Expression<int>? maxCount,
    Expression<int>? minCount,
    Expression<int>? stockCountChange,
    Expression<int>? fixedSuggestion,
    Expression<DateTime>? modified,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemId != null) 'item_id': itemId,
      if (maxCount != null) 'max_count': maxCount,
      if (minCount != null) 'min_count': minCount,
      if (stockCountChange != null) 'stock_count_change': stockCountChange,
      if (fixedSuggestion != null) 'fixed_suggestion': fixedSuggestion,
      if (modified != null) 'modified': modified,
    });
  }

  InventoryChangesEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? itemId,
      Value<int?>? maxCount,
      Value<int?>? minCount,
      Value<int>? stockCountChange,
      Value<int?>? fixedSuggestion,
      Value<DateTime>? modified}) {
    return InventoryChangesEntityCompanion(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      maxCount: maxCount ?? this.maxCount,
      minCount: minCount ?? this.minCount,
      stockCountChange: stockCountChange ?? this.stockCountChange,
      fixedSuggestion: fixedSuggestion ?? this.fixedSuggestion,
      modified: modified ?? this.modified,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<String>(itemId.value);
    }
    if (maxCount.present) {
      map['max_count'] = Variable<int>(maxCount.value);
    }
    if (minCount.present) {
      map['min_count'] = Variable<int>(minCount.value);
    }
    if (stockCountChange.present) {
      map['stock_count_change'] = Variable<int>(stockCountChange.value);
    }
    if (fixedSuggestion.present) {
      map['fixed_suggestion'] = Variable<int>(fixedSuggestion.value);
    }
    if (modified.present) {
      map['modified'] = Variable<DateTime>(modified.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventoryChangesEntityCompanion(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('maxCount: $maxCount, ')
          ..write('minCount: $minCount, ')
          ..write('stockCountChange: $stockCountChange, ')
          ..write('fixedSuggestion: $fixedSuggestion, ')
          ..write('modified: $modified')
          ..write(')'))
        .toString();
  }
}

class $DeletedInventoryEntityTable extends DeletedInventoryEntity
    with TableInfo<$DeletedInventoryEntityTable, DeletedInventoryEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DeletedInventoryEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'deleted_inventory_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<DeletedInventoryEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DeletedInventoryEntityData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DeletedInventoryEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
    );
  }

  @override
  $DeletedInventoryEntityTable createAlias(String alias) {
    return $DeletedInventoryEntityTable(attachedDatabase, alias);
  }
}

class DeletedInventoryEntityData extends DataClass
    implements Insertable<DeletedInventoryEntityData> {
  final int id;
  const DeletedInventoryEntityData({required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    return map;
  }

  DeletedInventoryEntityCompanion toCompanion(bool nullToAbsent) {
    return DeletedInventoryEntityCompanion(
      id: Value(id),
    );
  }

  factory DeletedInventoryEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DeletedInventoryEntityData(
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
    };
  }

  DeletedInventoryEntityData copyWith({int? id}) => DeletedInventoryEntityData(
        id: id ?? this.id,
      );
  @override
  String toString() {
    return (StringBuffer('DeletedInventoryEntityData(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => id.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeletedInventoryEntityData && other.id == this.id);
}

class DeletedInventoryEntityCompanion
    extends UpdateCompanion<DeletedInventoryEntityData> {
  final Value<int> id;
  const DeletedInventoryEntityCompanion({
    this.id = const Value.absent(),
  });
  DeletedInventoryEntityCompanion.insert({
    this.id = const Value.absent(),
  });
  static Insertable<DeletedInventoryEntityData> custom({
    Expression<int>? id,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
    });
  }

  DeletedInventoryEntityCompanion copyWith({Value<int>? id}) {
    return DeletedInventoryEntityCompanion(
      id: id ?? this.id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DeletedInventoryEntityCompanion(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

class $ProductInScannedItemEntityTable extends ProductInScannedItemEntity
    with
        TableInfo<$ProductInScannedItemEntityTable,
            ProductInScannedItemEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductInScannedItemEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _stockCountChangeMeta =
      const VerificationMeta('stockCountChange');
  @override
  late final GeneratedColumn<int> stockCountChange = GeneratedColumn<int>(
      'stock_count_change', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _modifiedMeta =
      const VerificationMeta('modified');
  @override
  late final GeneratedColumn<DateTime> modified = GeneratedColumn<DateTime>(
      'modified', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now().toUtc()));
  @override
  List<GeneratedColumn> get $columns => [id, stockCountChange, modified];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_in_scanned_item_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<ProductInScannedItemEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('stock_count_change')) {
      context.handle(
          _stockCountChangeMeta,
          stockCountChange.isAcceptableOrUnknown(
              data['stock_count_change']!, _stockCountChangeMeta));
    } else if (isInserting) {
      context.missing(_stockCountChangeMeta);
    }
    if (data.containsKey('modified')) {
      context.handle(_modifiedMeta,
          modified.isAcceptableOrUnknown(data['modified']!, _modifiedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductInScannedItemEntityData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductInScannedItemEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      stockCountChange: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}stock_count_change'])!,
      modified: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}modified'])!,
    );
  }

  @override
  $ProductInScannedItemEntityTable createAlias(String alias) {
    return $ProductInScannedItemEntityTable(attachedDatabase, alias);
  }
}

class ProductInScannedItemEntityData extends DataClass
    implements Insertable<ProductInScannedItemEntityData> {
  final int id;
  final int stockCountChange;
  final DateTime modified;
  const ProductInScannedItemEntityData(
      {required this.id,
      required this.stockCountChange,
      required this.modified});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['stock_count_change'] = Variable<int>(stockCountChange);
    map['modified'] = Variable<DateTime>(modified);
    return map;
  }

  ProductInScannedItemEntityCompanion toCompanion(bool nullToAbsent) {
    return ProductInScannedItemEntityCompanion(
      id: Value(id),
      stockCountChange: Value(stockCountChange),
      modified: Value(modified),
    );
  }

  factory ProductInScannedItemEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductInScannedItemEntityData(
      id: serializer.fromJson<int>(json['id']),
      stockCountChange: serializer.fromJson<int>(json['stockCountChange']),
      modified: serializer.fromJson<DateTime>(json['modified']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'stockCountChange': serializer.toJson<int>(stockCountChange),
      'modified': serializer.toJson<DateTime>(modified),
    };
  }

  ProductInScannedItemEntityData copyWith(
          {int? id, int? stockCountChange, DateTime? modified}) =>
      ProductInScannedItemEntityData(
        id: id ?? this.id,
        stockCountChange: stockCountChange ?? this.stockCountChange,
        modified: modified ?? this.modified,
      );
  @override
  String toString() {
    return (StringBuffer('ProductInScannedItemEntityData(')
          ..write('id: $id, ')
          ..write('stockCountChange: $stockCountChange, ')
          ..write('modified: $modified')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, stockCountChange, modified);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductInScannedItemEntityData &&
          other.id == this.id &&
          other.stockCountChange == this.stockCountChange &&
          other.modified == this.modified);
}

class ProductInScannedItemEntityCompanion
    extends UpdateCompanion<ProductInScannedItemEntityData> {
  final Value<int> id;
  final Value<int> stockCountChange;
  final Value<DateTime> modified;
  const ProductInScannedItemEntityCompanion({
    this.id = const Value.absent(),
    this.stockCountChange = const Value.absent(),
    this.modified = const Value.absent(),
  });
  ProductInScannedItemEntityCompanion.insert({
    this.id = const Value.absent(),
    required int stockCountChange,
    this.modified = const Value.absent(),
  }) : stockCountChange = Value(stockCountChange);
  static Insertable<ProductInScannedItemEntityData> custom({
    Expression<int>? id,
    Expression<int>? stockCountChange,
    Expression<DateTime>? modified,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (stockCountChange != null) 'stock_count_change': stockCountChange,
      if (modified != null) 'modified': modified,
    });
  }

  ProductInScannedItemEntityCompanion copyWith(
      {Value<int>? id,
      Value<int>? stockCountChange,
      Value<DateTime>? modified}) {
    return ProductInScannedItemEntityCompanion(
      id: id ?? this.id,
      stockCountChange: stockCountChange ?? this.stockCountChange,
      modified: modified ?? this.modified,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (stockCountChange.present) {
      map['stock_count_change'] = Variable<int>(stockCountChange.value);
    }
    if (modified.present) {
      map['modified'] = Variable<DateTime>(modified.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductInScannedItemEntityCompanion(')
          ..write('id: $id, ')
          ..write('stockCountChange: $stockCountChange, ')
          ..write('modified: $modified')
          ..write(')'))
        .toString();
  }
}

class $ProductOutScannedItemEntityTable extends ProductOutScannedItemEntity
    with
        TableInfo<$ProductOutScannedItemEntityTable,
            ProductOutScannedItemEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductOutScannedItemEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _stockCountChangeMeta =
      const VerificationMeta('stockCountChange');
  @override
  late final GeneratedColumn<int> stockCountChange = GeneratedColumn<int>(
      'stock_count_change', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _modifiedMeta =
      const VerificationMeta('modified');
  @override
  late final GeneratedColumn<DateTime> modified = GeneratedColumn<DateTime>(
      'modified', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now().toUtc()));
  @override
  List<GeneratedColumn> get $columns => [id, stockCountChange, modified];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_out_scanned_item_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<ProductOutScannedItemEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('stock_count_change')) {
      context.handle(
          _stockCountChangeMeta,
          stockCountChange.isAcceptableOrUnknown(
              data['stock_count_change']!, _stockCountChangeMeta));
    } else if (isInserting) {
      context.missing(_stockCountChangeMeta);
    }
    if (data.containsKey('modified')) {
      context.handle(_modifiedMeta,
          modified.isAcceptableOrUnknown(data['modified']!, _modifiedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductOutScannedItemEntityData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductOutScannedItemEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      stockCountChange: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}stock_count_change'])!,
      modified: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}modified'])!,
    );
  }

  @override
  $ProductOutScannedItemEntityTable createAlias(String alias) {
    return $ProductOutScannedItemEntityTable(attachedDatabase, alias);
  }
}

class ProductOutScannedItemEntityData extends DataClass
    implements Insertable<ProductOutScannedItemEntityData> {
  final int id;
  final int stockCountChange;
  final DateTime modified;
  const ProductOutScannedItemEntityData(
      {required this.id,
      required this.stockCountChange,
      required this.modified});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['stock_count_change'] = Variable<int>(stockCountChange);
    map['modified'] = Variable<DateTime>(modified);
    return map;
  }

  ProductOutScannedItemEntityCompanion toCompanion(bool nullToAbsent) {
    return ProductOutScannedItemEntityCompanion(
      id: Value(id),
      stockCountChange: Value(stockCountChange),
      modified: Value(modified),
    );
  }

  factory ProductOutScannedItemEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductOutScannedItemEntityData(
      id: serializer.fromJson<int>(json['id']),
      stockCountChange: serializer.fromJson<int>(json['stockCountChange']),
      modified: serializer.fromJson<DateTime>(json['modified']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'stockCountChange': serializer.toJson<int>(stockCountChange),
      'modified': serializer.toJson<DateTime>(modified),
    };
  }

  ProductOutScannedItemEntityData copyWith(
          {int? id, int? stockCountChange, DateTime? modified}) =>
      ProductOutScannedItemEntityData(
        id: id ?? this.id,
        stockCountChange: stockCountChange ?? this.stockCountChange,
        modified: modified ?? this.modified,
      );
  @override
  String toString() {
    return (StringBuffer('ProductOutScannedItemEntityData(')
          ..write('id: $id, ')
          ..write('stockCountChange: $stockCountChange, ')
          ..write('modified: $modified')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, stockCountChange, modified);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductOutScannedItemEntityData &&
          other.id == this.id &&
          other.stockCountChange == this.stockCountChange &&
          other.modified == this.modified);
}

class ProductOutScannedItemEntityCompanion
    extends UpdateCompanion<ProductOutScannedItemEntityData> {
  final Value<int> id;
  final Value<int> stockCountChange;
  final Value<DateTime> modified;
  const ProductOutScannedItemEntityCompanion({
    this.id = const Value.absent(),
    this.stockCountChange = const Value.absent(),
    this.modified = const Value.absent(),
  });
  ProductOutScannedItemEntityCompanion.insert({
    this.id = const Value.absent(),
    required int stockCountChange,
    this.modified = const Value.absent(),
  }) : stockCountChange = Value(stockCountChange);
  static Insertable<ProductOutScannedItemEntityData> custom({
    Expression<int>? id,
    Expression<int>? stockCountChange,
    Expression<DateTime>? modified,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (stockCountChange != null) 'stock_count_change': stockCountChange,
      if (modified != null) 'modified': modified,
    });
  }

  ProductOutScannedItemEntityCompanion copyWith(
      {Value<int>? id,
      Value<int>? stockCountChange,
      Value<DateTime>? modified}) {
    return ProductOutScannedItemEntityCompanion(
      id: id ?? this.id,
      stockCountChange: stockCountChange ?? this.stockCountChange,
      modified: modified ?? this.modified,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (stockCountChange.present) {
      map['stock_count_change'] = Variable<int>(stockCountChange.value);
    }
    if (modified.present) {
      map['modified'] = Variable<DateTime>(modified.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductOutScannedItemEntityCompanion(')
          ..write('id: $id, ')
          ..write('stockCountChange: $stockCountChange, ')
          ..write('modified: $modified')
          ..write(')'))
        .toString();
  }
}

class $ProductCountScannedItemEntityTable extends ProductCountScannedItemEntity
    with
        TableInfo<$ProductCountScannedItemEntityTable,
            ProductCountScannedItemEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductCountScannedItemEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _stockCountChangeMeta =
      const VerificationMeta('stockCountChange');
  @override
  late final GeneratedColumn<int> stockCountChange = GeneratedColumn<int>(
      'stock_count_change', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _modifiedMeta =
      const VerificationMeta('modified');
  @override
  late final GeneratedColumn<DateTime> modified = GeneratedColumn<DateTime>(
      'modified', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now().toUtc()));
  @override
  List<GeneratedColumn> get $columns => [id, stockCountChange, modified];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_count_scanned_item_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<ProductCountScannedItemEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('stock_count_change')) {
      context.handle(
          _stockCountChangeMeta,
          stockCountChange.isAcceptableOrUnknown(
              data['stock_count_change']!, _stockCountChangeMeta));
    } else if (isInserting) {
      context.missing(_stockCountChangeMeta);
    }
    if (data.containsKey('modified')) {
      context.handle(_modifiedMeta,
          modified.isAcceptableOrUnknown(data['modified']!, _modifiedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductCountScannedItemEntityData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductCountScannedItemEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      stockCountChange: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}stock_count_change'])!,
      modified: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}modified'])!,
    );
  }

  @override
  $ProductCountScannedItemEntityTable createAlias(String alias) {
    return $ProductCountScannedItemEntityTable(attachedDatabase, alias);
  }
}

class ProductCountScannedItemEntityData extends DataClass
    implements Insertable<ProductCountScannedItemEntityData> {
  final int id;
  final int stockCountChange;
  final DateTime modified;
  const ProductCountScannedItemEntityData(
      {required this.id,
      required this.stockCountChange,
      required this.modified});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['stock_count_change'] = Variable<int>(stockCountChange);
    map['modified'] = Variable<DateTime>(modified);
    return map;
  }

  ProductCountScannedItemEntityCompanion toCompanion(bool nullToAbsent) {
    return ProductCountScannedItemEntityCompanion(
      id: Value(id),
      stockCountChange: Value(stockCountChange),
      modified: Value(modified),
    );
  }

  factory ProductCountScannedItemEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductCountScannedItemEntityData(
      id: serializer.fromJson<int>(json['id']),
      stockCountChange: serializer.fromJson<int>(json['stockCountChange']),
      modified: serializer.fromJson<DateTime>(json['modified']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'stockCountChange': serializer.toJson<int>(stockCountChange),
      'modified': serializer.toJson<DateTime>(modified),
    };
  }

  ProductCountScannedItemEntityData copyWith(
          {int? id, int? stockCountChange, DateTime? modified}) =>
      ProductCountScannedItemEntityData(
        id: id ?? this.id,
        stockCountChange: stockCountChange ?? this.stockCountChange,
        modified: modified ?? this.modified,
      );
  @override
  String toString() {
    return (StringBuffer('ProductCountScannedItemEntityData(')
          ..write('id: $id, ')
          ..write('stockCountChange: $stockCountChange, ')
          ..write('modified: $modified')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, stockCountChange, modified);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductCountScannedItemEntityData &&
          other.id == this.id &&
          other.stockCountChange == this.stockCountChange &&
          other.modified == this.modified);
}

class ProductCountScannedItemEntityCompanion
    extends UpdateCompanion<ProductCountScannedItemEntityData> {
  final Value<int> id;
  final Value<int> stockCountChange;
  final Value<DateTime> modified;
  const ProductCountScannedItemEntityCompanion({
    this.id = const Value.absent(),
    this.stockCountChange = const Value.absent(),
    this.modified = const Value.absent(),
  });
  ProductCountScannedItemEntityCompanion.insert({
    this.id = const Value.absent(),
    required int stockCountChange,
    this.modified = const Value.absent(),
  }) : stockCountChange = Value(stockCountChange);
  static Insertable<ProductCountScannedItemEntityData> custom({
    Expression<int>? id,
    Expression<int>? stockCountChange,
    Expression<DateTime>? modified,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (stockCountChange != null) 'stock_count_change': stockCountChange,
      if (modified != null) 'modified': modified,
    });
  }

  ProductCountScannedItemEntityCompanion copyWith(
      {Value<int>? id,
      Value<int>? stockCountChange,
      Value<DateTime>? modified}) {
    return ProductCountScannedItemEntityCompanion(
      id: id ?? this.id,
      stockCountChange: stockCountChange ?? this.stockCountChange,
      modified: modified ?? this.modified,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (stockCountChange.present) {
      map['stock_count_change'] = Variable<int>(stockCountChange.value);
    }
    if (modified.present) {
      map['modified'] = Variable<DateTime>(modified.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductCountScannedItemEntityCompanion(')
          ..write('id: $id, ')
          ..write('stockCountChange: $stockCountChange, ')
          ..write('modified: $modified')
          ..write(')'))
        .toString();
  }
}

class $ShoppingCartEntityTable extends ShoppingCartEntity
    with TableInfo<$ShoppingCartEntityTable, ShoppingCartEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShoppingCartEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _inventoryIdMeta =
      const VerificationMeta('inventoryId');
  @override
  late final GeneratedColumn<int> inventoryId = GeneratedColumn<int>(
      'inventory_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _productMeta =
      const VerificationMeta('product');
  @override
  late final GeneratedColumn<String> product = GeneratedColumn<String>(
      'product', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _modifiedMeta =
      const VerificationMeta('modified');
  @override
  late final GeneratedColumn<DateTime> modified = GeneratedColumn<DateTime>(
      'modified', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now().toUtc()));
  @override
  List<GeneratedColumn> get $columns =>
      [id, inventoryId, product, quantity, modified];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shopping_cart_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<ShoppingCartEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('inventory_id')) {
      context.handle(
          _inventoryIdMeta,
          inventoryId.isAcceptableOrUnknown(
              data['inventory_id']!, _inventoryIdMeta));
    } else if (isInserting) {
      context.missing(_inventoryIdMeta);
    }
    if (data.containsKey('product')) {
      context.handle(_productMeta,
          product.isAcceptableOrUnknown(data['product']!, _productMeta));
    } else if (isInserting) {
      context.missing(_productMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('modified')) {
      context.handle(_modifiedMeta,
          modified.isAcceptableOrUnknown(data['modified']!, _modifiedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShoppingCartEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShoppingCartEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      inventoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}inventory_id'])!,
      product: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      modified: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}modified'])!,
    );
  }

  @override
  $ShoppingCartEntityTable createAlias(String alias) {
    return $ShoppingCartEntityTable(attachedDatabase, alias);
  }
}

class ShoppingCartEntityData extends DataClass
    implements Insertable<ShoppingCartEntityData> {
  final int id;
  final int inventoryId;
  final String product;
  final int quantity;
  final DateTime modified;
  const ShoppingCartEntityData(
      {required this.id,
      required this.inventoryId,
      required this.product,
      required this.quantity,
      required this.modified});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['inventory_id'] = Variable<int>(inventoryId);
    map['product'] = Variable<String>(product);
    map['quantity'] = Variable<int>(quantity);
    map['modified'] = Variable<DateTime>(modified);
    return map;
  }

  ShoppingCartEntityCompanion toCompanion(bool nullToAbsent) {
    return ShoppingCartEntityCompanion(
      id: Value(id),
      inventoryId: Value(inventoryId),
      product: Value(product),
      quantity: Value(quantity),
      modified: Value(modified),
    );
  }

  factory ShoppingCartEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShoppingCartEntityData(
      id: serializer.fromJson<int>(json['id']),
      inventoryId: serializer.fromJson<int>(json['inventoryId']),
      product: serializer.fromJson<String>(json['product']),
      quantity: serializer.fromJson<int>(json['quantity']),
      modified: serializer.fromJson<DateTime>(json['modified']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'inventoryId': serializer.toJson<int>(inventoryId),
      'product': serializer.toJson<String>(product),
      'quantity': serializer.toJson<int>(quantity),
      'modified': serializer.toJson<DateTime>(modified),
    };
  }

  ShoppingCartEntityData copyWith(
          {int? id,
          int? inventoryId,
          String? product,
          int? quantity,
          DateTime? modified}) =>
      ShoppingCartEntityData(
        id: id ?? this.id,
        inventoryId: inventoryId ?? this.inventoryId,
        product: product ?? this.product,
        quantity: quantity ?? this.quantity,
        modified: modified ?? this.modified,
      );
  @override
  String toString() {
    return (StringBuffer('ShoppingCartEntityData(')
          ..write('id: $id, ')
          ..write('inventoryId: $inventoryId, ')
          ..write('product: $product, ')
          ..write('quantity: $quantity, ')
          ..write('modified: $modified')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, inventoryId, product, quantity, modified);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShoppingCartEntityData &&
          other.id == this.id &&
          other.inventoryId == this.inventoryId &&
          other.product == this.product &&
          other.quantity == this.quantity &&
          other.modified == this.modified);
}

class ShoppingCartEntityCompanion
    extends UpdateCompanion<ShoppingCartEntityData> {
  final Value<int> id;
  final Value<int> inventoryId;
  final Value<String> product;
  final Value<int> quantity;
  final Value<DateTime> modified;
  const ShoppingCartEntityCompanion({
    this.id = const Value.absent(),
    this.inventoryId = const Value.absent(),
    this.product = const Value.absent(),
    this.quantity = const Value.absent(),
    this.modified = const Value.absent(),
  });
  ShoppingCartEntityCompanion.insert({
    this.id = const Value.absent(),
    required int inventoryId,
    required String product,
    required int quantity,
    this.modified = const Value.absent(),
  })  : inventoryId = Value(inventoryId),
        product = Value(product),
        quantity = Value(quantity);
  static Insertable<ShoppingCartEntityData> custom({
    Expression<int>? id,
    Expression<int>? inventoryId,
    Expression<String>? product,
    Expression<int>? quantity,
    Expression<DateTime>? modified,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (inventoryId != null) 'inventory_id': inventoryId,
      if (product != null) 'product': product,
      if (quantity != null) 'quantity': quantity,
      if (modified != null) 'modified': modified,
    });
  }

  ShoppingCartEntityCompanion copyWith(
      {Value<int>? id,
      Value<int>? inventoryId,
      Value<String>? product,
      Value<int>? quantity,
      Value<DateTime>? modified}) {
    return ShoppingCartEntityCompanion(
      id: id ?? this.id,
      inventoryId: inventoryId ?? this.inventoryId,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      modified: modified ?? this.modified,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (inventoryId.present) {
      map['inventory_id'] = Variable<int>(inventoryId.value);
    }
    if (product.present) {
      map['product'] = Variable<String>(product.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (modified.present) {
      map['modified'] = Variable<DateTime>(modified.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShoppingCartEntityCompanion(')
          ..write('id: $id, ')
          ..write('inventoryId: $inventoryId, ')
          ..write('product: $product, ')
          ..write('quantity: $quantity, ')
          ..write('modified: $modified')
          ..write(')'))
        .toString();
  }
}

class $ShoppingCartChangesEntityTable extends ShoppingCartChangesEntity
    with
        TableInfo<$ShoppingCartChangesEntityTable,
            ShoppingCartChangesEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShoppingCartChangesEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _quantityChangeMeta =
      const VerificationMeta('quantityChange');
  @override
  late final GeneratedColumn<int> quantityChange = GeneratedColumn<int>(
      'quantity_change', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _modifiedMeta =
      const VerificationMeta('modified');
  @override
  late final GeneratedColumn<DateTime> modified = GeneratedColumn<DateTime>(
      'modified', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now().toUtc()));
  @override
  List<GeneratedColumn> get $columns => [id, quantityChange, modified];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shopping_cart_changes_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<ShoppingCartChangesEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('quantity_change')) {
      context.handle(
          _quantityChangeMeta,
          quantityChange.isAcceptableOrUnknown(
              data['quantity_change']!, _quantityChangeMeta));
    } else if (isInserting) {
      context.missing(_quantityChangeMeta);
    }
    if (data.containsKey('modified')) {
      context.handle(_modifiedMeta,
          modified.isAcceptableOrUnknown(data['modified']!, _modifiedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShoppingCartChangesEntityData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShoppingCartChangesEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      quantityChange: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity_change'])!,
      modified: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}modified'])!,
    );
  }

  @override
  $ShoppingCartChangesEntityTable createAlias(String alias) {
    return $ShoppingCartChangesEntityTable(attachedDatabase, alias);
  }
}

class ShoppingCartChangesEntityData extends DataClass
    implements Insertable<ShoppingCartChangesEntityData> {
  final int id;
  final int quantityChange;
  final DateTime modified;
  const ShoppingCartChangesEntityData(
      {required this.id, required this.quantityChange, required this.modified});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['quantity_change'] = Variable<int>(quantityChange);
    map['modified'] = Variable<DateTime>(modified);
    return map;
  }

  ShoppingCartChangesEntityCompanion toCompanion(bool nullToAbsent) {
    return ShoppingCartChangesEntityCompanion(
      id: Value(id),
      quantityChange: Value(quantityChange),
      modified: Value(modified),
    );
  }

  factory ShoppingCartChangesEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShoppingCartChangesEntityData(
      id: serializer.fromJson<int>(json['id']),
      quantityChange: serializer.fromJson<int>(json['quantityChange']),
      modified: serializer.fromJson<DateTime>(json['modified']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'quantityChange': serializer.toJson<int>(quantityChange),
      'modified': serializer.toJson<DateTime>(modified),
    };
  }

  ShoppingCartChangesEntityData copyWith(
          {int? id, int? quantityChange, DateTime? modified}) =>
      ShoppingCartChangesEntityData(
        id: id ?? this.id,
        quantityChange: quantityChange ?? this.quantityChange,
        modified: modified ?? this.modified,
      );
  @override
  String toString() {
    return (StringBuffer('ShoppingCartChangesEntityData(')
          ..write('id: $id, ')
          ..write('quantityChange: $quantityChange, ')
          ..write('modified: $modified')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, quantityChange, modified);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShoppingCartChangesEntityData &&
          other.id == this.id &&
          other.quantityChange == this.quantityChange &&
          other.modified == this.modified);
}

class ShoppingCartChangesEntityCompanion
    extends UpdateCompanion<ShoppingCartChangesEntityData> {
  final Value<int> id;
  final Value<int> quantityChange;
  final Value<DateTime> modified;
  const ShoppingCartChangesEntityCompanion({
    this.id = const Value.absent(),
    this.quantityChange = const Value.absent(),
    this.modified = const Value.absent(),
  });
  ShoppingCartChangesEntityCompanion.insert({
    this.id = const Value.absent(),
    required int quantityChange,
    this.modified = const Value.absent(),
  }) : quantityChange = Value(quantityChange);
  static Insertable<ShoppingCartChangesEntityData> custom({
    Expression<int>? id,
    Expression<int>? quantityChange,
    Expression<DateTime>? modified,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (quantityChange != null) 'quantity_change': quantityChange,
      if (modified != null) 'modified': modified,
    });
  }

  ShoppingCartChangesEntityCompanion copyWith(
      {Value<int>? id, Value<int>? quantityChange, Value<DateTime>? modified}) {
    return ShoppingCartChangesEntityCompanion(
      id: id ?? this.id,
      quantityChange: quantityChange ?? this.quantityChange,
      modified: modified ?? this.modified,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (quantityChange.present) {
      map['quantity_change'] = Variable<int>(quantityChange.value);
    }
    if (modified.present) {
      map['modified'] = Variable<DateTime>(modified.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShoppingCartChangesEntityCompanion(')
          ..write('id: $id, ')
          ..write('quantityChange: $quantityChange, ')
          ..write('modified: $modified')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $InventoryEntityTable inventoryEntity =
      $InventoryEntityTable(this);
  late final $InventoryChangesEntityTable inventoryChangesEntity =
      $InventoryChangesEntityTable(this);
  late final $DeletedInventoryEntityTable deletedInventoryEntity =
      $DeletedInventoryEntityTable(this);
  late final $ProductInScannedItemEntityTable productInScannedItemEntity =
      $ProductInScannedItemEntityTable(this);
  late final $ProductOutScannedItemEntityTable productOutScannedItemEntity =
      $ProductOutScannedItemEntityTable(this);
  late final $ProductCountScannedItemEntityTable productCountScannedItemEntity =
      $ProductCountScannedItemEntityTable(this);
  late final $ShoppingCartEntityTable shoppingCartEntity =
      $ShoppingCartEntityTable(this);
  late final $ShoppingCartChangesEntityTable shoppingCartChangesEntity =
      $ShoppingCartChangesEntityTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        inventoryEntity,
        inventoryChangesEntity,
        deletedInventoryEntity,
        productInScannedItemEntity,
        productOutScannedItemEntity,
        productCountScannedItemEntity,
        shoppingCartEntity,
        shoppingCartChangesEntity
      ];
}

typedef $$InventoryEntityTableInsertCompanionBuilder = InventoryEntityCompanion
    Function({
  Value<int> id,
  required String itemId,
  required String productName,
  required String product,
  required String connectedCartItem,
  required int maxCount,
  required int minCount,
  required int stockCount,
  required int fixedSuggestion,
  required int inventory,
  Value<DateTime> created,
  Value<DateTime> modified,
});
typedef $$InventoryEntityTableUpdateCompanionBuilder = InventoryEntityCompanion
    Function({
  Value<int> id,
  Value<String> itemId,
  Value<String> productName,
  Value<String> product,
  Value<String> connectedCartItem,
  Value<int> maxCount,
  Value<int> minCount,
  Value<int> stockCount,
  Value<int> fixedSuggestion,
  Value<int> inventory,
  Value<DateTime> created,
  Value<DateTime> modified,
});

class $$InventoryEntityTableTableManager extends RootTableManager<
    _$AppDatabase,
    $InventoryEntityTable,
    InventoryEntityData,
    $$InventoryEntityTableFilterComposer,
    $$InventoryEntityTableOrderingComposer,
    $$InventoryEntityTableProcessedTableManager,
    $$InventoryEntityTableInsertCompanionBuilder,
    $$InventoryEntityTableUpdateCompanionBuilder> {
  $$InventoryEntityTableTableManager(
      _$AppDatabase db, $InventoryEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$InventoryEntityTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$InventoryEntityTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$InventoryEntityTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> itemId = const Value.absent(),
            Value<String> productName = const Value.absent(),
            Value<String> product = const Value.absent(),
            Value<String> connectedCartItem = const Value.absent(),
            Value<int> maxCount = const Value.absent(),
            Value<int> minCount = const Value.absent(),
            Value<int> stockCount = const Value.absent(),
            Value<int> fixedSuggestion = const Value.absent(),
            Value<int> inventory = const Value.absent(),
            Value<DateTime> created = const Value.absent(),
            Value<DateTime> modified = const Value.absent(),
          }) =>
              InventoryEntityCompanion(
            id: id,
            itemId: itemId,
            productName: productName,
            product: product,
            connectedCartItem: connectedCartItem,
            maxCount: maxCount,
            minCount: minCount,
            stockCount: stockCount,
            fixedSuggestion: fixedSuggestion,
            inventory: inventory,
            created: created,
            modified: modified,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String itemId,
            required String productName,
            required String product,
            required String connectedCartItem,
            required int maxCount,
            required int minCount,
            required int stockCount,
            required int fixedSuggestion,
            required int inventory,
            Value<DateTime> created = const Value.absent(),
            Value<DateTime> modified = const Value.absent(),
          }) =>
              InventoryEntityCompanion.insert(
            id: id,
            itemId: itemId,
            productName: productName,
            product: product,
            connectedCartItem: connectedCartItem,
            maxCount: maxCount,
            minCount: minCount,
            stockCount: stockCount,
            fixedSuggestion: fixedSuggestion,
            inventory: inventory,
            created: created,
            modified: modified,
          ),
        ));
}

class $$InventoryEntityTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $InventoryEntityTable,
    InventoryEntityData,
    $$InventoryEntityTableFilterComposer,
    $$InventoryEntityTableOrderingComposer,
    $$InventoryEntityTableProcessedTableManager,
    $$InventoryEntityTableInsertCompanionBuilder,
    $$InventoryEntityTableUpdateCompanionBuilder> {
  $$InventoryEntityTableProcessedTableManager(super.$state);
}

class $$InventoryEntityTableFilterComposer
    extends FilterComposer<_$AppDatabase, $InventoryEntityTable> {
  $$InventoryEntityTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get itemId => $state.composableBuilder(
      column: $state.table.itemId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get productName => $state.composableBuilder(
      column: $state.table.productName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get product => $state.composableBuilder(
      column: $state.table.product,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get connectedCartItem => $state.composableBuilder(
      column: $state.table.connectedCartItem,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get maxCount => $state.composableBuilder(
      column: $state.table.maxCount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get minCount => $state.composableBuilder(
      column: $state.table.minCount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get stockCount => $state.composableBuilder(
      column: $state.table.stockCount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get fixedSuggestion => $state.composableBuilder(
      column: $state.table.fixedSuggestion,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get inventory => $state.composableBuilder(
      column: $state.table.inventory,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get created => $state.composableBuilder(
      column: $state.table.created,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get modified => $state.composableBuilder(
      column: $state.table.modified,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$InventoryEntityTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $InventoryEntityTable> {
  $$InventoryEntityTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get itemId => $state.composableBuilder(
      column: $state.table.itemId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get productName => $state.composableBuilder(
      column: $state.table.productName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get product => $state.composableBuilder(
      column: $state.table.product,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get connectedCartItem => $state.composableBuilder(
      column: $state.table.connectedCartItem,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get maxCount => $state.composableBuilder(
      column: $state.table.maxCount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get minCount => $state.composableBuilder(
      column: $state.table.minCount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get stockCount => $state.composableBuilder(
      column: $state.table.stockCount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get fixedSuggestion => $state.composableBuilder(
      column: $state.table.fixedSuggestion,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get inventory => $state.composableBuilder(
      column: $state.table.inventory,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get created => $state.composableBuilder(
      column: $state.table.created,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get modified => $state.composableBuilder(
      column: $state.table.modified,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$InventoryChangesEntityTableInsertCompanionBuilder
    = InventoryChangesEntityCompanion Function({
  Value<int> id,
  required String itemId,
  Value<int?> maxCount,
  Value<int?> minCount,
  Value<int> stockCountChange,
  Value<int?> fixedSuggestion,
  Value<DateTime> modified,
});
typedef $$InventoryChangesEntityTableUpdateCompanionBuilder
    = InventoryChangesEntityCompanion Function({
  Value<int> id,
  Value<String> itemId,
  Value<int?> maxCount,
  Value<int?> minCount,
  Value<int> stockCountChange,
  Value<int?> fixedSuggestion,
  Value<DateTime> modified,
});

class $$InventoryChangesEntityTableTableManager extends RootTableManager<
    _$AppDatabase,
    $InventoryChangesEntityTable,
    InventoryChangesEntityData,
    $$InventoryChangesEntityTableFilterComposer,
    $$InventoryChangesEntityTableOrderingComposer,
    $$InventoryChangesEntityTableProcessedTableManager,
    $$InventoryChangesEntityTableInsertCompanionBuilder,
    $$InventoryChangesEntityTableUpdateCompanionBuilder> {
  $$InventoryChangesEntityTableTableManager(
      _$AppDatabase db, $InventoryChangesEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$InventoryChangesEntityTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$InventoryChangesEntityTableOrderingComposer(
              ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$InventoryChangesEntityTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> itemId = const Value.absent(),
            Value<int?> maxCount = const Value.absent(),
            Value<int?> minCount = const Value.absent(),
            Value<int> stockCountChange = const Value.absent(),
            Value<int?> fixedSuggestion = const Value.absent(),
            Value<DateTime> modified = const Value.absent(),
          }) =>
              InventoryChangesEntityCompanion(
            id: id,
            itemId: itemId,
            maxCount: maxCount,
            minCount: minCount,
            stockCountChange: stockCountChange,
            fixedSuggestion: fixedSuggestion,
            modified: modified,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String itemId,
            Value<int?> maxCount = const Value.absent(),
            Value<int?> minCount = const Value.absent(),
            Value<int> stockCountChange = const Value.absent(),
            Value<int?> fixedSuggestion = const Value.absent(),
            Value<DateTime> modified = const Value.absent(),
          }) =>
              InventoryChangesEntityCompanion.insert(
            id: id,
            itemId: itemId,
            maxCount: maxCount,
            minCount: minCount,
            stockCountChange: stockCountChange,
            fixedSuggestion: fixedSuggestion,
            modified: modified,
          ),
        ));
}

class $$InventoryChangesEntityTableProcessedTableManager
    extends ProcessedTableManager<
        _$AppDatabase,
        $InventoryChangesEntityTable,
        InventoryChangesEntityData,
        $$InventoryChangesEntityTableFilterComposer,
        $$InventoryChangesEntityTableOrderingComposer,
        $$InventoryChangesEntityTableProcessedTableManager,
        $$InventoryChangesEntityTableInsertCompanionBuilder,
        $$InventoryChangesEntityTableUpdateCompanionBuilder> {
  $$InventoryChangesEntityTableProcessedTableManager(super.$state);
}

class $$InventoryChangesEntityTableFilterComposer
    extends FilterComposer<_$AppDatabase, $InventoryChangesEntityTable> {
  $$InventoryChangesEntityTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get itemId => $state.composableBuilder(
      column: $state.table.itemId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get maxCount => $state.composableBuilder(
      column: $state.table.maxCount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get minCount => $state.composableBuilder(
      column: $state.table.minCount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get stockCountChange => $state.composableBuilder(
      column: $state.table.stockCountChange,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get fixedSuggestion => $state.composableBuilder(
      column: $state.table.fixedSuggestion,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get modified => $state.composableBuilder(
      column: $state.table.modified,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$InventoryChangesEntityTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $InventoryChangesEntityTable> {
  $$InventoryChangesEntityTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get itemId => $state.composableBuilder(
      column: $state.table.itemId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get maxCount => $state.composableBuilder(
      column: $state.table.maxCount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get minCount => $state.composableBuilder(
      column: $state.table.minCount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get stockCountChange => $state.composableBuilder(
      column: $state.table.stockCountChange,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get fixedSuggestion => $state.composableBuilder(
      column: $state.table.fixedSuggestion,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get modified => $state.composableBuilder(
      column: $state.table.modified,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$DeletedInventoryEntityTableInsertCompanionBuilder
    = DeletedInventoryEntityCompanion Function({
  Value<int> id,
});
typedef $$DeletedInventoryEntityTableUpdateCompanionBuilder
    = DeletedInventoryEntityCompanion Function({
  Value<int> id,
});

class $$DeletedInventoryEntityTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DeletedInventoryEntityTable,
    DeletedInventoryEntityData,
    $$DeletedInventoryEntityTableFilterComposer,
    $$DeletedInventoryEntityTableOrderingComposer,
    $$DeletedInventoryEntityTableProcessedTableManager,
    $$DeletedInventoryEntityTableInsertCompanionBuilder,
    $$DeletedInventoryEntityTableUpdateCompanionBuilder> {
  $$DeletedInventoryEntityTableTableManager(
      _$AppDatabase db, $DeletedInventoryEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$DeletedInventoryEntityTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$DeletedInventoryEntityTableOrderingComposer(
              ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$DeletedInventoryEntityTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
          }) =>
              DeletedInventoryEntityCompanion(
            id: id,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
          }) =>
              DeletedInventoryEntityCompanion.insert(
            id: id,
          ),
        ));
}

class $$DeletedInventoryEntityTableProcessedTableManager
    extends ProcessedTableManager<
        _$AppDatabase,
        $DeletedInventoryEntityTable,
        DeletedInventoryEntityData,
        $$DeletedInventoryEntityTableFilterComposer,
        $$DeletedInventoryEntityTableOrderingComposer,
        $$DeletedInventoryEntityTableProcessedTableManager,
        $$DeletedInventoryEntityTableInsertCompanionBuilder,
        $$DeletedInventoryEntityTableUpdateCompanionBuilder> {
  $$DeletedInventoryEntityTableProcessedTableManager(super.$state);
}

class $$DeletedInventoryEntityTableFilterComposer
    extends FilterComposer<_$AppDatabase, $DeletedInventoryEntityTable> {
  $$DeletedInventoryEntityTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$DeletedInventoryEntityTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $DeletedInventoryEntityTable> {
  $$DeletedInventoryEntityTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ProductInScannedItemEntityTableInsertCompanionBuilder
    = ProductInScannedItemEntityCompanion Function({
  Value<int> id,
  required int stockCountChange,
  Value<DateTime> modified,
});
typedef $$ProductInScannedItemEntityTableUpdateCompanionBuilder
    = ProductInScannedItemEntityCompanion Function({
  Value<int> id,
  Value<int> stockCountChange,
  Value<DateTime> modified,
});

class $$ProductInScannedItemEntityTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductInScannedItemEntityTable,
    ProductInScannedItemEntityData,
    $$ProductInScannedItemEntityTableFilterComposer,
    $$ProductInScannedItemEntityTableOrderingComposer,
    $$ProductInScannedItemEntityTableProcessedTableManager,
    $$ProductInScannedItemEntityTableInsertCompanionBuilder,
    $$ProductInScannedItemEntityTableUpdateCompanionBuilder> {
  $$ProductInScannedItemEntityTableTableManager(
      _$AppDatabase db, $ProductInScannedItemEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$ProductInScannedItemEntityTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$ProductInScannedItemEntityTableOrderingComposer(
              ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$ProductInScannedItemEntityTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> stockCountChange = const Value.absent(),
            Value<DateTime> modified = const Value.absent(),
          }) =>
              ProductInScannedItemEntityCompanion(
            id: id,
            stockCountChange: stockCountChange,
            modified: modified,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int stockCountChange,
            Value<DateTime> modified = const Value.absent(),
          }) =>
              ProductInScannedItemEntityCompanion.insert(
            id: id,
            stockCountChange: stockCountChange,
            modified: modified,
          ),
        ));
}

class $$ProductInScannedItemEntityTableProcessedTableManager
    extends ProcessedTableManager<
        _$AppDatabase,
        $ProductInScannedItemEntityTable,
        ProductInScannedItemEntityData,
        $$ProductInScannedItemEntityTableFilterComposer,
        $$ProductInScannedItemEntityTableOrderingComposer,
        $$ProductInScannedItemEntityTableProcessedTableManager,
        $$ProductInScannedItemEntityTableInsertCompanionBuilder,
        $$ProductInScannedItemEntityTableUpdateCompanionBuilder> {
  $$ProductInScannedItemEntityTableProcessedTableManager(super.$state);
}

class $$ProductInScannedItemEntityTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ProductInScannedItemEntityTable> {
  $$ProductInScannedItemEntityTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get stockCountChange => $state.composableBuilder(
      column: $state.table.stockCountChange,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get modified => $state.composableBuilder(
      column: $state.table.modified,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ProductInScannedItemEntityTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ProductInScannedItemEntityTable> {
  $$ProductInScannedItemEntityTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get stockCountChange => $state.composableBuilder(
      column: $state.table.stockCountChange,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get modified => $state.composableBuilder(
      column: $state.table.modified,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ProductOutScannedItemEntityTableInsertCompanionBuilder
    = ProductOutScannedItemEntityCompanion Function({
  Value<int> id,
  required int stockCountChange,
  Value<DateTime> modified,
});
typedef $$ProductOutScannedItemEntityTableUpdateCompanionBuilder
    = ProductOutScannedItemEntityCompanion Function({
  Value<int> id,
  Value<int> stockCountChange,
  Value<DateTime> modified,
});

class $$ProductOutScannedItemEntityTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductOutScannedItemEntityTable,
    ProductOutScannedItemEntityData,
    $$ProductOutScannedItemEntityTableFilterComposer,
    $$ProductOutScannedItemEntityTableOrderingComposer,
    $$ProductOutScannedItemEntityTableProcessedTableManager,
    $$ProductOutScannedItemEntityTableInsertCompanionBuilder,
    $$ProductOutScannedItemEntityTableUpdateCompanionBuilder> {
  $$ProductOutScannedItemEntityTableTableManager(
      _$AppDatabase db, $ProductOutScannedItemEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$ProductOutScannedItemEntityTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$ProductOutScannedItemEntityTableOrderingComposer(
              ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$ProductOutScannedItemEntityTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> stockCountChange = const Value.absent(),
            Value<DateTime> modified = const Value.absent(),
          }) =>
              ProductOutScannedItemEntityCompanion(
            id: id,
            stockCountChange: stockCountChange,
            modified: modified,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int stockCountChange,
            Value<DateTime> modified = const Value.absent(),
          }) =>
              ProductOutScannedItemEntityCompanion.insert(
            id: id,
            stockCountChange: stockCountChange,
            modified: modified,
          ),
        ));
}

class $$ProductOutScannedItemEntityTableProcessedTableManager
    extends ProcessedTableManager<
        _$AppDatabase,
        $ProductOutScannedItemEntityTable,
        ProductOutScannedItemEntityData,
        $$ProductOutScannedItemEntityTableFilterComposer,
        $$ProductOutScannedItemEntityTableOrderingComposer,
        $$ProductOutScannedItemEntityTableProcessedTableManager,
        $$ProductOutScannedItemEntityTableInsertCompanionBuilder,
        $$ProductOutScannedItemEntityTableUpdateCompanionBuilder> {
  $$ProductOutScannedItemEntityTableProcessedTableManager(super.$state);
}

class $$ProductOutScannedItemEntityTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ProductOutScannedItemEntityTable> {
  $$ProductOutScannedItemEntityTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get stockCountChange => $state.composableBuilder(
      column: $state.table.stockCountChange,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get modified => $state.composableBuilder(
      column: $state.table.modified,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ProductOutScannedItemEntityTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ProductOutScannedItemEntityTable> {
  $$ProductOutScannedItemEntityTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get stockCountChange => $state.composableBuilder(
      column: $state.table.stockCountChange,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get modified => $state.composableBuilder(
      column: $state.table.modified,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ProductCountScannedItemEntityTableInsertCompanionBuilder
    = ProductCountScannedItemEntityCompanion Function({
  Value<int> id,
  required int stockCountChange,
  Value<DateTime> modified,
});
typedef $$ProductCountScannedItemEntityTableUpdateCompanionBuilder
    = ProductCountScannedItemEntityCompanion Function({
  Value<int> id,
  Value<int> stockCountChange,
  Value<DateTime> modified,
});

class $$ProductCountScannedItemEntityTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductCountScannedItemEntityTable,
    ProductCountScannedItemEntityData,
    $$ProductCountScannedItemEntityTableFilterComposer,
    $$ProductCountScannedItemEntityTableOrderingComposer,
    $$ProductCountScannedItemEntityTableProcessedTableManager,
    $$ProductCountScannedItemEntityTableInsertCompanionBuilder,
    $$ProductCountScannedItemEntityTableUpdateCompanionBuilder> {
  $$ProductCountScannedItemEntityTableTableManager(
      _$AppDatabase db, $ProductCountScannedItemEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$ProductCountScannedItemEntityTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer:
              $$ProductCountScannedItemEntityTableOrderingComposer(
                  ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$ProductCountScannedItemEntityTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> stockCountChange = const Value.absent(),
            Value<DateTime> modified = const Value.absent(),
          }) =>
              ProductCountScannedItemEntityCompanion(
            id: id,
            stockCountChange: stockCountChange,
            modified: modified,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int stockCountChange,
            Value<DateTime> modified = const Value.absent(),
          }) =>
              ProductCountScannedItemEntityCompanion.insert(
            id: id,
            stockCountChange: stockCountChange,
            modified: modified,
          ),
        ));
}

class $$ProductCountScannedItemEntityTableProcessedTableManager
    extends ProcessedTableManager<
        _$AppDatabase,
        $ProductCountScannedItemEntityTable,
        ProductCountScannedItemEntityData,
        $$ProductCountScannedItemEntityTableFilterComposer,
        $$ProductCountScannedItemEntityTableOrderingComposer,
        $$ProductCountScannedItemEntityTableProcessedTableManager,
        $$ProductCountScannedItemEntityTableInsertCompanionBuilder,
        $$ProductCountScannedItemEntityTableUpdateCompanionBuilder> {
  $$ProductCountScannedItemEntityTableProcessedTableManager(super.$state);
}

class $$ProductCountScannedItemEntityTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ProductCountScannedItemEntityTable> {
  $$ProductCountScannedItemEntityTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get stockCountChange => $state.composableBuilder(
      column: $state.table.stockCountChange,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get modified => $state.composableBuilder(
      column: $state.table.modified,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ProductCountScannedItemEntityTableOrderingComposer
    extends OrderingComposer<_$AppDatabase,
        $ProductCountScannedItemEntityTable> {
  $$ProductCountScannedItemEntityTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get stockCountChange => $state.composableBuilder(
      column: $state.table.stockCountChange,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get modified => $state.composableBuilder(
      column: $state.table.modified,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ShoppingCartEntityTableInsertCompanionBuilder
    = ShoppingCartEntityCompanion Function({
  Value<int> id,
  required int inventoryId,
  required String product,
  required int quantity,
  Value<DateTime> modified,
});
typedef $$ShoppingCartEntityTableUpdateCompanionBuilder
    = ShoppingCartEntityCompanion Function({
  Value<int> id,
  Value<int> inventoryId,
  Value<String> product,
  Value<int> quantity,
  Value<DateTime> modified,
});

class $$ShoppingCartEntityTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ShoppingCartEntityTable,
    ShoppingCartEntityData,
    $$ShoppingCartEntityTableFilterComposer,
    $$ShoppingCartEntityTableOrderingComposer,
    $$ShoppingCartEntityTableProcessedTableManager,
    $$ShoppingCartEntityTableInsertCompanionBuilder,
    $$ShoppingCartEntityTableUpdateCompanionBuilder> {
  $$ShoppingCartEntityTableTableManager(
      _$AppDatabase db, $ShoppingCartEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ShoppingCartEntityTableFilterComposer(ComposerState(db, table)),
          orderingComposer: $$ShoppingCartEntityTableOrderingComposer(
              ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$ShoppingCartEntityTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> inventoryId = const Value.absent(),
            Value<String> product = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<DateTime> modified = const Value.absent(),
          }) =>
              ShoppingCartEntityCompanion(
            id: id,
            inventoryId: inventoryId,
            product: product,
            quantity: quantity,
            modified: modified,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int inventoryId,
            required String product,
            required int quantity,
            Value<DateTime> modified = const Value.absent(),
          }) =>
              ShoppingCartEntityCompanion.insert(
            id: id,
            inventoryId: inventoryId,
            product: product,
            quantity: quantity,
            modified: modified,
          ),
        ));
}

class $$ShoppingCartEntityTableProcessedTableManager
    extends ProcessedTableManager<
        _$AppDatabase,
        $ShoppingCartEntityTable,
        ShoppingCartEntityData,
        $$ShoppingCartEntityTableFilterComposer,
        $$ShoppingCartEntityTableOrderingComposer,
        $$ShoppingCartEntityTableProcessedTableManager,
        $$ShoppingCartEntityTableInsertCompanionBuilder,
        $$ShoppingCartEntityTableUpdateCompanionBuilder> {
  $$ShoppingCartEntityTableProcessedTableManager(super.$state);
}

class $$ShoppingCartEntityTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ShoppingCartEntityTable> {
  $$ShoppingCartEntityTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get inventoryId => $state.composableBuilder(
      column: $state.table.inventoryId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get product => $state.composableBuilder(
      column: $state.table.product,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get quantity => $state.composableBuilder(
      column: $state.table.quantity,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get modified => $state.composableBuilder(
      column: $state.table.modified,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ShoppingCartEntityTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ShoppingCartEntityTable> {
  $$ShoppingCartEntityTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get inventoryId => $state.composableBuilder(
      column: $state.table.inventoryId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get product => $state.composableBuilder(
      column: $state.table.product,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get quantity => $state.composableBuilder(
      column: $state.table.quantity,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get modified => $state.composableBuilder(
      column: $state.table.modified,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ShoppingCartChangesEntityTableInsertCompanionBuilder
    = ShoppingCartChangesEntityCompanion Function({
  Value<int> id,
  required int quantityChange,
  Value<DateTime> modified,
});
typedef $$ShoppingCartChangesEntityTableUpdateCompanionBuilder
    = ShoppingCartChangesEntityCompanion Function({
  Value<int> id,
  Value<int> quantityChange,
  Value<DateTime> modified,
});

class $$ShoppingCartChangesEntityTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ShoppingCartChangesEntityTable,
    ShoppingCartChangesEntityData,
    $$ShoppingCartChangesEntityTableFilterComposer,
    $$ShoppingCartChangesEntityTableOrderingComposer,
    $$ShoppingCartChangesEntityTableProcessedTableManager,
    $$ShoppingCartChangesEntityTableInsertCompanionBuilder,
    $$ShoppingCartChangesEntityTableUpdateCompanionBuilder> {
  $$ShoppingCartChangesEntityTableTableManager(
      _$AppDatabase db, $ShoppingCartChangesEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$ShoppingCartChangesEntityTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$ShoppingCartChangesEntityTableOrderingComposer(
              ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$ShoppingCartChangesEntityTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> quantityChange = const Value.absent(),
            Value<DateTime> modified = const Value.absent(),
          }) =>
              ShoppingCartChangesEntityCompanion(
            id: id,
            quantityChange: quantityChange,
            modified: modified,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int quantityChange,
            Value<DateTime> modified = const Value.absent(),
          }) =>
              ShoppingCartChangesEntityCompanion.insert(
            id: id,
            quantityChange: quantityChange,
            modified: modified,
          ),
        ));
}

class $$ShoppingCartChangesEntityTableProcessedTableManager
    extends ProcessedTableManager<
        _$AppDatabase,
        $ShoppingCartChangesEntityTable,
        ShoppingCartChangesEntityData,
        $$ShoppingCartChangesEntityTableFilterComposer,
        $$ShoppingCartChangesEntityTableOrderingComposer,
        $$ShoppingCartChangesEntityTableProcessedTableManager,
        $$ShoppingCartChangesEntityTableInsertCompanionBuilder,
        $$ShoppingCartChangesEntityTableUpdateCompanionBuilder> {
  $$ShoppingCartChangesEntityTableProcessedTableManager(super.$state);
}

class $$ShoppingCartChangesEntityTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ShoppingCartChangesEntityTable> {
  $$ShoppingCartChangesEntityTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get quantityChange => $state.composableBuilder(
      column: $state.table.quantityChange,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get modified => $state.composableBuilder(
      column: $state.table.modified,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ShoppingCartChangesEntityTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ShoppingCartChangesEntityTable> {
  $$ShoppingCartChangesEntityTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get quantityChange => $state.composableBuilder(
      column: $state.table.quantityChange,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get modified => $state.composableBuilder(
      column: $state.table.modified,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$InventoryEntityTableTableManager get inventoryEntity =>
      $$InventoryEntityTableTableManager(_db, _db.inventoryEntity);
  $$InventoryChangesEntityTableTableManager get inventoryChangesEntity =>
      $$InventoryChangesEntityTableTableManager(
          _db, _db.inventoryChangesEntity);
  $$DeletedInventoryEntityTableTableManager get deletedInventoryEntity =>
      $$DeletedInventoryEntityTableTableManager(
          _db, _db.deletedInventoryEntity);
  $$ProductInScannedItemEntityTableTableManager
      get productInScannedItemEntity =>
          $$ProductInScannedItemEntityTableTableManager(
              _db, _db.productInScannedItemEntity);
  $$ProductOutScannedItemEntityTableTableManager
      get productOutScannedItemEntity =>
          $$ProductOutScannedItemEntityTableTableManager(
              _db, _db.productOutScannedItemEntity);
  $$ProductCountScannedItemEntityTableTableManager
      get productCountScannedItemEntity =>
          $$ProductCountScannedItemEntityTableTableManager(
              _db, _db.productCountScannedItemEntity);
  $$ShoppingCartEntityTableTableManager get shoppingCartEntity =>
      $$ShoppingCartEntityTableTableManager(_db, _db.shoppingCartEntity);
  $$ShoppingCartChangesEntityTableTableManager get shoppingCartChangesEntity =>
      $$ShoppingCartChangesEntityTableTableManager(
          _db, _db.shoppingCartChangesEntity);
}
