import 'dart:math';

enum DateTimePickerLocale {
  /// English (EN) United States
  en_us,

  /// Chinese (ZH) Simplified
  zh_cn,

  /// Portuguese (PT) Brazil
  pt_br,

  /// Spanish (ES)
  es,

  /// Romanian (RO)
  ro,

  /// Bengali (BN)
  bn,

  /// Arabic (ar)
  ar
}

const DATETIME_PICKER_LOCALE_DEFAULT = DateTimePickerLocale.en_us;

/// Done widget's text
const Map<DateTimePickerLocale, String> DONE = {
  DateTimePickerLocale.en_us: 'Kies',
  DateTimePickerLocale.zh_cn: '确定',
  DateTimePickerLocale.pt_br: 'Feito',
  DateTimePickerLocale.bn: 'সম্পন্ন',
  DateTimePickerLocale.ar: 'تم',
};

/// Cancel widget's text
const Map<DateTimePickerLocale, String> CANCEL = {
  DateTimePickerLocale.en_us: 'Annuleer',
  DateTimePickerLocale.zh_cn: '取消',
  DateTimePickerLocale.pt_br: 'Cancelar',
  DateTimePickerLocale.bn: 'বাতিল',
   DateTimePickerLocale.ar: 'ألغاء',
};

const List<String> DEFAULT_MONTH = [
  "01",
  "02",
  "03",
  "04",
  "05",
  "06",
  "07",
  "08",
  "09",
  "10",
  "11",
  "12"
];

/// en_US
const List<String> EN_US_MONTHS = [
  "Januari",
  "Februari",
  "Maart",
  "April",
  "Mei",
  "Juni",
  "Juli",
  "Augustus",
  "September",
  "Oktober",
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

/// ro
const List<String> RO_MONTHS = [
  "Ianuarie",
  "Februarie",
  "Martie",
  "Aprilie",
  "Mai",
  "Iunie",
  "Iulie",
  "August",
  "Septembrie",
  "Octombrie",
  "Noiembrie",
  "Decembrie"
];

/// ro
const List<String> BN_MONTHS = [
  "জানুয়ারী",
  "ফেব্রুয়ারি",
  "মার্চ",
  "এপ্রিল",
  "মে",
  "জুন",
  "জুলাই",
  "অগাস্ট",
  "সেপ্টেম্বর",
  "অক্টোবর",
  "নভেম্বর",
  "ডিসেম্বর"
];

/// ar
const List<String> AR_MONTHS = [
  "كانون الثاني",
  "شباط",
  "آذار",
  "نيسان",
  "أيار",
  "حزيران",
  "تموز",
  "آب",
  "أيلول",
  "تشرين الأول",
  "تشرين الثاني",
  "كانون الأول"
];


const Map<DateTimePickerLocale, List<String>> MONTHS = {
  DateTimePickerLocale.en_us: EN_US_MONTHS,
  DateTimePickerLocale.pt_br: PT_BR_MONTHS,
  DateTimePickerLocale.es: ES_MONTHS,
  DateTimePickerLocale.ro: RO_MONTHS,
  DateTimePickerLocale.bn: BN_MONTHS,
  DateTimePickerLocale.ar: AR_MONTHS,
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
  "Tue",
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

/// bn weeks with full name
const List<String> BN_WEEKS_FULL = [
  "রবিবার",
  "সোমবার",
  "মঙ্গলবার",
  "বুধবার",
  "বৃহস্পতিবার",
  "শুক্রবার",
  "শনিবার",
];

/// bn weeks with short name
const List<String> BN_WEEKS_SHORT = [
  "রবি",
  "সোম",
  "মঙ্গল",
  "বুধ",
  "বৃহস্পতি",
  "শুক্র",
  "শনি",
];


/// ar weeks 
const List<String> AR_WEEKS = [
  "الأثنين",
  "الثلاثاء",
  "الأربعاء",
  "الخميس",
  "الجمعه",
  "السبت",
  "الأحد",
];

const Map<DateTimePickerLocale, List<String>> WEEKS_FULL = {
  DateTimePickerLocale.en_us: EN_US_WEEKS_FULL,
  DateTimePickerLocale.zh_cn: ZH_CN_WEEKS_FULL,
  DateTimePickerLocale.pt_br: PT_BR_WEEKS,
  DateTimePickerLocale.es: ES_WEEKS,
  DateTimePickerLocale.bn: BN_WEEKS_FULL,
  DateTimePickerLocale.ar: AR_WEEKS,

};

const Map<DateTimePickerLocale, List<String>> WEEKS_SHORT = {
  DateTimePickerLocale.en_us: EN_US_WEEKS_SHORT,
  DateTimePickerLocale.zh_cn: ZH_CN_WEEKS_SHORT,
  DateTimePickerLocale.bn: BN_WEEKS_SHORT,
};

class DatePickerI18n {
  /// Get done button text
  static String getLocaleDone(DateTimePickerLocale locale) {
    return DONE[locale] ?? DONE[DATETIME_PICKER_LOCALE_DEFAULT];
  }

  /// Get cancel button text
  static String getLocaleCancel(DateTimePickerLocale locale) {
    return CANCEL[locale] ?? DONE[DATETIME_PICKER_LOCALE_DEFAULT];
  }

  /// Get locale month array
  static List<String> getLocaleMonths(DateTimePickerLocale locale) {
    return MONTHS[locale] ?? DEFAULT_MONTH;
  }

  /// Get locale week array
  static List<String> getLocaleWeeks(DateTimePickerLocale locale,
      [bool isFull = true]) {
    if (isFull) {
      return WEEKS_FULL[locale] ?? WEEKS_FULL[DATETIME_PICKER_LOCALE_DEFAULT];
    }

    if (WEEKS_SHORT[locale] != null) {
      return WEEKS_SHORT[locale];
    }
    if (WEEKS_FULL[locale] != null) {
      return WEEKS_FULL[locale]
          .map((item) => item.substring(0, min(3, item.length)))
          .toList();
    }
    return WEEKS_FULL[DATETIME_PICKER_LOCALE_DEFAULT]
        .map((item) => item.substring(0, min(3, item.length)))
        .toList();
  }
}
