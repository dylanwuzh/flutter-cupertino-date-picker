import 'dart:math';
import 'package:flutter_cupertino_date_picker/date_picker_constants.dart';
import 'package:flutter_cupertino_date_picker/date_picker_i18n.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

const String DATE_FORMAT_SEPARATOR = r'[-\._: ]';

class DateTimeFormatter {
  /// Get default value of date format.
  static String generateDateFormat(String dateFormat, DateTimePickerMode pickerMode) {
    if (dateFormat != null && dateFormat.length > 0) {
      return dateFormat;
    }
    switch (pickerMode) {
      case DateTimePickerMode.date:
        return DATETIME_PICKER_DATE_FORMAT;
      case DateTimePickerMode.time:
        return DATETIME_PICKER_TIME_FORMAT;
    }
    return '';
  }

  /// Split date format to array.
  static List<String> splitDateFormat(String dateFormat) {
    if (dateFormat == null || dateFormat.length == 0) {
      return [];
    }
    return dateFormat.split(new RegExp(DATE_FORMAT_SEPARATOR));
  }

  /// Format datetime string
  static String formatDateTime(int value, String format, DatePickerLocale locale) {
    if (format == null || format.length == 0) {
      return value.toString();
    }

    // format year text
    if (format.contains('y')) {
      return _formatYear(value, format, locale);
    }
    // format month text
    else if (format.contains('M')) {
      return _formatMonth(value, format, locale);
    }
    // format day text
    else if (format.contains('d')) {
      return _formatDay(value, format, locale);
    }
    // format hour text
    else if (format.contains('H')) {
      return _formatHour(value, format, locale);
    }
    // format minute text
    else if (format.contains('m')) {
      return _formatMinute(value, format, locale);
    }
    // format second text
    else if (format.contains('s')) {
      return _formatSecond(value, format, locale);
    }
    return value.toString();
  }

  /// format year text
  static String _formatYear(int value, String format, DatePickerLocale locale) {
    if (format.contains('yyyy')) {
      // yyyy: the digit count of year is 4, e.g. 2019
      return format.replaceAll('yyyy', value.toString());
    } else if (format.contains('yy')) {
      // yy: the digit count of year is 2, e.g. 19
      return format.replaceAll('yy', value.toString().substring(max(0, value.toString().length - 2)));
    }
    return value.toString();
  }

  /// format month text
  static String _formatMonth(int value, String format, DatePickerLocale locale) {
    List<String> months = DatePickerI18n.getLocaleMonths(locale);
    if (format.contains('MMMM')) {
      // MMMM: the full name of month, e.g. January
      return format.replaceAll('MMMM', months[value - 1]);
    } else if (format.contains('MMM')) {
      // MMM: the short name of month, e.g. Jan
      String month = months[value - 1];
      return format.replaceAll('MMM', month.substring(0, min(3, month.length)));
    }
    return _formatNumber(value, format, 'M');
  }

  /// format day text
  static String _formatDay(int value, String format, DatePickerLocale locale) {
    return _formatNumber(value, format, 'd');
  }

  /// format hour text
  static String _formatHour(int value, String format, DatePickerLocale locale) {
    return _formatNumber(value, format, 'H');
  }

  /// format minute text
  static String _formatMinute(int value, String format, DatePickerLocale locale) {
    return _formatNumber(value, format, 'm');
  }

  /// format second text
  static String _formatSecond(int value, String format, DatePickerLocale locale) {
    return _formatNumber(value, format, 's');
  }

  /// format number, if the digit count is 2, will pad zero on the left
  static String _formatNumber(int value, String format, String unit) {
    if (format.contains('$unit$unit')) {
      return format.replaceAll('$unit$unit', value.toString().padLeft(2, '0'));
    } else if (format.contains('$unit')) {
      return format.replaceAll('$unit', value.toString());
    }
    return value.toString();
  }
}
