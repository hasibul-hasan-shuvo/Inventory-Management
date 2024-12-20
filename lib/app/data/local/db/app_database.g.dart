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
      'id', aliasedName, true,
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
  static const VerificationMeta _stockCountMeta =
      const VerificationMeta('stockCount');
  @override
  late final GeneratedColumn<int> stockCount = GeneratedColumn<int>(
      'stock_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _fixedSuggestionMeta =
      const VerificationMeta('fixedSuggestion');
  @override
  late final GeneratedColumn<int> fixedSuggestion = GeneratedColumn<int>(
      'fixed_suggestion', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _isAvailableMeta =
      const VerificationMeta('isAvailable');
  @override
  late final GeneratedColumn<bool> isAvailable = GeneratedColumn<bool>(
      'is_available', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_available" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _alternativeItemIdMeta =
      const VerificationMeta('alternativeItemId');
  @override
  late final GeneratedColumn<String> alternativeItemId =
      GeneratedColumn<String>('alternative_item_id', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
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
        maxCount,
        minCount,
        stockCount,
        fixedSuggestion,
        isAvailable,
        alternativeItemId,
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
    if (data.containsKey('max_count')) {
      context.handle(_maxCountMeta,
          maxCount.isAcceptableOrUnknown(data['max_count']!, _maxCountMeta));
    }
    if (data.containsKey('min_count')) {
      context.handle(_minCountMeta,
          minCount.isAcceptableOrUnknown(data['min_count']!, _minCountMeta));
    }
    if (data.containsKey('stock_count')) {
      context.handle(
          _stockCountMeta,
          stockCount.isAcceptableOrUnknown(
              data['stock_count']!, _stockCountMeta));
    }
    if (data.containsKey('fixed_suggestion')) {
      context.handle(
          _fixedSuggestionMeta,
          fixedSuggestion.isAcceptableOrUnknown(
              data['fixed_suggestion']!, _fixedSuggestionMeta));
    }
    if (data.containsKey('is_available')) {
      context.handle(
          _isAvailableMeta,
          isAvailable.isAcceptableOrUnknown(
              data['is_available']!, _isAvailableMeta));
    }
    if (data.containsKey('alternative_item_id')) {
      context.handle(
          _alternativeItemIdMeta,
          alternativeItemId.isAcceptableOrUnknown(
              data['alternative_item_id']!, _alternativeItemIdMeta));
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
  Set<GeneratedColumn> get $primaryKey => {itemId};
  @override
  InventoryEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InventoryEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      itemId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_id'])!,
      productName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_name'])!,
      product: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product'])!,
      maxCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_count']),
      minCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}min_count']),
      stockCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}stock_count'])!,
      fixedSuggestion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}fixed_suggestion']),
      isAvailable: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_available'])!,
      alternativeItemId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}alternative_item_id']),
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
  final int? id;
  final String itemId;
  final String productName;
  final String product;
  final int? maxCount;
  final int? minCount;
  final int stockCount;
  final int? fixedSuggestion;
  final bool isAvailable;
  final String? alternativeItemId;
  final DateTime created;
  final DateTime modified;
  const InventoryEntityData(
      {this.id,
      required this.itemId,
      required this.productName,
      required this.product,
      this.maxCount,
      this.minCount,
      required this.stockCount,
      this.fixedSuggestion,
      required this.isAvailable,
      this.alternativeItemId,
      required this.created,
      required this.modified});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['item_id'] = Variable<String>(itemId);
    map['product_name'] = Variable<String>(productName);
    map['product'] = Variable<String>(product);
    if (!nullToAbsent || maxCount != null) {
      map['max_count'] = Variable<int>(maxCount);
    }
    if (!nullToAbsent || minCount != null) {
      map['min_count'] = Variable<int>(minCount);
    }
    map['stock_count'] = Variable<int>(stockCount);
    if (!nullToAbsent || fixedSuggestion != null) {
      map['fixed_suggestion'] = Variable<int>(fixedSuggestion);
    }
    map['is_available'] = Variable<bool>(isAvailable);
    if (!nullToAbsent || alternativeItemId != null) {
      map['alternative_item_id'] = Variable<String>(alternativeItemId);
    }
    map['created'] = Variable<DateTime>(created);
    map['modified'] = Variable<DateTime>(modified);
    return map;
  }

  InventoryEntityCompanion toCompanion(bool nullToAbsent) {
    return InventoryEntityCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      itemId: Value(itemId),
      productName: Value(productName),
      product: Value(product),
      maxCount: maxCount == null && nullToAbsent
          ? const Value.absent()
          : Value(maxCount),
      minCount: minCount == null && nullToAbsent
          ? const Value.absent()
          : Value(minCount),
      stockCount: Value(stockCount),
      fixedSuggestion: fixedSuggestion == null && nullToAbsent
          ? const Value.absent()
          : Value(fixedSuggestion),
      isAvailable: Value(isAvailable),
      alternativeItemId: alternativeItemId == null && nullToAbsent
          ? const Value.absent()
          : Value(alternativeItemId),
      created: Value(created),
      modified: Value(modified),
    );
  }

  factory InventoryEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InventoryEntityData(
      id: serializer.fromJson<int?>(json['id']),
      itemId: serializer.fromJson<String>(json['itemId']),
      productName: serializer.fromJson<String>(json['productName']),
      product: serializer.fromJson<String>(json['product']),
      maxCount: serializer.fromJson<int?>(json['maxCount']),
      minCount: serializer.fromJson<int?>(json['minCount']),
      stockCount: serializer.fromJson<int>(json['stockCount']),
      fixedSuggestion: serializer.fromJson<int?>(json['fixedSuggestion']),
      isAvailable: serializer.fromJson<bool>(json['isAvailable']),
      alternativeItemId:
          serializer.fromJson<String?>(json['alternativeItemId']),
      created: serializer.fromJson<DateTime>(json['created']),
      modified: serializer.fromJson<DateTime>(json['modified']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'itemId': serializer.toJson<String>(itemId),
      'productName': serializer.toJson<String>(productName),
      'product': serializer.toJson<String>(product),
      'maxCount': serializer.toJson<int?>(maxCount),
      'minCount': serializer.toJson<int?>(minCount),
      'stockCount': serializer.toJson<int>(stockCount),
      'fixedSuggestion': serializer.toJson<int?>(fixedSuggestion),
      'isAvailable': serializer.toJson<bool>(isAvailable),
      'alternativeItemId': serializer.toJson<String?>(alternativeItemId),
      'created': serializer.toJson<DateTime>(created),
      'modified': serializer.toJson<DateTime>(modified),
    };
  }

  InventoryEntityData copyWith(
          {Value<int?> id = const Value.absent(),
          String? itemId,
          String? productName,
          String? product,
          Value<int?> maxCount = const Value.absent(),
          Value<int?> minCount = const Value.absent(),
          int? stockCount,
          Value<int?> fixedSuggestion = const Value.absent(),
          bool? isAvailable,
          Value<String?> alternativeItemId = const Value.absent(),
          DateTime? created,
          DateTime? modified}) =>
      InventoryEntityData(
        id: id.present ? id.value : this.id,
        itemId: itemId ?? this.itemId,
        productName: productName ?? this.productName,
        product: product ?? this.product,
        maxCount: maxCount.present ? maxCount.value : this.maxCount,
        minCount: minCount.present ? minCount.value : this.minCount,
        stockCount: stockCount ?? this.stockCount,
        fixedSuggestion: fixedSuggestion.present
            ? fixedSuggestion.value
            : this.fixedSuggestion,
        isAvailable: isAvailable ?? this.isAvailable,
        alternativeItemId: alternativeItemId.present
            ? alternativeItemId.value
            : this.alternativeItemId,
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
          ..write('maxCount: $maxCount, ')
          ..write('minCount: $minCount, ')
          ..write('stockCount: $stockCount, ')
          ..write('fixedSuggestion: $fixedSuggestion, ')
          ..write('isAvailable: $isAvailable, ')
          ..write('alternativeItemId: $alternativeItemId, ')
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
      maxCount,
      minCount,
      stockCount,
      fixedSuggestion,
      isAvailable,
      alternativeItemId,
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
          other.maxCount == this.maxCount &&
          other.minCount == this.minCount &&
          other.stockCount == this.stockCount &&
          other.fixedSuggestion == this.fixedSuggestion &&
          other.isAvailable == this.isAvailable &&
          other.alternativeItemId == this.alternativeItemId &&
          other.created == this.created &&
          other.modified == this.modified);
}

