enum DatePickerLocale {
  en_us,

  zh_cn,

  pt_br,

  es,
}

const DATETIME_PICKER_LOCALE_DEFAULT = DatePickerLocale.en_us;

const Map<DatePickerLocale, String> DONE = {
  DatePickerLocale.en_us: 'Done',
  DatePickerLocale.zh_cn: '确定',
  DatePickerLocale.pt_br: 'Feito',
};

const Map<DatePickerLocale, String> CANCEL = {
  DatePickerLocale.en_us: 'Cancel',
  DatePickerLocale.zh_cn: '取消',
  DatePickerLocale.pt_br: 'Cancelar',
};

const List<String> DEFAULT_MONTH = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"];

const List<String> EN_US_MONTH = [
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

const List<String> ES_MONTH = [
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

const List<String> PT_BR_MONTH = [
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
  DatePickerLocale.en_us: EN_US_MONTH,
  DatePickerLocale.pt_br: PT_BR_MONTH,
  DatePickerLocale.es: ES_MONTH,
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
}
