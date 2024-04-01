import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum OrderStatus {
  ACTIVE,
  NOT_DELIVERED,
  DELIVERED,
  RECEIVED,
}

extension OrderStatusExtensions on OrderStatus {
  String getTitle(AppLocalizations appLocalization) {
    switch (this) {
      case OrderStatus.ACTIVE:
        return appLocalization.orderStatusActive;
      case OrderStatus.NOT_DELIVERED:
        return appLocalization.orderStatusNotDelivered;
      case OrderStatus.DELIVERED:
        return appLocalization.orderStatusDelivered;
      case OrderStatus.RECEIVED:
        return appLocalization.orderStatusReceived;
    }
  }

  String get toLowercaseName => name.toLowerCase();
}
