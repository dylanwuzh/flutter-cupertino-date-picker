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
  ar,

  /// Japanese (JP)
  jp,

  /// Russian (RU)
  ru,

  /// German (DE)
  de,

  /// Korea (KO)
  ko,
}

const DATETIME_PICKER_LOCALE_DEFAULT = DateTimePickerLocale.en_us;

/// Done widget's text
const Map<DateTimePickerLocale, String> DONE = {
  DateTimePickerLocale.en_us: 'Done',
  DateTimePickerLocale.zh_cn: '确定',
  DateTimePickerLocale.pt_br: 'Feito',
  DateTimePickerLocale.bn: 'সম্পন্ন',
  DateTimePickerLocale.ar: 'تم',
  DateTimePickerLocale.jp: '完了',
  DateTimePickerLocale.ru: 'Готово',
  DateTimePickerLocale.de: 'Fertig',
  DateTimePickerLocale.ko: '완료',
};

/// Cancel widget's text
const Map<DateTimePickerLocale, String> CANCEL = {
  DateTimePickerLocale.en_us: 'Cancel',
  DateTimePickerLocale.zh_cn: '取消',
  DateTimePickerLocale.pt_br: 'Cancelar',
  DateTimePickerLocale.bn: 'বাতিল',
  DateTimePickerLocale.ar: 'ألغاء',
  DateTimePickerLocale.jp: 'キャンセル',
  DateTimePickerLocale.ru: 'Отмена',
  DateTimePickerLocale.de: 'Abbrechen',
  DateTimePickerLocale.ko: '취소',
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

/// ro
const List<String> JP_MONTHS = [
  "1月",
  "2月",
  "3月",
  "4月",
  "5月",
  "6月",
  "7月",
  "8月",
  "9月",
  "10月",
  "11月",
  "12月"
];

// russian months
const List<String> RU_MONTHS = [
  "Январь",
  "Февраль",
  "Март",
  "Апрель",
  "Май",
  "Июнь",
  "Июль",
  "Август",
  "Сентябрь",
  "Октябрь",
  "Ноябрь",
  "Декабрь",
];

// german months
const List<String> DE_MONTHS = [
  "Januar",
  "Februar",
  "März",
  "April",
  "Mai",
  "Juni",
  "Juli",
  "August",
  "September",
  "Oktober",
  "November",
  "Dezember",
];

/// korea months
const List<String> KO_MONTHS = [
  "1월",
  "2월",
  "3월",
  "4월",
  "5월",
  "6월",
  "7월",
  "8월",
  "9월",
  "10월",
  "11월",
  "12월"
];

const Map<DateTimePickerLocale, List<String>> MONTHS = {
  DateTimePickerLocale.en_us: EN_US_MONTHS,
  DateTimePickerLocale.pt_br: PT_BR_MONTHS,
  DateTimePickerLocale.es: ES_MONTHS,
  DateTimePickerLocale.ro: RO_MONTHS,
  DateTimePickerLocale.bn: BN_MONTHS,
  DateTimePickerLocale.ar: AR_MONTHS,
  DateTimePickerLocale.jp: JP_MONTHS,
  DateTimePickerLocale.ru: RU_MONTHS,
  DateTimePickerLocale.de: DE_MONTHS,
  DateTimePickerLocale.ko: KO_MONTHS,
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

/// jp weeks with full name
const List<String> JP_WEEKS_FULL = [
  "月曜日",
  "火曜日",
  "水曜日",
  "木曜日",
  "金曜日",
  "土曜日",
  "日曜日",
];

/// jp weeks with short name
const List<String> JP_WEEKS_SHORT = [
  "月",
  "火",
  "水",
  "木",
  "金",
  "土",
  "日",
];

/// russian weeks with full name
const List<String> RU_WEEKS_FULL = [
  "Понедельник",
  "Вторник",
  "Среда",
  "Четверг",
  "Пятница",
  "Суббота",
  "Воскресенье",
];

/// russian weeks with short name
const List<String> RU_WEEKS_SHORT = [
  "пн",
  "вт",
  "ср",
  "чт",
  "пт",
  "сб",
  "вс",
];

/// de_DE weeks with full name
const List<String> DE_WEEKS_FULL = [
  "Montag",
  "Dienstag",
  "Mittwoch",
  "Donnerstag",
  "Freitag",
  "Samstag",
  "Sonntag",
];

/// de_DE weeks with short name
const List<String> DE_WEEKS_SHORT = [
  "Mo",
  "Di",
  "Mi",
  "Do",
  "Fr",
  "Sa",
  "So",
];

/// korea weeks with full name
const List<String> KO_WEEKS_FULL = [
  "월요일",
  "화요일",
  "수요일",
  "목요일",
  "금요일",
  "토요일",
  "일요일",
];

/// korea weeks with short name
const List<String> KO_WEEKS_SHORT = [
  "월",
  "화",
  "수",
  "목",
  "금",
  "토",
  "일",
];

const Map<DateTimePickerLocale, List<String>> WEEKS_FULL = {
  DateTimePickerLocale.en_us: EN_US_WEEKS_FULL,
  DateTimePickerLocale.zh_cn: ZH_CN_WEEKS_FULL,
  DateTimePickerLocale.pt_br: PT_BR_WEEKS,
  DateTimePickerLocale.es: ES_WEEKS,
  DateTimePickerLocale.bn: BN_WEEKS_FULL,
  DateTimePickerLocale.ar: AR_WEEKS,
  DateTimePickerLocale.jp: JP_WEEKS_FULL,
  DateTimePickerLocale.ru: RU_WEEKS_FULL,
  DateTimePickerLocale.de: DE_WEEKS_FULL,
  DateTimePickerLocale.ko: KO_WEEKS_FULL,
};

const Map<DateTimePickerLocale, List<String>> WEEKS_SHORT = {
  DateTimePickerLocale.en_us: EN_US_WEEKS_SHORT,
  DateTimePickerLocale.zh_cn: ZH_CN_WEEKS_SHORT,
  DateTimePickerLocale.bn: BN_WEEKS_SHORT,
  DateTimePickerLocale.jp: JP_WEEKS_SHORT,
  DateTimePickerLocale.ru: RU_WEEKS_SHORT,
  DateTimePickerLocale.de: DE_WEEKS_SHORT,
  DateTimePickerLocale.ko: KO_WEEKS_SHORT,
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
