import 'package:url_launcher/url_launcher_string.dart';

abstract class UrlLauncher {
  static Future<bool> launchUrl(String url) {
    return canLaunchUrlString(url).then((bool canLaunch) {
      if (canLaunch) {
        return launchUrlString(url);
      }

      return canLaunch;
    });
  }
}
