import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

abstract class DateParser {
  static const String fullMonth = "MMMM";
  static const String fullYear = "yyyy";
  static const String defaultDateFormat = "dd MMMM, yyyy";
  static const String shortDateFormatWithDayName = "EEEE, dd MMMM";
  static const String defaultDateTimeFormat = "dd MMM yyyy 'at' HH:mma";
  static const String defaultTimeFormat = "HH:mm";
  static const String dateFormatWithFullMonthName = "dd MMMM yyyy";
  static const String dateFormatDayAndFullMonthName = "dd MMMM";
  static const String dateFormatShortDayName = "EE";
  static const String dateFormatDayName = "EEEE";
  static const String utcDateFormat = "yyyy-MM-dd";
  static const String utcDateTimeFormat = "yyyy-MM-dd HH:mm:ss.s";
  static const String fullDateWithDay = "EE, dd MMM yyyy";
  static const String dateWithoutYear = "EE, dd MMM";
  static const String offsetDateFormat = "yyyy-MM-dd'T'HH:mm:ss.s";
  static const String exifDateFormat = "yyyy:MM:dd HH:mm:ss";

  static String getDateString({
    required String? timestamp,
    String outputDateFormat = defaultDateFormat,
    String localeName = 'en',
  }) {
    if (timestamp == null) return "";

    String formattedDate = "";
    try {
      var dateTime = DateTime.tryParse(timestamp);
      var dateTimeLocal = dateTime?.toLocal();

      formattedDate =
          DateFormat(outputDateFormat, localeName).format(dateTimeLocal!);
    } catch (e) {
      Logger().e("$e");
    }

    return formattedDate;
  }

  static String getDateStringFromDateTime({
    required DateTime? dateTime,
    String outputDateFormat = defaultDateFormat,
    String localeName = 'en',
  }) {
    if (dateTime == null) return "";

    String formattedDate = "";
    try {
      formattedDate = DateFormat(outputDateFormat, localeName).format(dateTime);
    } catch (e) {
      Logger().e("$e");
    }

    return formattedDate;
  }

  static DateTime getDateTimeFromDateString(String? date) {
    if (date.isNullOrEmpty) return getCurrentDateTime;

    DateTime convertedDateTime = DateTime.parse(date!);

    return convertedDateTime;
  }

  static DateTime get getCurrentDateTime => DateTime.now();

  static DateTime get getCurrentUtcDateTime => DateTime.now().toUtc();
}
