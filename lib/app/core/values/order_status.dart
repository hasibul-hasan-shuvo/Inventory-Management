import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum OrderStatus {
  ACTIVE,
  ORDERED,
  DELIVERED,
}

extension OrderStatusExtensions on OrderStatus {
  String getTitle(AppLocalizations appLocalization) {
    switch (this) {
      case OrderStatus.ACTIVE:
        return appLocalization.orderStatusActive;
      case OrderStatus.ORDERED:
        return appLocalization.orderStatusOrdered;
      case OrderStatus.DELIVERED:
        return appLocalization.orderStatusDelivered;
    }
  }

  String get toLowercaseName => name.toLowerCase();
}
