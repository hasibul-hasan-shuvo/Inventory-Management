import 'package:dental_inventory/app/core/model/contact_info.dart';
import 'package:dental_inventory/app/core/values/app_strings.dart';

import '/app/core/base/base_controller.dart';

class ContactUsController extends BaseController {
  List<ContactInfo> getContacts() => [
        ContactInfo(
            name: appLocalization.consumables,
            number: AppStrings.consumablesNumber),
        ContactInfo(
            name: appLocalization.equipment,
            number: AppStrings.equipmentNumber),
        ContactInfo(
            name: appLocalization.service, number: AppStrings.serviceNumber),
        ContactInfo(
            name: appLocalization.workshop, number: AppStrings.workshopNumber),
        ContactInfo(
            name: appLocalization.accounting,
            number: AppStrings.accountingNumber),
      ];
}
