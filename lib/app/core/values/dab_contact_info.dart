import 'package:dental_inventory/app/core/values/contact_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DabContactInfo implements ContactInfo {
  @override
  String get email => 'kontakt@dabdental.se';

  @override
  String get phone => '08-506 505 00';

  @override
  String get website => 'https://www.dabdental.se/';

  @override
  String getContactPageHtmlBody(BuildContext context) {
    AppLocalizations appLocalization = AppLocalizations.of(context)!;

    return '<b>${appLocalization.postalAddress}</b><br>'
        'Box 423, 194 04 Upplands Väsby'
        '<br><br>'
        '<b>${appLocalization.visitingAddress}</b><br>'
        'Finvids väg 8, 194 47 Upplands Väsby'
        '<br><br>'
        '<b>${appLocalization.phone}</b> <a href="tel:$phone" style="text-decoration:none;">$phone</a>'
        '<br>'
        '<b>${appLocalization.email}</b> <a href="mailto:$email" style="text-decoration:none;">$email</a>'
        '<br><br>'
        '<b>${appLocalization.openingHourTitle}</b>'
        '<br>'
        '${appLocalization.openingHourDabMessage}'
        '<br><br>'
        '<small>${appLocalization.contactDescriptionDab}</small>'
        '<br><br>'
        '<table>'
        '<tr>'
        '<td>${appLocalization.accounting}&emsp;</td>'
        '<td><a href="tel:08-506 505 00" style="text-decoration:none;">08-506 505 00</a></td>'
        '</tr>'
        '<tr>'
        '<td>${appLocalization.consumables}&emsp;</td>'
        '<td><a href="tel:08-506 505 05" style="text-decoration:none;">08-506 505 05</a></td>'
        '</tr>'
        '<tr>'
        '<td>${appLocalization.equipment}&emsp;</td>'
        '<td><a href="tel:08-506 505 37" style="text-decoration:none;">08-506 505 37</a></td>'
        '</tr>'
        '<tr>'
        '<td>${appLocalization.service}&emsp;</td>'
        '<td><a href="tel:08-506 505 66" style="text-decoration:none;">08-506 505 66</a></td>'
        '</tr>'
        '<tr>'
        '<td>${appLocalization.workshop}&emsp;</td>'
        '<td><a href="tel:08-506 505 60" style="text-decoration:none;">08-506 505 60</a></td>'
        '</tr>'
        '</table>';
  }
}
