extension StringExtensions on String? {
  bool get isNull => this == null;
  bool get isNotNull => this != null;
  bool get isNullOrEmpty => isNull || this!.isEmpty;
  bool get isNotNullOrEmpty => isNotNull && this!.isNotEmpty;
  String? get timestampString => this?.replaceAll(" ", "T");
}
