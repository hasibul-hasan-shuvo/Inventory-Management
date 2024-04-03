class ItemHomeMenuUiModel {
  final String icon;
  final String title;
  final String route;
  final String badgeKey;
  final dynamic arguments;

  ItemHomeMenuUiModel({
    required this.icon,
    required this.title,
    required this.route,
    this.badgeKey = '',
    this.arguments,
  });
}
