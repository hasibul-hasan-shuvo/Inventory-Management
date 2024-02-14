import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/scanner_controller.dart';

// ignore: must_be_immutable
class ScannerView extends BaseView<ScannerController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) => null;

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScannerView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ScannerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
