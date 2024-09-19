import 'dart:ui';

import 'package:dental_inventory/themes/app_colors.dart';

class DabAppColors extends AppColors {
  DabAppColors()
      : super(
          primary: const Color(0xFF009640),
          primaryDark: const Color(0xFF009640),
          secondaryColor: const Color(0xFFAECB37),
          errorContainerLight: const Color(0xFFC83386),
          onErrorContainerLight: const Color(0xFFFFFFFF),
          errorContainerDark: const Color(0xFFC83386),
          onErrorContainerDark: const Color(0xFFFFFFFF),
        );
}
