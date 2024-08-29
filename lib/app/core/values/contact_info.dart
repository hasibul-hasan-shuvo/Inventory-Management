import 'package:flutter/cupertino.dart';

abstract class ContactInfo {
  final String email = '';
  final String phone = '';
  final String website = '';

  String getContactPageHtmlBody(BuildContext context);
}
