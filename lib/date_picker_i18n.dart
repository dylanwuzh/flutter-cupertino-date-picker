import 'dart:math';

import 'package:flutter/cupertino.dart';

enum DatePickerLocale {
  // English (EN) United States
  en_us,

  // Chinese (ZH) Simplified
  zh_cn,

  // Portuguese (PT) Brazil
  pt_br,

  // Spanish (ES)
  es,
}

const DATETIME_PICKER_LOCALE_DEFAULT = DatePickerLocale.en_us;

/// Done widget's text
const Map<DatePickerLocale, String> DONE = {
  DatePickerLocale.en_us: 'Done',
  DatePickerLocale.zh_cn: '确定',
  DatePickerLocale.pt_br: 'Feito',
};

/// Cancel widget's text
const Map<DatePickerLocale, String> CANCEL = {
  DatePickerLocale.en_us: 'Cancel',
  DatePickerLocale.zh_cn: '取消',
  DatePickerLocale.pt_br: 'Cancelar',
};

const List<String> DEFAULT_MONTH = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"];

/// en_US
const List<String> EN_US_MONTHS = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
];

/// es
const List<String> ES_MONTHS = [
  "Enero",
  "Febrero",
  "Marzo",
  "Abril",
  "Mayo",
  "Junio",
  "Julio",
  "Agosto",
  "Septiembre",
  "Octubre",
  "Noviembre",
  "Diciembre"
];

/// pt_BR
const List<String> PT_BR_MONTHS = [
  "Janeiro",
  "Fevereiro",
  "Março",
  "Abril",
  "Maio",
  "Junho",
  "Julho",
  "Agosto",
  "Setembro",
  "Outubro",
  "Novembro",
  "Dezembro"
];

const Map<DatePickerLocale, List<String>> MONTHS = {
  DatePickerLocale.en_us: EN_US_MONTHS,
  DatePickerLocale.pt_br: PT_BR_MONTHS,
  DatePickerLocale.es: ES_MONTHS,
};

/// en_US weeks with full name
const List<String> EN_US_WEEKS_FULL = [
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
  "Sunday",
];

/// en_US weeks with short name
const List<String> EN_US_WEEKS_SHORT = [
  "Mon",
  "Tues",
  "Wed",
  "Thur",
  "Fri",
  "Sat",
  "Sun",
];

/// es 西班牙语
const List<String> ES_WEEKS = [
  "Lunes",
  "Martes",
  "Miercoles",
  "Jueves",
  "Viernes",
  "Sabado",
  "Domingo",
];

/// pt_BR 葡萄牙语
const List<String> PT_BR_WEEKS = [
  "Segunda",
  "Terca",
  "Quarta",
  "Quinta",
  "Sexta",
  "Sabado",
  "Domingo",
];

/// zh_CN  weeks with full name
const List<String> ZH_CN_WEEKS_FULL = [
  "星期一",
  "星期二",
  "星期三",
  "星期四",
  "星期五",
  "星期六",
  "星期日",
];

/// zh_CN  weeks with short name
const List<String> ZH_CN_WEEKS_SHORT = [
  "周一",
  "周二",
  "周三",
  "周四",
  "周五",
  "周六",
  "周日",
];

const Map<DatePickerLocale, List<String>> WEEKS_FULL = {
  DatePickerLocale.en_us: EN_US_WEEKS_FULL,
  DatePickerLocale.zh_cn: ZH_CN_WEEKS_FULL,
  DatePickerLocale.pt_br: PT_BR_WEEKS,
  DatePickerLocale.es: ES_WEEKS,
};

const Map<DatePickerLocale, List<String>> WEEKS_SHORT = {
  DatePickerLocale.en_us: EN_US_WEEKS_SHORT,
  DatePickerLocale.zh_cn: ZH_CN_WEEKS_SHORT,
};

class DatePickerI18n {
  /// Get done button text
  static String getLocaleDone(DatePickerLocale locale) {
    return DONE[locale] ?? DONE[DATETIME_PICKER_LOCALE_DEFAULT];
  }

  /// Get cancel button text
  static String getLocaleCancel(DatePickerLocale locale) {
    return CANCEL[locale] ?? DONE[DATETIME_PICKER_LOCALE_DEFAULT];
  }

  /// Get locale month array
  static List<String> getLocaleMonths(DatePickerLocale locale) {
    return MONTHS[locale] ?? DEFAULT_MONTH;
  }

  /// Get locale week array
  static List<String> getLocaleWeeks(DatePickerLocale locale, [bool isFull = true]) {
    if (isFull) {
      return WEEKS_FULL[locale] ?? WEEKS_FULL[DATETIME_PICKER_LOCALE_DEFAULT];
    }

    if (WEEKS_SHORT[locale] == null && WEEKS_FULL[locale] != null) {
      return WEEKS_FULL[locale].map((item) => item.substring(0, min(3, item.length))).toList();
    }
    return WEEKS_FULL[DATETIME_PICKER_LOCALE_DEFAULT].map((item) => item.substring(0, min(3, item.length))).toList();
  }
}
