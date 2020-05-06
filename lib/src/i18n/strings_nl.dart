part of 'date_picker_i18n.dart';

/// Dutch (NL)
class _StringsNl extends _StringsI18n {
  const _StringsNl();

  @override
  String getCancelText() {
    return 'Annuleer';
  }

  @override
  String getDoneText() {
    return 'Bewaar';
  }

  @override
  List<String> getMonths() {
    return [
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
      "December",
    ];
  }

  @override
  List<String> getMonthsShort() {
    return [
      "Jan.",
      "Febr.",
      "Maart",
      "Apr.",
      "Mei",
      "Juni",
      "Juli",
      "Aug.",
      "Sept.",
      "Okt.",
      "Nov.",
      "Dec.",
    ];
  }

  @override
  List<String> getWeeksFull() {
    return [
      "Maandag",
      "Dinsdag",
      "Woensdag",
      "Donderdag",
      "Vrijdag",
      "Zaterdag",
      "Zondag",
    ];
  }

  @override
  List<String> getWeeksShort() {
    return [
      "Ma.",
      "Di.",
      "Wo.",
      "Do.",
      "Vr.",
      "Za.",
      "Zo.",
    ];
  }
}
