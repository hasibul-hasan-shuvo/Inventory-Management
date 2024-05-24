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
  late final GeneratedColumn<String> created = GeneratedColumn<String>(
      'created', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdMilliSecondMeta =
      const VerificationMeta('createdMilliSecond');
  @override
  late final GeneratedColumn<int> createdMilliSecond = GeneratedColumn<int>(
      'created_milli_second', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _modifiedMeta =
      const VerificationMeta('modified');
  @override
  late final GeneratedColumn<String> modified = GeneratedColumn<String>(
      'modified', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _modifiedMilliSecondMeta =
      const VerificationMeta('modifiedMilliSecond');
  @override
  late final GeneratedColumn<int> modifiedMilliSecond = GeneratedColumn<int>(
      'modified_milli_second', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        product,
        connectedCartItem,
        maxCount,
        minCount,
        stockCount,
        fixedSuggestion,
        inventory,
        created,
        createdMilliSecond,
        modified,
        modifiedMilliSecond
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
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('created_milli_second')) {
      context.handle(
          _createdMilliSecondMeta,
          createdMilliSecond.isAcceptableOrUnknown(
              data['created_milli_second']!, _createdMilliSecondMeta));
    } else if (isInserting) {
      context.missing(_createdMilliSecondMeta);
    }
    if (data.containsKey('modified')) {
      context.handle(_modifiedMeta,
          modified.isAcceptableOrUnknown(data['modified']!, _modifiedMeta));
    } else if (isInserting) {
      context.missing(_modifiedMeta);
    }
    if (data.containsKey('modified_milli_second')) {
      context.handle(
          _modifiedMilliSecondMeta,
          modifiedMilliSecond.isAcceptableOrUnknown(
              data['modified_milli_second']!, _modifiedMilliSecondMeta));
    } else if (isInserting) {
      context.missing(_modifiedMilliSecondMeta);
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
          .read(DriftSqlType.string, data['${effectivePrefix}created'])!,
      createdMilliSecond: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}created_milli_second'])!,
      modified: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}modified'])!,
      modifiedMilliSecond: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}modified_milli_second'])!,
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
  final String product;
  final String connectedCartItem;
  final int maxCount;
  final int minCount;
  final int stockCount;
  final int fixedSuggestion;
  final int inventory;
  final String created;
  final int createdMilliSecond;
  final String modified;
  final int modifiedMilliSecond;
  const InventoryEntityData(
      {required this.id,
      required this.product,
      required this.connectedCartItem,
      required this.maxCount,
      required this.minCount,
      required this.stockCount,
      required this.fixedSuggestion,
      required this.inventory,
      required this.created,
      required this.createdMilliSecond,
      required this.modified,
      required this.modifiedMilliSecond});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product'] = Variable<String>(product);
    map['connected_cart_item'] = Variable<String>(connectedCartItem);
    map['max_count'] = Variable<int>(maxCount);
    map['min_count'] = Variable<int>(minCount);
    map['stock_count'] = Variable<int>(stockCount);
    map['fixed_suggestion'] = Variable<int>(fixedSuggestion);
    map['inventory'] = Variable<int>(inventory);
    map['created'] = Variable<String>(created);
    map['created_milli_second'] = Variable<int>(createdMilliSecond);
    map['modified'] = Variable<String>(modified);
    map['modified_milli_second'] = Variable<int>(modifiedMilliSecond);
    return map;
  }

  InventoryEntityCompanion toCompanion(bool nullToAbsent) {
    return InventoryEntityCompanion(
      id: Value(id),
      product: Value(product),
      connectedCartItem: Value(connectedCartItem),
      maxCount: Value(maxCount),
      minCount: Value(minCount),
      stockCount: Value(stockCount),
      fixedSuggestion: Value(fixedSuggestion),
      inventory: Value(inventory),
      created: Value(created),
      createdMilliSecond: Value(createdMilliSecond),
      modified: Value(modified),
      modifiedMilliSecond: Value(modifiedMilliSecond),
    );
  }

  factory InventoryEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InventoryEntityData(
      id: serializer.fromJson<int>(json['id']),
      product: serializer.fromJson<String>(json['product']),
      connectedCartItem: serializer.fromJson<String>(json['connectedCartItem']),
      maxCount: serializer.fromJson<int>(json['maxCount']),
      minCount: serializer.fromJson<int>(json['minCount']),
      stockCount: serializer.fromJson<int>(json['stockCount']),
      fixedSuggestion: serializer.fromJson<int>(json['fixedSuggestion']),
      inventory: serializer.fromJson<int>(json['inventory']),
      created: serializer.fromJson<String>(json['created']),
      createdMilliSecond: serializer.fromJson<int>(json['createdMilliSecond']),
      modified: serializer.fromJson<String>(json['modified']),
      modifiedMilliSecond:
          serializer.fromJson<int>(json['modifiedMilliSecond']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'product': serializer.toJson<String>(product),
      'connectedCartItem': serializer.toJson<String>(connectedCartItem),
      'maxCount': serializer.toJson<int>(maxCount),
      'minCount': serializer.toJson<int>(minCount),
      'stockCount': serializer.toJson<int>(stockCount),
      'fixedSuggestion': serializer.toJson<int>(fixedSuggestion),
      'inventory': serializer.toJson<int>(inventory),
      'created': serializer.toJson<String>(created),
      'createdMilliSecond': serializer.toJson<int>(createdMilliSecond),
      'modified': serializer.toJson<String>(modified),
      'modifiedMilliSecond': serializer.toJson<int>(modifiedMilliSecond),
    };
  }

  InventoryEntityData copyWith(
          {int? id,
          String? product,
          String? connectedCartItem,
          int? maxCount,
          int? minCount,
          int? stockCount,
          int? fixedSuggestion,
          int? inventory,
          String? created,
          int? createdMilliSecond,
          String? modified,
          int? modifiedMilliSecond}) =>
      InventoryEntityData(
        id: id ?? this.id,
        product: product ?? this.product,
        connectedCartItem: connectedCartItem ?? this.connectedCartItem,
        maxCount: maxCount ?? this.maxCount,
        minCount: minCount ?? this.minCount,
        stockCount: stockCount ?? this.stockCount,
        fixedSuggestion: fixedSuggestion ?? this.fixedSuggestion,
        inventory: inventory ?? this.inventory,
        created: created ?? this.created,
        createdMilliSecond: createdMilliSecond ?? this.createdMilliSecond,
        modified: modified ?? this.modified,
        modifiedMilliSecond: modifiedMilliSecond ?? this.modifiedMilliSecond,
      );
  @override
  String toString() {
    return (StringBuffer('InventoryEntityData(')
          ..write('id: $id, ')
          ..write('product: $product, ')
          ..write('connectedCartItem: $connectedCartItem, ')
          ..write('maxCount: $maxCount, ')
          ..write('minCount: $minCount, ')
          ..write('stockCount: $stockCount, ')
          ..write('fixedSuggestion: $fixedSuggestion, ')
          ..write('inventory: $inventory, ')
          ..write('created: $created, ')
          ..write('createdMilliSecond: $createdMilliSecond, ')
          ..write('modified: $modified, ')
          ..write('modifiedMilliSecond: $modifiedMilliSecond')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      product,
      connectedCartItem,
      maxCount,
      minCount,
      stockCount,
      fixedSuggestion,
      inventory,
      created,
      createdMilliSecond,
      modified,
      modifiedMilliSecond);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InventoryEntityData &&
          other.id == this.id &&
          other.product == this.product &&
          other.connectedCartItem == this.connectedCartItem &&
          other.maxCount == this.maxCount &&
          other.minCount == this.minCount &&
          other.stockCount == this.stockCount &&
          other.fixedSuggestion == this.fixedSuggestion &&
          other.inventory == this.inventory &&
          other.created == this.created &&
          other.createdMilliSecond == this.createdMilliSecond &&
          other.modified == this.modified &&
          other.modifiedMilliSecond == this.modifiedMilliSecond);
}

