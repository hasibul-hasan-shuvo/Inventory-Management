import 'package:dental_inventory/firebase_options.dart';
import 'package:dental_inventory/flavors/environment.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logger/logger.dart';

import '/flavors/build_config.dart';

class FirebaseService {
  static final Logger _logger = BuildConfig.instance.config.logger;

  static Future<void> enableFirebase(Environment environment) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform(environment),
    ).then((app) async {
      _logger.i("Firebase initialized");
    }, onError: (e) {
      _logger.e("FirebaseServiceError: $e");
    });
  }
}
