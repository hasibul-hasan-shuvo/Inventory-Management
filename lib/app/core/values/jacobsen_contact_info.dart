import 'package:dental_inventory/app/core/values/contact_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class JacobsenContactInfo implements ContactInfo {
  @override
  String get email => 'post@jacobsen-dental.no';

  @override
  String get phone => '22 79 20 20';

  @override
  String get website => 'https://www.jacobsen-dental.no/';

  @override
  String getContactPageHtmlBody(BuildContext context) {
    AppLocalizations appLocalization = AppLocalizations.of(context)!;

    return '<b>${appLocalization.postalAddress}</b><br>'
        'Boks 97, Alnabru 0614 Oslo'
        '<br><br>'
        '<b>${appLocalization.visitingAddress}</b><br>'
        'Alfaset 1. Industrivei 4, 0668 Oslo'
        '<br><br>'
        '<b>${appLocalization.phone}</b> <a href="tel:$phone" style="text-decoration:none;">$phone</a>'
        '<br>'
        '<b>${appLocalization.email}</b> <a href="mailto:$email" style="text-decoration:none;">$email</a>'
        '<br><br>'
        '<b>${appLocalization.openingHourTitle}</b>'
        '<br>'
        '${appLocalization.openingHourJacobsenMessage}'
        '<br><br>'
        '<small>${appLocalization.contactDescriptionJacobsen}</small>'
        '<br><br>'
        '<table>'
        '<tr>'
        '<td>${appLocalization.accounting}&emsp;</td>'
        '<td><a href="tel:22 79 20 29" style="text-decoration:none;">22 79 20 29</a></td>'
        '</tr>'
        '<tr>'
        '<td>${appLocalization.service}&emsp;</td>'
        '<td><a href="tel:22 79 20 89" style="text-decoration:none;">22 79 20 89</a></td>'
        '</tr>'
        '<tr>'
        '<td>${appLocalization.consumables}&emsp;</td>'
        '<td><a href="tel:22 79 20 49" style="text-decoration:none;">22 79 20 49</a></td>'
        '</tr>'
        '<tr>'
        '<td>${appLocalization.equipment}&emsp;</td>'
        '<td><a href="tel:22 79 20 58" style="text-decoration:none;">22 79 20 58</a></td>'
        '</tr>'
        '<tr>'
        '<td>${appLocalization.workshop}&emsp;</td>'
        '<td><a href="tel:22 79 20 79" style="text-decoration:none;">22 79 20 79</a></td>'
        '</tr>'
        '</table>';
  }
}