class InventoryEntityCompanion extends UpdateCompanion<InventoryEntityData> {
  final Value<int> id;
  final Value<String> product;
  final Value<String> connectedCartItem;
  final Value<int> maxCount;
  final Value<int> minCount;
  final Value<int> stockCount;
  final Value<int> fixedSuggestion;
  final Value<int> inventory;
  final Value<String> created;
  final Value<int> createdMilliSecond;
  final Value<String> modified;
  final Value<int> modifiedMilliSecond;
  const InventoryEntityCompanion({
    this.id = const Value.absent(),
    this.product = const Value.absent(),
    this.connectedCartItem = const Value.absent(),
    this.maxCount = const Value.absent(),
    this.minCount = const Value.absent(),
    this.stockCount = const Value.absent(),
    this.fixedSuggestion = const Value.absent(),
    this.inventory = const Value.absent(),
    this.created = const Value.absent(),
    this.createdMilliSecond = const Value.absent(),
    this.modified = const Value.absent(),
    this.modifiedMilliSecond = const Value.absent(),
  });
  InventoryEntityCompanion.insert({
    this.id = const Value.absent(),
    required String product,
    required String connectedCartItem,
    required int maxCount,
    required int minCount,
    required int stockCount,
    required int fixedSuggestion,
    required int inventory,
    required String created,
    required int createdMilliSecond,
    required String modified,
    required int modifiedMilliSecond,
  })  : product = Value(product),
        connectedCartItem = Value(connectedCartItem),
        maxCount = Value(maxCount),
        minCount = Value(minCount),
        stockCount = Value(stockCount),
        fixedSuggestion = Value(fixedSuggestion),
        inventory = Value(inventory),
        created = Value(created),
        createdMilliSecond = Value(createdMilliSecond),
        modified = Value(modified),
        modifiedMilliSecond = Value(modifiedMilliSecond);
  static Insertable<InventoryEntityData> custom({
    Expression<int>? id,
    Expression<String>? product,
    Expression<String>? connectedCartItem,
    Expression<int>? maxCount,
    Expression<int>? minCount,
    Expression<int>? stockCount,
    Expression<int>? fixedSuggestion,
    Expression<int>? inventory,
    Expression<String>? created,
    Expression<int>? createdMilliSecond,
    Expression<String>? modified,
    Expression<int>? modifiedMilliSecond,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (product != null) 'product': product,
      if (connectedCartItem != null) 'connected_cart_item': connectedCartItem,
      if (maxCount != null) 'max_count': maxCount,
      if (minCount != null) 'min_count': minCount,
      if (stockCount != null) 'stock_count': stockCount,
      if (fixedSuggestion != null) 'fixed_suggestion': fixedSuggestion,
      if (inventory != null) 'inventory': inventory,
      if (created != null) 'created': created,
      if (createdMilliSecond != null)
        'created_milli_second': createdMilliSecond,
      if (modified != null) 'modified': modified,
      if (modifiedMilliSecond != null)
        'modified_milli_second': modifiedMilliSecond,
    });
  }

  InventoryEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? product,
      Value<String>? connectedCartItem,
      Value<int>? maxCount,
      Value<int>? minCount,
      Value<int>? stockCount,
      Value<int>? fixedSuggestion,
      Value<int>? inventory,
      Value<String>? created,
      Value<int>? createdMilliSecond,
      Value<String>? modified,
      Value<int>? modifiedMilliSecond}) {
    return InventoryEntityCompanion(
      id: id ?? this.id,
      product: product ?? this.product,
      connectedCartItem: connectedCartItem ?? this.connectedCartItem,
      maxCount: maxCount ?? this.maxCount,
      minCount: minCount ?? this.minCount,
      stockCount: stockCount ?? this.stockCount,
      fixedSuggestion: fixedSuggestion ?? this.fixedSuggestion,
      inventory: inventory ?? this.inventory,
      created: created ?? this.created,
      createdMilliSecond: createdMilliSecond ?? this.createdMilliSecond,
      modified: modified ?? this.modified,
      modifiedMilliSecond: modifiedMilliSecond ?? this.modifiedMilliSecond,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
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
      map['created'] = Variable<String>(created.value);
    }
    if (createdMilliSecond.present) {
      map['created_milli_second'] = Variable<int>(createdMilliSecond.value);
    }
    if (modified.present) {
      map['modified'] = Variable<String>(modified.value);
    }
    if (modifiedMilliSecond.present) {
      map['modified_milli_second'] = Variable<int>(modifiedMilliSecond.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventoryEntityCompanion(')
          ..write('id: $id, ')
          ..write('product: $product, ')
          ..write('connectedCartItem: $connectedCartItem, ')
          ..write('maxCount: $maxCount, ')
          ..write('minCount: $minCount, ')
          ..write('stockCount: $stockCount, ')
          ..write('fixedSuggestion: $fixedSuggestion, ')
          ..write('inventory: $inventory, ')
          ..write('created: $created, ')
          ..write('createdMilliSecond: $createdMilliSecond, ')
          ..write('modified: $modified, ')
          ..write('modifiedMilliSecond: $modifiedMilliSecond')
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
  static const VerificationMeta _stockCountChangeMeta =
      const VerificationMeta('stockCountChange');
  @override
  late final GeneratedColumn<int> stockCountChange = GeneratedColumn<int>(
      'stock_count_change', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _fixedSuggestionMeta =
      const VerificationMeta('fixedSuggestion');
  @override
  late final GeneratedColumn<int> fixedSuggestion = GeneratedColumn<int>(
      'fixed_suggestion', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _modifiedMeta =
      const VerificationMeta('modified');
  @override
  late final GeneratedColumn<String> modified = GeneratedColumn<String>(
      'modified', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _modifiedMilliSecondMeta =
      const VerificationMeta('modifiedMilliSecond');
  @override
  late final GeneratedColumn<int> modifiedMilliSecond = GeneratedColumn<int>(
      'modified_milli_second', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        maxCount,
        minCount,
        stockCountChange,
        fixedSuggestion,
        modified,
        modifiedMilliSecond
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
    if (data.containsKey('stock_count_change')) {
      context.handle(
          _stockCountChangeMeta,
          stockCountChange.isAcceptableOrUnknown(
              data['stock_count_change']!, _stockCountChangeMeta));
    } else if (isInserting) {
      context.missing(_stockCountChangeMeta);
    }
    if (data.containsKey('fixed_suggestion')) {
      context.handle(
          _fixedSuggestionMeta,
          fixedSuggestion.isAcceptableOrUnknown(
              data['fixed_suggestion']!, _fixedSuggestionMeta));
    } else if (isInserting) {
      context.missing(_fixedSuggestionMeta);
    }
    if (data.containsKey('modified')) {
      context.handle(_modifiedMeta,
          modified.isAcceptableOrUnknown(data['modified']!, _modifiedMeta));
    } else if (isInserting) {
      context.missing(_modifiedMeta);
    }
    if (data.containsKey('modified_milli_second')) {
      context.handle(
          _modifiedMilliSecondMeta,
          modifiedMilliSecond.isAcceptableOrUnknown(
              data['modified_milli_second']!, _modifiedMilliSecondMeta));
    } else if (isInserting) {
      context.missing(_modifiedMilliSecondMeta);
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
      maxCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_count'])!,
      minCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}min_count'])!,
      stockCountChange: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}stock_count_change'])!,
      fixedSuggestion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}fixed_suggestion'])!,
      modified: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}modified'])!,
      modifiedMilliSecond: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}modified_milli_second'])!,
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
  final int maxCount;
  final int minCount;
  final int stockCountChange;
  final int fixedSuggestion;
  final String modified;
  final int modifiedMilliSecond;
  const InventoryChangesEntityData(
      {required this.id,
      required this.maxCount,
      required this.minCount,
      required this.stockCountChange,
      required this.fixedSuggestion,
      required this.modified,
      required this.modifiedMilliSecond});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['max_count'] = Variable<int>(maxCount);
    map['min_count'] = Variable<int>(minCount);
    map['stock_count_change'] = Variable<int>(stockCountChange);
    map['fixed_suggestion'] = Variable<int>(fixedSuggestion);
    map['modified'] = Variable<String>(modified);
    map['modified_milli_second'] = Variable<int>(modifiedMilliSecond);
    return map;
  }

  InventoryChangesEntityCompanion toCompanion(bool nullToAbsent) {
    return InventoryChangesEntityCompanion(
      id: Value(id),
      maxCount: Value(maxCount),
      minCount: Value(minCount),
      stockCountChange: Value(stockCountChange),
      fixedSuggestion: Value(fixedSuggestion),
      modified: Value(modified),
      modifiedMilliSecond: Value(modifiedMilliSecond),
    );
  }

  factory InventoryChangesEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InventoryChangesEntityData(
      id: serializer.fromJson<int>(json['id']),
      maxCount: serializer.fromJson<int>(json['maxCount']),
      minCount: serializer.fromJson<int>(json['minCount']),
      stockCountChange: serializer.fromJson<int>(json['stockCountChange']),
      fixedSuggestion: serializer.fromJson<int>(json['fixedSuggestion']),
      modified: serializer.fromJson<String>(json['modified']),
      modifiedMilliSecond:
          serializer.fromJson<int>(json['modifiedMilliSecond']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'maxCount': serializer.toJson<int>(maxCount),
      'minCount': serializer.toJson<int>(minCount),
      'stockCountChange': serializer.toJson<int>(stockCountChange),
      'fixedSuggestion': serializer.toJson<int>(fixedSuggestion),
      'modified': serializer.toJson<String>(modified),
      'modifiedMilliSecond': serializer.toJson<int>(modifiedMilliSecond),
    };
  }

  InventoryChangesEntityData copyWith(
          {int? id,
          int? maxCount,
          int? minCount,
          int? stockCountChange,
          int? fixedSuggestion,
          String? modified,
          int? modifiedMilliSecond}) =>
      InventoryChangesEntityData(
        id: id ?? this.id,
        maxCount: maxCount ?? this.maxCount,
        minCount: minCount ?? this.minCount,
        stockCountChange: stockCountChange ?? this.stockCountChange,
        fixedSuggestion: fixedSuggestion ?? this.fixedSuggestion,
        modified: modified ?? this.modified,
        modifiedMilliSecond: modifiedMilliSecond ?? this.modifiedMilliSecond,
      );
  @override
  String toString() {
    return (StringBuffer('InventoryChangesEntityData(')
          ..write('id: $id, ')
          ..write('maxCount: $maxCount, ')
          ..write('minCount: $minCount, ')
          ..write('stockCountChange: $stockCountChange, ')
          ..write('fixedSuggestion: $fixedSuggestion, ')
          ..write('modified: $modified, ')
          ..write('modifiedMilliSecond: $modifiedMilliSecond')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, maxCount, minCount, stockCountChange,
      fixedSuggestion, modified, modifiedMilliSecond);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InventoryChangesEntityData &&
          other.id == this.id &&
          other.maxCount == this.maxCount &&
          other.minCount == this.minCount &&
          other.stockCountChange == this.stockCountChange &&
          other.fixedSuggestion == this.fixedSuggestion &&
          other.modified == this.modified &&
          other.modifiedMilliSecond == this.modifiedMilliSecond);
}

class InventoryChangesEntityCompanion
    extends UpdateCompanion<InventoryChangesEntityData> {
  final Value<int> id;
  final Value<int> maxCount;
  final Value<int> minCount;
  final Value<int> stockCountChange;
  final Value<int> fixedSuggestion;
  final Value<String> modified;
  final Value<int> modifiedMilliSecond;
  const InventoryChangesEntityCompanion({
    this.id = const Value.absent(),
    this.maxCount = const Value.absent(),
    this.minCount = const Value.absent(),
    this.stockCountChange = const Value.absent(),
    this.fixedSuggestion = const Value.absent(),
    this.modified = const Value.absent(),
    this.modifiedMilliSecond = const Value.absent(),
  });
  InventoryChangesEntityCompanion.insert({
    this.id = const Value.absent(),
    required int maxCount,
    required int minCount,
    required int stockCountChange,
    required int fixedSuggestion,
    required String modified,
    required int modifiedMilliSecond,
  })  : maxCount = Value(maxCount),
        minCount = Value(minCount),
        stockCountChange = Value(stockCountChange),
        fixedSuggestion = Value(fixedSuggestion),
        modified = Value(modified),
        modifiedMilliSecond = Value(modifiedMilliSecond);
  static Insertable<InventoryChangesEntityData> custom({
    Expression<int>? id,
    Expression<int>? maxCount,
    Expression<int>? minCount,
    Expression<int>? stockCountChange,
    Expression<int>? fixedSuggestion,
    Expression<String>? modified,
    Expression<int>? modifiedMilliSecond,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (maxCount != null) 'max_count': maxCount,
      if (minCount != null) 'min_count': minCount,
      if (stockCountChange != null) 'stock_count_change': stockCountChange,
      if (fixedSuggestion != null) 'fixed_suggestion': fixedSuggestion,
      if (modified != null) 'modified': modified,
      if (modifiedMilliSecond != null)
        'modified_milli_second': modifiedMilliSecond,
    });
  }

  InventoryChangesEntityCompanion copyWith(
      {Value<int>? id,
      Value<int>? maxCount,
      Value<int>? minCount,
      Value<int>? stockCountChange,
      Value<int>? fixedSuggestion,
      Value<String>? modified,
      Value<int>? modifiedMilliSecond}) {
    return InventoryChangesEntityCompanion(
      id: id ?? this.id,
      maxCount: maxCount ?? this.maxCount,
      minCount: minCount ?? this.minCount,
      stockCountChange: stockCountChange ?? this.stockCountChange,
      fixedSuggestion: fixedSuggestion ?? this.fixedSuggestion,
      modified: modified ?? this.modified,
      modifiedMilliSecond: modifiedMilliSecond ?? this.modifiedMilliSecond,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
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
      map['modified'] = Variable<String>(modified.value);
    }
    if (modifiedMilliSecond.present) {
      map['modified_milli_second'] = Variable<int>(modifiedMilliSecond.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventoryChangesEntityCompanion(')
          ..write('id: $id, ')
          ..write('maxCount: $maxCount, ')
          ..write('minCount: $minCount, ')
          ..write('stockCountChange: $stockCountChange, ')
          ..write('fixedSuggestion: $fixedSuggestion, ')
          ..write('modified: $modified, ')
          ..write('modifiedMilliSecond: $modifiedMilliSecond')
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
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [inventoryEntity, inventoryChangesEntity];
}

typedef $$InventoryEntityTableInsertCompanionBuilder = InventoryEntityCompanion
    Function({
  Value<int> id,
  required String product,
  required String connectedCartItem,
  required int maxCount,
  required int minCount,
  required int stockCount,
  required int fixedSuggestion,
  required int inventory,
  required String created,
  required int createdMilliSecond,
  required String modified,
  required int modifiedMilliSecond,
});
typedef $$InventoryEntityTableUpdateCompanionBuilder = InventoryEntityCompanion
    Function({
  Value<int> id,
  Value<String> product,
  Value<String> connectedCartItem,
  Value<int> maxCount,
  Value<int> minCount,
  Value<int> stockCount,
  Value<int> fixedSuggestion,
  Value<int> inventory,
  Value<String> created,
  Value<int> createdMilliSecond,
  Value<String> modified,
  Value<int> modifiedMilliSecond,
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
            Value<String> product = const Value.absent(),
            Value<String> connectedCartItem = const Value.absent(),
            Value<int> maxCount = const Value.absent(),
            Value<int> minCount = const Value.absent(),
            Value<int> stockCount = const Value.absent(),
            Value<int> fixedSuggestion = const Value.absent(),
            Value<int> inventory = const Value.absent(),
            Value<String> created = const Value.absent(),
            Value<int> createdMilliSecond = const Value.absent(),
            Value<String> modified = const Value.absent(),
            Value<int> modifiedMilliSecond = const Value.absent(),
          }) =>
              InventoryEntityCompanion(
            id: id,
            product: product,
            connectedCartItem: connectedCartItem,
            maxCount: maxCount,
            minCount: minCount,
            stockCount: stockCount,
            fixedSuggestion: fixedSuggestion,
            inventory: inventory,
            created: created,
            createdMilliSecond: createdMilliSecond,
            modified: modified,
            modifiedMilliSecond: modifiedMilliSecond,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String product,
            required String connectedCartItem,
            required int maxCount,
            required int minCount,
            required int stockCount,
            required int fixedSuggestion,
            required int inventory,
            required String created,
            required int createdMilliSecond,
            required String modified,
            required int modifiedMilliSecond,
          }) =>
              InventoryEntityCompanion.insert(
            id: id,
            product: product,
            connectedCartItem: connectedCartItem,
            maxCount: maxCount,
            minCount: minCount,
            stockCount: stockCount,
            fixedSuggestion: fixedSuggestion,
            inventory: inventory,
            created: created,
            createdMilliSecond: createdMilliSecond,
            modified: modified,
            modifiedMilliSecond: modifiedMilliSecond,
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

  ColumnFilters<String> get created => $state.composableBuilder(
      column: $state.table.created,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get createdMilliSecond => $state.composableBuilder(
      column: $state.table.createdMilliSecond,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get modified => $state.composableBuilder(
      column: $state.table.modified,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get modifiedMilliSecond => $state.composableBuilder(
      column: $state.table.modifiedMilliSecond,
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

  ColumnOrderings<String> get created => $state.composableBuilder(
      column: $state.table.created,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get createdMilliSecond => $state.composableBuilder(
      column: $state.table.createdMilliSecond,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get modified => $state.composableBuilder(
      column: $state.table.modified,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get modifiedMilliSecond => $state.composableBuilder(
      column: $state.table.modifiedMilliSecond,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$InventoryChangesEntityTableInsertCompanionBuilder
    = InventoryChangesEntityCompanion Function({
  Value<int> id,
  required int maxCount,
  required int minCount,
  required int stockCountChange,
  required int fixedSuggestion,
  required String modified,
  required int modifiedMilliSecond,
});
typedef $$InventoryChangesEntityTableUpdateCompanionBuilder
    = InventoryChangesEntityCompanion Function({
  Value<int> id,
  Value<int> maxCount,
  Value<int> minCount,
  Value<int> stockCountChange,
  Value<int> fixedSuggestion,
  Value<String> modified,
  Value<int> modifiedMilliSecond,
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
            Value<int> maxCount = const Value.absent(),
            Value<int> minCount = const Value.absent(),
            Value<int> stockCountChange = const Value.absent(),
            Value<int> fixedSuggestion = const Value.absent(),
            Value<String> modified = const Value.absent(),
            Value<int> modifiedMilliSecond = const Value.absent(),
          }) =>
              InventoryChangesEntityCompanion(
            id: id,
            maxCount: maxCount,
            minCount: minCount,
            stockCountChange: stockCountChange,
            fixedSuggestion: fixedSuggestion,
            modified: modified,
            modifiedMilliSecond: modifiedMilliSecond,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int maxCount,
            required int minCount,
            required int stockCountChange,
            required int fixedSuggestion,
            required String modified,
            required int modifiedMilliSecond,
          }) =>
              InventoryChangesEntityCompanion.insert(
            id: id,
            maxCount: maxCount,
            minCount: minCount,
            stockCountChange: stockCountChange,
            fixedSuggestion: fixedSuggestion,
            modified: modified,
            modifiedMilliSecond: modifiedMilliSecond,
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

  ColumnFilters<String> get modified => $state.composableBuilder(
      column: $state.table.modified,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get modifiedMilliSecond => $state.composableBuilder(
      column: $state.table.modifiedMilliSecond,
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

  ColumnOrderings<String> get modified => $state.composableBuilder(
      column: $state.table.modified,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get modifiedMilliSecond => $state.composableBuilder(
      column: $state.table.modifiedMilliSecond,
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
}
