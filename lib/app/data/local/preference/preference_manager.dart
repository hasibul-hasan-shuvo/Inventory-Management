abstract class PreferenceManager {
  static const DATABASE_NAME = "dental_inventory";
  static const KEY_TOKEN = "token";
  static const THEME = "theme";
  static const LANGUAGE = "language";
  static const String REFRESH_TOKEN = 'refresh';
  static const String INVENTORY_ID = 'inventory_id';
  static const String USER_DATA = 'user_data';
  static const String IS_USER_ACCOUNT_SET = 'is_user_account_set';
  static const String INVENTORY_LAST_SYNC_TIME_STAMP =
      'inventory_last_sync_time_stamp';
  static const String SHOPPING_CART_LAST_SYNC_TIME_STAMP =
      'shopping_cart_last_sync_time_stamp';
  static const String SCANNER_CAMERA_STATE = 'scanner_camera_state';


  String getString(String key, {String defaultValue = ""});

  void setString(String key, String value);

  int getInt(String key, {int defaultValue = 0});

  void setInt(String key, int value);

  double getDouble(String key, {double defaultValue = 0.0});

  void setDouble(String key, double value);

  bool getBool(String key, {bool defaultValue = false});

  void setBool(String key, bool value);

  List<String> getStringList(String key,
      {List<String> defaultValue = const []});

  void setStringList(String key, List<String> value);

  void remove(String key);

  void clear();
}
