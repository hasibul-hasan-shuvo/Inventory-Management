import 'package:get/get.dart';

import '../controllers/fixed_suggestion_controller.dart';

class FixedSuggestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FixedSuggestionController>(
      () => FixedSuggestionController(),
    );
  }
}
