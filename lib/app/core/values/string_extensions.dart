extension StringExtensions on String? {
  bool get isNull => this == null;
  bool get isNotNull => this != null;
  bool get isNullOrEmpty => isNull || this!.isEmpty;
  bool get isNotNullOrEmpty => isNotNull && this!.isNotEmpty;
  String? get timestampString => this?.replaceAll(" ", "T");

  bool get isPositiveIntegerNumber {
    if (isNullOrEmpty) {
      return false;
    }
    try {
      int integerValue = int.parse(this!);

      if (integerValue < 0) {
        return false;
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  int get toInt {
    if (isNullOrEmpty) {
      return 0;
    }
    try {
      int integerValue = int.parse(this!);

      return integerValue;
    } catch (e) {
      return 0;
    }
  }
}