class InventoryEntityCompanion extends UpdateCompanion<InventoryEntityData> {
  final Value<int?> id;
  final Value<String> itemId;
  final Value<String> productName;
  final Value<String> product;
  final Value<int?> maxCount;
  final Value<int?> minCount;
  final Value<int> stockCount;
  final Value<int?> fixedSuggestion;
  final Value<bool> isAvailable;
  final Value<String?> alternativeItemId;
  final Value<DateTime> created;
  final Value<DateTime> modified;
  final Value<int> rowid;
  const InventoryEntityCompanion({
    this.id = const Value.absent(),
    this.itemId = const Value.absent(),
    this.productName = const Value.absent(),
    this.product = const Value.absent(),
    this.maxCount = const Value.absent(),
    this.minCount = const Value.absent(),
    this.stockCount = const Value.absent(),
    this.fixedSuggestion = const Value.absent(),
    this.isAvailable = const Value.absent(),
    this.alternativeItemId = const Value.absent(),
    this.created = const Value.absent(),
    this.modified = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InventoryEntityCompanion.insert({
    this.id = const Value.absent(),
    required String itemId,
    required String productName,
    required String product,
    this.maxCount = const Value.absent(),
    this.minCount = const Value.absent(),
    this.stockCount = const Value.absent(),
    this.fixedSuggestion = const Value.absent(),
    this.isAvailable = const Value.absent(),
    this.alternativeItemId = const Value.absent(),
    this.created = const Value.absent(),
    this.modified = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : itemId = Value(itemId),
        productName = Value(productName),
        product = Value(product);
  static Insertable<InventoryEntityData> custom({
    Expression<int>? id,
    Expression<String>? itemId,
    Expression<String>? productName,
    Expression<String>? product,
    Expression<int>? maxCount,
    Expression<int>? minCount,
    Expression<int>? stockCount,
    Expression<int>? fixedSuggestion,
    Expression<bool>? isAvailable,
    Expression<String>? alternativeItemId,
    Expression<DateTime>? created,
    Expression<DateTime>? modified,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemId != null) 'item_id': itemId,
      if (productName != null) 'product_name': productName,
      if (product != null) 'product': product,
      if (maxCount != null) 'max_count': maxCount,
      if (minCount != null) 'min_count': minCount,
      if (stockCount != null) 'stock_count': stockCount,
      if (fixedSuggestion != null) 'fixed_suggestion': fixedSuggestion,
      if (isAvailable != null) 'is_available': isAvailable,
      if (alternativeItemId != null) 'alternative_item_id': alternativeItemId,
      if (created != null) 'created': created,
      if (modified != null) 'modified': modified,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InventoryEntityCompanion copyWith(
      {Value<int?>? id,
      Value<String>? itemId,
      Value<String>? productName,
      Value<String>? product,
      Value<int?>? maxCount,
      Value<int?>? minCount,
      Value<int>? stockCount,
      Value<int?>? fixedSuggestion,
      Value<bool>? isAvailable,
      Value<String?>? alternativeItemId,
      Value<DateTime>? created,
      Value<DateTime>? modified,
      Value<int>? rowid}) {
    return InventoryEntityCompanion(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      productName: productName ?? this.productName,
      product: product ?? this.product,
      maxCount: maxCount ?? this.maxCount,
      minCount: minCount ?? this.minCount,
      stockCount: stockCount ?? this.stockCount,
      fixedSuggestion: fixedSuggestion ?? this.fixedSuggestion,
      isAvailable: isAvailable ?? this.isAvailable,
      alternativeItemId: alternativeItemId ?? this.alternativeItemId,
      created: created ?? this.created,
      modified: modified ?? this.modified,
      rowid: rowid ?? this.rowid,
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
    if (isAvailable.present) {
      map['is_available'] = Variable<bool>(isAvailable.value);
    }
    if (alternativeItemId.present) {
      map['alternative_item_id'] = Variable<String>(alternativeItemId.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (modified.present) {
      map['modified'] = Variable<DateTime>(modified.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
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
          ..write('maxCount: $maxCount, ')
          ..write('minCount: $minCount, ')
          ..write('stockCount: $stockCount, ')
          ..write('fixedSuggestion: $fixedSuggestion, ')
          ..write('isAvailable: $isAvailable, ')
          ..write('alternativeItemId: $alternativeItemId, ')
          ..write('created: $created, ')
          ..write('modified: $modified, ')
          ..write('rowid: $rowid')
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
      'id', aliasedName, true,
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
  static const VerificationMeta _replaceWithMeta =
      const VerificationMeta('replaceWith');
  @override
  late final GeneratedColumn<String> replaceWith = GeneratedColumn<String>(
      'replace_with', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        itemId,
        maxCount,
        minCount,
        stockCountChange,
        fixedSuggestion,
        modified,
        replaceWith
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
    if (data.containsKey('replace_with')) {
      context.handle(
          _replaceWithMeta,
          replaceWith.isAcceptableOrUnknown(
              data['replace_with']!, _replaceWithMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {itemId};
  @override
  InventoryChangesEntityData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InventoryChangesEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
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
      replaceWith: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}replace_with']),
    );
  }

  @override
  $InventoryChangesEntityTable createAlias(String alias) {
    return $InventoryChangesEntityTable(attachedDatabase, alias);
  }
}

class InventoryChangesEntityData extends DataClass
    implements Insertable<InventoryChangesEntityData> {
  final int? id;
  final String itemId;
  final int? maxCount;
  final int? minCount;
  final int stockCountChange;
  final int? fixedSuggestion;
  final DateTime modified;
  final String? replaceWith;
  const InventoryChangesEntityData(
      {this.id,
      required this.itemId,
      this.maxCount,
      this.minCount,
      required this.stockCountChange,
      this.fixedSuggestion,
      required this.modified,
      this.replaceWith});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
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
    if (!nullToAbsent || replaceWith != null) {
      map['replace_with'] = Variable<String>(replaceWith);
    }
    return map;
  }

  InventoryChangesEntityCompanion toCompanion(bool nullToAbsent) {
    return InventoryChangesEntityCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
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
      replaceWith: replaceWith == null && nullToAbsent
          ? const Value.absent()
          : Value(replaceWith),
    );
  }

  factory InventoryChangesEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InventoryChangesEntityData(
      id: serializer.fromJson<int?>(json['id']),
      itemId: serializer.fromJson<String>(json['itemId']),
      maxCount: serializer.fromJson<int?>(json['maxCount']),
      minCount: serializer.fromJson<int?>(json['minCount']),
      stockCountChange: serializer.fromJson<int>(json['stockCountChange']),
      fixedSuggestion: serializer.fromJson<int?>(json['fixedSuggestion']),
      modified: serializer.fromJson<DateTime>(json['modified']),
      replaceWith: serializer.fromJson<String?>(json['replaceWith']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'itemId': serializer.toJson<String>(itemId),
      'maxCount': serializer.toJson<int?>(maxCount),
      'minCount': serializer.toJson<int?>(minCount),
      'stockCountChange': serializer.toJson<int>(stockCountChange),
      'fixedSuggestion': serializer.toJson<int?>(fixedSuggestion),
      'modified': serializer.toJson<DateTime>(modified),
      'replaceWith': serializer.toJson<String?>(replaceWith),
    };
  }

  InventoryChangesEntityData copyWith(
          {Value<int?> id = const Value.absent(),
          String? itemId,
          Value<int?> maxCount = const Value.absent(),
          Value<int?> minCount = const Value.absent(),
          int? stockCountChange,
          Value<int?> fixedSuggestion = const Value.absent(),
          DateTime? modified,
          Value<String?> replaceWith = const Value.absent()}) =>
      InventoryChangesEntityData(
        id: id.present ? id.value : this.id,
        itemId: itemId ?? this.itemId,
        maxCount: maxCount.present ? maxCount.value : this.maxCount,
        minCount: minCount.present ? minCount.value : this.minCount,
        stockCountChange: stockCountChange ?? this.stockCountChange,
        fixedSuggestion: fixedSuggestion.present
            ? fixedSuggestion.value
            : this.fixedSuggestion,
        modified: modified ?? this.modified,
        replaceWith: replaceWith.present ? replaceWith.value : this.replaceWith,
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
          ..write('modified: $modified, ')
          ..write('replaceWith: $replaceWith')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, itemId, maxCount, minCount,
      stockCountChange, fixedSuggestion, modified, replaceWith);
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
          other.modified == this.modified &&
          other.replaceWith == this.replaceWith);
}

class InventoryChangesEntityCompanion
    extends UpdateCompanion<InventoryChangesEntityData> {
  final Value<int?> id;
  final Value<String> itemId;
  final Value<int?> maxCount;
  final Value<int?> minCount;
  final Value<int> stockCountChange;
  final Value<int?> fixedSuggestion;
  final Value<DateTime> modified;
  final Value<String?> replaceWith;
  final Value<int> rowid;
  const InventoryChangesEntityCompanion({
    this.id = const Value.absent(),
    this.itemId = const Value.absent(),
    this.maxCount = const Value.absent(),
    this.minCount = const Value.absent(),
    this.stockCountChange = const Value.absent(),
    this.fixedSuggestion = const Value.absent(),
    this.modified = const Value.absent(),
    this.replaceWith = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InventoryChangesEntityCompanion.insert({
    this.id = const Value.absent(),
    required String itemId,
    this.maxCount = const Value.absent(),
    this.minCount = const Value.absent(),
    this.stockCountChange = const Value.absent(),
    this.fixedSuggestion = const Value.absent(),
    this.modified = const Value.absent(),
    this.replaceWith = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : itemId = Value(itemId);
  static Insertable<InventoryChangesEntityData> custom({
    Expression<int>? id,
    Expression<String>? itemId,
    Expression<int>? maxCount,
    Expression<int>? minCount,
    Expression<int>? stockCountChange,
    Expression<int>? fixedSuggestion,
    Expression<DateTime>? modified,
    Expression<String>? replaceWith,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemId != null) 'item_id': itemId,
      if (maxCount != null) 'max_count': maxCount,
      if (minCount != null) 'min_count': minCount,
      if (stockCountChange != null) 'stock_count_change': stockCountChange,
      if (fixedSuggestion != null) 'fixed_suggestion': fixedSuggestion,
      if (modified != null) 'modified': modified,
      if (replaceWith != null) 'replace_with': replaceWith,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InventoryChangesEntityCompanion copyWith(
      {Value<int?>? id,
      Value<String>? itemId,
      Value<int?>? maxCount,
      Value<int?>? minCount,
      Value<int>? stockCountChange,
      Value<int?>? fixedSuggestion,
      Value<DateTime>? modified,
      Value<String?>? replaceWith,
      Value<int>? rowid}) {
    return InventoryChangesEntityCompanion(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      maxCount: maxCount ?? this.maxCount,
      minCount: minCount ?? this.minCount,
      stockCountChange: stockCountChange ?? this.stockCountChange,
      fixedSuggestion: fixedSuggestion ?? this.fixedSuggestion,
      modified: modified ?? this.modified,
      replaceWith: replaceWith ?? this.replaceWith,
      rowid: rowid ?? this.rowid,
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
    if (replaceWith.present) {
      map['replace_with'] = Variable<String>(replaceWith.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
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
          ..write('modified: $modified, ')
          ..write('replaceWith: $replaceWith, ')
          ..write('rowid: $rowid')
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
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<String> itemId = GeneratedColumn<String>(
      'item_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
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
  List<GeneratedColumn> get $columns => [itemId, stockCountChange, modified];
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
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    } else if (isInserting) {
      context.missing(_itemIdMeta);
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
  Set<GeneratedColumn> get $primaryKey => {itemId};
  @override
  ProductInScannedItemEntityData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductInScannedItemEntityData(
      itemId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_id'])!,
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
  final String itemId;
  final int stockCountChange;
  final DateTime modified;
  const ProductInScannedItemEntityData(
      {required this.itemId,
      required this.stockCountChange,
      required this.modified});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['item_id'] = Variable<String>(itemId);
    map['stock_count_change'] = Variable<int>(stockCountChange);
    map['modified'] = Variable<DateTime>(modified);
    return map;
  }

  ProductInScannedItemEntityCompanion toCompanion(bool nullToAbsent) {
    return ProductInScannedItemEntityCompanion(
      itemId: Value(itemId),
      stockCountChange: Value(stockCountChange),
      modified: Value(modified),
    );
  }

  factory ProductInScannedItemEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductInScannedItemEntityData(
      itemId: serializer.fromJson<String>(json['itemId']),
      stockCountChange: serializer.fromJson<int>(json['stockCountChange']),
      modified: serializer.fromJson<DateTime>(json['modified']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'itemId': serializer.toJson<String>(itemId),
      'stockCountChange': serializer.toJson<int>(stockCountChange),
      'modified': serializer.toJson<DateTime>(modified),
    };
  }

  ProductInScannedItemEntityData copyWith(
          {String? itemId, int? stockCountChange, DateTime? modified}) =>
      ProductInScannedItemEntityData(
        itemId: itemId ?? this.itemId,
        stockCountChange: stockCountChange ?? this.stockCountChange,
        modified: modified ?? this.modified,
      );
  @override
  String toString() {
    return (StringBuffer('ProductInScannedItemEntityData(')
          ..write('itemId: $itemId, ')
          ..write('stockCountChange: $stockCountChange, ')
          ..write('modified: $modified')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(itemId, stockCountChange, modified);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductInScannedItemEntityData &&
          other.itemId == this.itemId &&
          other.stockCountChange == this.stockCountChange &&
          other.modified == this.modified);
}

class ProductInScannedItemEntityCompanion
    extends UpdateCompanion<ProductInScannedItemEntityData> {
  final Value<String> itemId;
  final Value<int> stockCountChange;
  final Value<DateTime> modified;
  final Value<int> rowid;
  const ProductInScannedItemEntityCompanion({
    this.itemId = const Value.absent(),
    this.stockCountChange = const Value.absent(),
    this.modified = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductInScannedItemEntityCompanion.insert({
    required String itemId,
    required int stockCountChange,
    this.modified = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : itemId = Value(itemId),
        stockCountChange = Value(stockCountChange);
  static Insertable<ProductInScannedItemEntityData> custom({
    Expression<String>? itemId,
    Expression<int>? stockCountChange,
    Expression<DateTime>? modified,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (itemId != null) 'item_id': itemId,
      if (stockCountChange != null) 'stock_count_change': stockCountChange,
      if (modified != null) 'modified': modified,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductInScannedItemEntityCompanion copyWith(
      {Value<String>? itemId,
      Value<int>? stockCountChange,
      Value<DateTime>? modified,
      Value<int>? rowid}) {
    return ProductInScannedItemEntityCompanion(
      itemId: itemId ?? this.itemId,
      stockCountChange: stockCountChange ?? this.stockCountChange,
      modified: modified ?? this.modified,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (itemId.present) {
      map['item_id'] = Variable<String>(itemId.value);
    }
    if (stockCountChange.present) {
      map['stock_count_change'] = Variable<int>(stockCountChange.value);
    }
    if (modified.present) {
      map['modified'] = Variable<DateTime>(modified.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductInScannedItemEntityCompanion(')
          ..write('itemId: $itemId, ')
          ..write('stockCountChange: $stockCountChange, ')
          ..write('modified: $modified, ')
          ..write('rowid: $rowid')
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
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<String> itemId = GeneratedColumn<String>(
      'item_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
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
  List<GeneratedColumn> get $columns => [itemId, stockCountChange, modified];
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
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    } else if (isInserting) {
      context.missing(_itemIdMeta);
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
  Set<GeneratedColumn> get $primaryKey => {itemId};
  @override
  ProductOutScannedItemEntityData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductOutScannedItemEntityData(
      itemId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_id'])!,
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
  final String itemId;
  final int stockCountChange;
  final DateTime modified;
  const ProductOutScannedItemEntityData(
      {required this.itemId,
      required this.stockCountChange,
      required this.modified});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['item_id'] = Variable<String>(itemId);
    map['stock_count_change'] = Variable<int>(stockCountChange);
    map['modified'] = Variable<DateTime>(modified);
    return map;
  }

  ProductOutScannedItemEntityCompanion toCompanion(bool nullToAbsent) {
    return ProductOutScannedItemEntityCompanion(
      itemId: Value(itemId),
      stockCountChange: Value(stockCountChange),
      modified: Value(modified),
    );
  }

  factory ProductOutScannedItemEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductOutScannedItemEntityData(
      itemId: serializer.fromJson<String>(json['itemId']),
      stockCountChange: serializer.fromJson<int>(json['stockCountChange']),
      modified: serializer.fromJson<DateTime>(json['modified']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'itemId': serializer.toJson<String>(itemId),
      'stockCountChange': serializer.toJson<int>(stockCountChange),
      'modified': serializer.toJson<DateTime>(modified),
    };
  }

  ProductOutScannedItemEntityData copyWith(
          {String? itemId, int? stockCountChange, DateTime? modified}) =>
      ProductOutScannedItemEntityData(
        itemId: itemId ?? this.itemId,
        stockCountChange: stockCountChange ?? this.stockCountChange,
        modified: modified ?? this.modified,
      );
  @override
  String toString() {
    return (StringBuffer('ProductOutScannedItemEntityData(')
          ..write('itemId: $itemId, ')
          ..write('stockCountChange: $stockCountChange, ')
          ..write('modified: $modified')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(itemId, stockCountChange, modified);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductOutScannedItemEntityData &&
          other.itemId == this.itemId &&
          other.stockCountChange == this.stockCountChange &&
          other.modified == this.modified);
}

class ProductOutScannedItemEntityCompanion
    extends UpdateCompanion<ProductOutScannedItemEntityData> {
  final Value<String> itemId;
  final Value<int> stockCountChange;
  final Value<DateTime> modified;
  final Value<int> rowid;
  const ProductOutScannedItemEntityCompanion({
    this.itemId = const Value.absent(),
    this.stockCountChange = const Value.absent(),
    this.modified = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductOutScannedItemEntityCompanion.insert({
    required String itemId,
    required int stockCountChange,
    this.modified = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : itemId = Value(itemId),
        stockCountChange = Value(stockCountChange);
  static Insertable<ProductOutScannedItemEntityData> custom({
    Expression<String>? itemId,
    Expression<int>? stockCountChange,
    Expression<DateTime>? modified,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (itemId != null) 'item_id': itemId,
      if (stockCountChange != null) 'stock_count_change': stockCountChange,
      if (modified != null) 'modified': modified,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductOutScannedItemEntityCompanion copyWith(
      {Value<String>? itemId,
      Value<int>? stockCountChange,
      Value<DateTime>? modified,
      Value<int>? rowid}) {
    return ProductOutScannedItemEntityCompanion(
      itemId: itemId ?? this.itemId,
      stockCountChange: stockCountChange ?? this.stockCountChange,
      modified: modified ?? this.modified,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (itemId.present) {
      map['item_id'] = Variable<String>(itemId.value);
    }
    if (stockCountChange.present) {
      map['stock_count_change'] = Variable<int>(stockCountChange.value);
    }
    if (modified.present) {
      map['modified'] = Variable<DateTime>(modified.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductOutScannedItemEntityCompanion(')
          ..write('itemId: $itemId, ')
          ..write('stockCountChange: $stockCountChange, ')
          ..write('modified: $modified, ')
          ..write('rowid: $rowid')
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
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<String> itemId = GeneratedColumn<String>(
      'item_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
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
  List<GeneratedColumn> get $columns => [itemId, stockCountChange, modified];
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
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    } else if (isInserting) {
      context.missing(_itemIdMeta);
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
  Set<GeneratedColumn> get $primaryKey => {itemId};
  @override
  ProductCountScannedItemEntityData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductCountScannedItemEntityData(
      itemId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_id'])!,
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
  final String itemId;
  final int stockCountChange;
  final DateTime modified;
  const ProductCountScannedItemEntityData(
      {required this.itemId,
      required this.stockCountChange,
      required this.modified});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['item_id'] = Variable<String>(itemId);
    map['stock_count_change'] = Variable<int>(stockCountChange);
    map['modified'] = Variable<DateTime>(modified);
    return map;
  }

  ProductCountScannedItemEntityCompanion toCompanion(bool nullToAbsent) {
    return ProductCountScannedItemEntityCompanion(
      itemId: Value(itemId),
      stockCountChange: Value(stockCountChange),
      modified: Value(modified),
    );
  }

  factory ProductCountScannedItemEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductCountScannedItemEntityData(
      itemId: serializer.fromJson<String>(json['itemId']),
      stockCountChange: serializer.fromJson<int>(json['stockCountChange']),
      modified: serializer.fromJson<DateTime>(json['modified']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'itemId': serializer.toJson<String>(itemId),
      'stockCountChange': serializer.toJson<int>(stockCountChange),
      'modified': serializer.toJson<DateTime>(modified),
    };
  }

  ProductCountScannedItemEntityData copyWith(
          {String? itemId, int? stockCountChange, DateTime? modified}) =>
      ProductCountScannedItemEntityData(
        itemId: itemId ?? this.itemId,
        stockCountChange: stockCountChange ?? this.stockCountChange,
        modified: modified ?? this.modified,
      );
  @override
  String toString() {
    return (StringBuffer('ProductCountScannedItemEntityData(')
          ..write('itemId: $itemId, ')
          ..write('stockCountChange: $stockCountChange, ')
          ..write('modified: $modified')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(itemId, stockCountChange, modified);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductCountScannedItemEntityData &&
          other.itemId == this.itemId &&
          other.stockCountChange == this.stockCountChange &&
          other.modified == this.modified);
}

class ProductCountScannedItemEntityCompanion
    extends UpdateCompanion<ProductCountScannedItemEntityData> {
  final Value<String> itemId;
  final Value<int> stockCountChange;
  final Value<DateTime> modified;
  final Value<int> rowid;
  const ProductCountScannedItemEntityCompanion({
    this.itemId = const Value.absent(),
    this.stockCountChange = const Value.absent(),
    this.modified = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductCountScannedItemEntityCompanion.insert({
    required String itemId,
    required int stockCountChange,
    this.modified = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : itemId = Value(itemId),
        stockCountChange = Value(stockCountChange);
  static Insertable<ProductCountScannedItemEntityData> custom({
    Expression<String>? itemId,
    Expression<int>? stockCountChange,
    Expression<DateTime>? modified,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (itemId != null) 'item_id': itemId,
      if (stockCountChange != null) 'stock_count_change': stockCountChange,
      if (modified != null) 'modified': modified,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductCountScannedItemEntityCompanion copyWith(
      {Value<String>? itemId,
      Value<int>? stockCountChange,
      Value<DateTime>? modified,
      Value<int>? rowid}) {
    return ProductCountScannedItemEntityCompanion(
      itemId: itemId ?? this.itemId,
      stockCountChange: stockCountChange ?? this.stockCountChange,
      modified: modified ?? this.modified,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (itemId.present) {
      map['item_id'] = Variable<String>(itemId.value);
    }
    if (stockCountChange.present) {
      map['stock_count_change'] = Variable<int>(stockCountChange.value);
    }
    if (modified.present) {
      map['modified'] = Variable<DateTime>(modified.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductCountScannedItemEntityCompanion(')
          ..write('itemId: $itemId, ')
          ..write('stockCountChange: $stockCountChange, ')
          ..write('modified: $modified, ')
          ..write('rowid: $rowid')
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
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<String> itemId = GeneratedColumn<String>(
      'item_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cartIdMeta = const VerificationMeta('cartId');
  @override
  late final GeneratedColumn<int> cartId = GeneratedColumn<int>(
      'cart_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
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
  List<GeneratedColumn> get $columns => [itemId, cartId, quantity, modified];
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
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('cart_id')) {
      context.handle(_cartIdMeta,
          cartId.isAcceptableOrUnknown(data['cart_id']!, _cartIdMeta));
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
  Set<GeneratedColumn> get $primaryKey => {itemId};
  @override
  ShoppingCartEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShoppingCartEntityData(
      itemId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_id'])!,
      cartId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cart_id']),
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
  final String itemId;
  final int? cartId;
  final int quantity;
  final DateTime modified;
  const ShoppingCartEntityData(
      {required this.itemId,
      this.cartId,
      required this.quantity,
      required this.modified});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['item_id'] = Variable<String>(itemId);
    if (!nullToAbsent || cartId != null) {
      map['cart_id'] = Variable<int>(cartId);
    }
    map['quantity'] = Variable<int>(quantity);
    map['modified'] = Variable<DateTime>(modified);
    return map;
  }

  ShoppingCartEntityCompanion toCompanion(bool nullToAbsent) {
    return ShoppingCartEntityCompanion(
      itemId: Value(itemId),
      cartId:
          cartId == null && nullToAbsent ? const Value.absent() : Value(cartId),
      quantity: Value(quantity),
      modified: Value(modified),
    );
  }

  factory ShoppingCartEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShoppingCartEntityData(
      itemId: serializer.fromJson<String>(json['itemId']),
      cartId: serializer.fromJson<int?>(json['cartId']),
      quantity: serializer.fromJson<int>(json['quantity']),
      modified: serializer.fromJson<DateTime>(json['modified']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'itemId': serializer.toJson<String>(itemId),
      'cartId': serializer.toJson<int?>(cartId),
      'quantity': serializer.toJson<int>(quantity),
      'modified': serializer.toJson<DateTime>(modified),
    };
  }

  ShoppingCartEntityData copyWith(
          {String? itemId,
          Value<int?> cartId = const Value.absent(),
          int? quantity,
          DateTime? modified}) =>
      ShoppingCartEntityData(
        itemId: itemId ?? this.itemId,
        cartId: cartId.present ? cartId.value : this.cartId,
        quantity: quantity ?? this.quantity,
        modified: modified ?? this.modified,
      );
  @override
  String toString() {
    return (StringBuffer('ShoppingCartEntityData(')
          ..write('itemId: $itemId, ')
          ..write('cartId: $cartId, ')
          ..write('quantity: $quantity, ')
          ..write('modified: $modified')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(itemId, cartId, quantity, modified);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShoppingCartEntityData &&
          other.itemId == this.itemId &&
          other.cartId == this.cartId &&
          other.quantity == this.quantity &&
          other.modified == this.modified);
}

class ShoppingCartEntityCompanion
    extends UpdateCompanion<ShoppingCartEntityData> {
  final Value<String> itemId;
  final Value<int?> cartId;
  final Value<int> quantity;
  final Value<DateTime> modified;
  final Value<int> rowid;
  const ShoppingCartEntityCompanion({
    this.itemId = const Value.absent(),
    this.cartId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.modified = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ShoppingCartEntityCompanion.insert({
    required String itemId,
    this.cartId = const Value.absent(),
    required int quantity,
    this.modified = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : itemId = Value(itemId),
        quantity = Value(quantity);
  static Insertable<ShoppingCartEntityData> custom({
    Expression<String>? itemId,
    Expression<int>? cartId,
    Expression<int>? quantity,
    Expression<DateTime>? modified,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (itemId != null) 'item_id': itemId,
      if (cartId != null) 'cart_id': cartId,
      if (quantity != null) 'quantity': quantity,
      if (modified != null) 'modified': modified,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ShoppingCartEntityCompanion copyWith(
      {Value<String>? itemId,
      Value<int?>? cartId,
      Value<int>? quantity,
      Value<DateTime>? modified,
      Value<int>? rowid}) {
    return ShoppingCartEntityCompanion(
      itemId: itemId ?? this.itemId,
      cartId: cartId ?? this.cartId,
      quantity: quantity ?? this.quantity,
      modified: modified ?? this.modified,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (itemId.present) {
      map['item_id'] = Variable<String>(itemId.value);
    }
    if (cartId.present) {
      map['cart_id'] = Variable<int>(cartId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (modified.present) {
      map['modified'] = Variable<DateTime>(modified.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShoppingCartEntityCompanion(')
          ..write('itemId: $itemId, ')
          ..write('cartId: $cartId, ')
          ..write('quantity: $quantity, ')
          ..write('modified: $modified, ')
          ..write('rowid: $rowid')
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
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<String> itemId = GeneratedColumn<String>(
      'item_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
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
  List<GeneratedColumn> get $columns => [itemId, quantityChange, modified];
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
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    } else if (isInserting) {
      context.missing(_itemIdMeta);
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
  Set<GeneratedColumn> get $primaryKey => {itemId};
  @override
  ShoppingCartChangesEntityData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShoppingCartChangesEntityData(
      itemId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_id'])!,
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
  final String itemId;
  final int quantityChange;
  final DateTime modified;
  const ShoppingCartChangesEntityData(
      {required this.itemId,
      required this.quantityChange,
      required this.modified});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['item_id'] = Variable<String>(itemId);
    map['quantity_change'] = Variable<int>(quantityChange);
    map['modified'] = Variable<DateTime>(modified);
    return map;
  }

  ShoppingCartChangesEntityCompanion toCompanion(bool nullToAbsent) {
    return ShoppingCartChangesEntityCompanion(
      itemId: Value(itemId),
      quantityChange: Value(quantityChange),
      modified: Value(modified),
    );
  }

  factory ShoppingCartChangesEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShoppingCartChangesEntityData(
      itemId: serializer.fromJson<String>(json['itemId']),
      quantityChange: serializer.fromJson<int>(json['quantityChange']),
      modified: serializer.fromJson<DateTime>(json['modified']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'itemId': serializer.toJson<String>(itemId),
      'quantityChange': serializer.toJson<int>(quantityChange),
      'modified': serializer.toJson<DateTime>(modified),
    };
  }

  ShoppingCartChangesEntityData copyWith(
          {String? itemId, int? quantityChange, DateTime? modified}) =>
      ShoppingCartChangesEntityData(
        itemId: itemId ?? this.itemId,
        quantityChange: quantityChange ?? this.quantityChange,
        modified: modified ?? this.modified,
      );
  @override
  String toString() {
    return (StringBuffer('ShoppingCartChangesEntityData(')
          ..write('itemId: $itemId, ')
          ..write('quantityChange: $quantityChange, ')
          ..write('modified: $modified')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(itemId, quantityChange, modified);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShoppingCartChangesEntityData &&
          other.itemId == this.itemId &&
          other.quantityChange == this.quantityChange &&
          other.modified == this.modified);
}

class ShoppingCartChangesEntityCompanion
    extends UpdateCompanion<ShoppingCartChangesEntityData> {
  final Value<String> itemId;
  final Value<int> quantityChange;
  final Value<DateTime> modified;
  final Value<int> rowid;
  const ShoppingCartChangesEntityCompanion({
    this.itemId = const Value.absent(),
    this.quantityChange = const Value.absent(),
    this.modified = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ShoppingCartChangesEntityCompanion.insert({
    required String itemId,
    required int quantityChange,
    this.modified = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : itemId = Value(itemId),
        quantityChange = Value(quantityChange);
  static Insertable<ShoppingCartChangesEntityData> custom({
    Expression<String>? itemId,
    Expression<int>? quantityChange,
    Expression<DateTime>? modified,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (itemId != null) 'item_id': itemId,
      if (quantityChange != null) 'quantity_change': quantityChange,
      if (modified != null) 'modified': modified,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ShoppingCartChangesEntityCompanion copyWith(
      {Value<String>? itemId,
      Value<int>? quantityChange,
      Value<DateTime>? modified,
      Value<int>? rowid}) {
    return ShoppingCartChangesEntityCompanion(
      itemId: itemId ?? this.itemId,
      quantityChange: quantityChange ?? this.quantityChange,
      modified: modified ?? this.modified,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (itemId.present) {
      map['item_id'] = Variable<String>(itemId.value);
    }
    if (quantityChange.present) {
      map['quantity_change'] = Variable<int>(quantityChange.value);
    }
    if (modified.present) {
      map['modified'] = Variable<DateTime>(modified.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShoppingCartChangesEntityCompanion(')
          ..write('itemId: $itemId, ')
          ..write('quantityChange: $quantityChange, ')
          ..write('modified: $modified, ')
          ..write('rowid: $rowid')
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
  Value<int?> id,
  required String itemId,
  required String productName,
  required String product,
  Value<int?> maxCount,
  Value<int?> minCount,
  Value<int> stockCount,
  Value<int?> fixedSuggestion,
  Value<bool> isAvailable,
  Value<String?> alternativeItemId,
  Value<DateTime> created,
  Value<DateTime> modified,
  Value<int> rowid,
});
typedef $$InventoryEntityTableUpdateCompanionBuilder = InventoryEntityCompanion
    Function({
  Value<int?> id,
  Value<String> itemId,
  Value<String> productName,
  Value<String> product,
  Value<int?> maxCount,
  Value<int?> minCount,
  Value<int> stockCount,
  Value<int?> fixedSuggestion,
  Value<bool> isAvailable,
  Value<String?> alternativeItemId,
  Value<DateTime> created,
  Value<DateTime> modified,
  Value<int> rowid,
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
            Value<int?> id = const Value.absent(),
            Value<String> itemId = const Value.absent(),
            Value<String> productName = const Value.absent(),
            Value<String> product = const Value.absent(),
            Value<int?> maxCount = const Value.absent(),
            Value<int?> minCount = const Value.absent(),
            Value<int> stockCount = const Value.absent(),
            Value<int?> fixedSuggestion = const Value.absent(),
            Value<bool> isAvailable = const Value.absent(),
            Value<String?> alternativeItemId = const Value.absent(),
            Value<DateTime> created = const Value.absent(),
            Value<DateTime> modified = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              InventoryEntityCompanion(
            id: id,
            itemId: itemId,
            productName: productName,
            product: product,
            maxCount: maxCount,
            minCount: minCount,
            stockCount: stockCount,
            fixedSuggestion: fixedSuggestion,
            isAvailable: isAvailable,
            alternativeItemId: alternativeItemId,
            created: created,
            modified: modified,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            Value<int?> id = const Value.absent(),
            required String itemId,
            required String productName,
            required String product,
            Value<int?> maxCount = const Value.absent(),
            Value<int?> minCount = const Value.absent(),
            Value<int> stockCount = const Value.absent(),
            Value<int?> fixedSuggestion = const Value.absent(),
            Value<bool> isAvailable = const Value.absent(),
            Value<String?> alternativeItemId = const Value.absent(),
            Value<DateTime> created = const Value.absent(),
            Value<DateTime> modified = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              InventoryEntityCompanion.insert(
            id: id,
            itemId: itemId,
            productName: productName,
            product: product,
            maxCount: maxCount,
            minCount: minCount,
            stockCount: stockCount,
            fixedSuggestion: fixedSuggestion,
            isAvailable: isAvailable,
            alternativeItemId: alternativeItemId,
            created: created,
            modified: modified,
            rowid: rowid,
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

  ColumnFilters<bool> get isAvailable => $state.composableBuilder(
      column: $state.table.isAvailable,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get alternativeItemId => $state.composableBuilder(
      column: $state.table.alternativeItemId,
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

  ColumnOrderings<bool> get isAvailable => $state.composableBuilder(
      column: $state.table.isAvailable,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get alternativeItemId => $state.composableBuilder(
      column: $state.table.alternativeItemId,
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
  Value<int?> id,
  required String itemId,
  Value<int?> maxCount,
  Value<int?> minCount,
  Value<int> stockCountChange,
  Value<int?> fixedSuggestion,
  Value<DateTime> modified,
  Value<String?> replaceWith,
  Value<int> rowid,
});
typedef $$InventoryChangesEntityTableUpdateCompanionBuilder
    = InventoryChangesEntityCompanion Function({
  Value<int?> id,
  Value<String> itemId,
  Value<int?> maxCount,
  Value<int?> minCount,
  Value<int> stockCountChange,
  Value<int?> fixedSuggestion,
  Value<DateTime> modified,
  Value<String?> replaceWith,
  Value<int> rowid,
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
            Value<int?> id = const Value.absent(),
            Value<String> itemId = const Value.absent(),
            Value<int?> maxCount = const Value.absent(),
            Value<int?> minCount = const Value.absent(),
            Value<int> stockCountChange = const Value.absent(),
            Value<int?> fixedSuggestion = const Value.absent(),
            Value<DateTime> modified = const Value.absent(),
            Value<String?> replaceWith = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              InventoryChangesEntityCompanion(
            id: id,
            itemId: itemId,
            maxCount: maxCount,
            minCount: minCount,
            stockCountChange: stockCountChange,
            fixedSuggestion: fixedSuggestion,
            modified: modified,
            replaceWith: replaceWith,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            Value<int?> id = const Value.absent(),
            required String itemId,
            Value<int?> maxCount = const Value.absent(),
            Value<int?> minCount = const Value.absent(),
            Value<int> stockCountChange = const Value.absent(),
            Value<int?> fixedSuggestion = const Value.absent(),
            Value<DateTime> modified = const Value.absent(),
            Value<String?> replaceWith = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              InventoryChangesEntityCompanion.insert(
            id: id,
            itemId: itemId,
            maxCount: maxCount,
            minCount: minCount,
            stockCountChange: stockCountChange,
            fixedSuggestion: fixedSuggestion,
            modified: modified,
            replaceWith: replaceWith,
            rowid: rowid,
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

  ColumnFilters<String> get replaceWith => $state.composableBuilder(
      column: $state.table.replaceWith,
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

  ColumnOrderings<String> get replaceWith => $state.composableBuilder(
      column: $state.table.replaceWith,
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
  required String itemId,
  required int stockCountChange,
  Value<DateTime> modified,
  Value<int> rowid,
});
typedef $$ProductInScannedItemEntityTableUpdateCompanionBuilder
    = ProductInScannedItemEntityCompanion Function({
  Value<String> itemId,
  Value<int> stockCountChange,
  Value<DateTime> modified,
  Value<int> rowid,
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
            Value<String> itemId = const Value.absent(),
            Value<int> stockCountChange = const Value.absent(),
            Value<DateTime> modified = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProductInScannedItemEntityCompanion(
            itemId: itemId,
            stockCountChange: stockCountChange,
            modified: modified,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            required String itemId,
            required int stockCountChange,
            Value<DateTime> modified = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProductInScannedItemEntityCompanion.insert(
            itemId: itemId,
            stockCountChange: stockCountChange,
            modified: modified,
            rowid: rowid,
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
  ColumnFilters<String> get itemId => $state.composableBuilder(
      column: $state.table.itemId,
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
  ColumnOrderings<String> get itemId => $state.composableBuilder(
      column: $state.table.itemId,
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
  required String itemId,
  required int stockCountChange,
  Value<DateTime> modified,
  Value<int> rowid,
});
typedef $$ProductOutScannedItemEntityTableUpdateCompanionBuilder
    = ProductOutScannedItemEntityCompanion Function({
  Value<String> itemId,
  Value<int> stockCountChange,
  Value<DateTime> modified,
  Value<int> rowid,
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
            Value<String> itemId = const Value.absent(),
            Value<int> stockCountChange = const Value.absent(),
            Value<DateTime> modified = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProductOutScannedItemEntityCompanion(
            itemId: itemId,
            stockCountChange: stockCountChange,
            modified: modified,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            required String itemId,
            required int stockCountChange,
            Value<DateTime> modified = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProductOutScannedItemEntityCompanion.insert(
            itemId: itemId,
            stockCountChange: stockCountChange,
            modified: modified,
            rowid: rowid,
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
  ColumnFilters<String> get itemId => $state.composableBuilder(
      column: $state.table.itemId,
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
  ColumnOrderings<String> get itemId => $state.composableBuilder(
      column: $state.table.itemId,
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
  required String itemId,
  required int stockCountChange,
  Value<DateTime> modified,
  Value<int> rowid,
});
typedef $$ProductCountScannedItemEntityTableUpdateCompanionBuilder
    = ProductCountScannedItemEntityCompanion Function({
  Value<String> itemId,
  Value<int> stockCountChange,
  Value<DateTime> modified,
  Value<int> rowid,
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
            Value<String> itemId = const Value.absent(),
            Value<int> stockCountChange = const Value.absent(),
            Value<DateTime> modified = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProductCountScannedItemEntityCompanion(
            itemId: itemId,
            stockCountChange: stockCountChange,
            modified: modified,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            required String itemId,
            required int stockCountChange,
            Value<DateTime> modified = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProductCountScannedItemEntityCompanion.insert(
            itemId: itemId,
            stockCountChange: stockCountChange,
            modified: modified,
            rowid: rowid,
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
  ColumnFilters<String> get itemId => $state.composableBuilder(
      column: $state.table.itemId,
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
  ColumnOrderings<String> get itemId => $state.composableBuilder(
      column: $state.table.itemId,
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
  required String itemId,
  Value<int?> cartId,
  required int quantity,
  Value<DateTime> modified,
  Value<int> rowid,
});
typedef $$ShoppingCartEntityTableUpdateCompanionBuilder
    = ShoppingCartEntityCompanion Function({
  Value<String> itemId,
  Value<int?> cartId,
  Value<int> quantity,
  Value<DateTime> modified,
  Value<int> rowid,
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
            Value<String> itemId = const Value.absent(),
            Value<int?> cartId = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<DateTime> modified = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ShoppingCartEntityCompanion(
            itemId: itemId,
            cartId: cartId,
            quantity: quantity,
            modified: modified,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            required String itemId,
            Value<int?> cartId = const Value.absent(),
            required int quantity,
            Value<DateTime> modified = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ShoppingCartEntityCompanion.insert(
            itemId: itemId,
            cartId: cartId,
            quantity: quantity,
            modified: modified,
            rowid: rowid,
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
  ColumnFilters<String> get itemId => $state.composableBuilder(
      column: $state.table.itemId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get cartId => $state.composableBuilder(
      column: $state.table.cartId,
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
  ColumnOrderings<String> get itemId => $state.composableBuilder(
      column: $state.table.itemId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get cartId => $state.composableBuilder(
      column: $state.table.cartId,
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
  required String itemId,
  required int quantityChange,
  Value<DateTime> modified,
  Value<int> rowid,
});
typedef $$ShoppingCartChangesEntityTableUpdateCompanionBuilder
    = ShoppingCartChangesEntityCompanion Function({
  Value<String> itemId,
  Value<int> quantityChange,
  Value<DateTime> modified,
  Value<int> rowid,
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
            Value<String> itemId = const Value.absent(),
            Value<int> quantityChange = const Value.absent(),
            Value<DateTime> modified = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ShoppingCartChangesEntityCompanion(
            itemId: itemId,
            quantityChange: quantityChange,
            modified: modified,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            required String itemId,
            required int quantityChange,
            Value<DateTime> modified = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ShoppingCartChangesEntityCompanion.insert(
            itemId: itemId,
            quantityChange: quantityChange,
            modified: modified,
            rowid: rowid,
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
  ColumnFilters<String> get itemId => $state.composableBuilder(
      column: $state.table.itemId,
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
  ColumnOrderings<String> get itemId => $state.composableBuilder(
      column: $state.table.itemId,
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
