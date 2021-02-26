part of 'date_picker_i18n.dart';

/// Latvian (LV)
class _StringsLv extends _StringsI18n {
  const _StringsLv();

  @override
  String getCancelText() {
    return 'Atcelt';
  }

  @override
  String getDoneText() {
    return 'Labi';
  }

  @override
  List<String> getMonths() {
    return [
      "Janvāris",
      "Februāris",
      "Marts",
      "Aprīlis",
      "Maijs",
      "Jūnijs",
      "Jūlijs",
      "Augusts",
      "Septembris",
      "Oktobris",
      "Novembris",
      "Decembris"
    ];
  }

  @override
  List<String> getMonthsShort() {
    // https://likumi.lv/ta/id/281651
    return [
      "Janv.",
      "Febr.",
      "Marts",
      "Apr.",
      "Maijs",
      "Jūn.",
      "Jūl.",
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
      "Pirmdiena",
      "Otrdiena",
      "Trešdiena",
      "Ceturtdiena",
      "Piektdiena",
      "Sestdiena",
      "Svētdiena",
    ];
  }

  @override
  List<String> getWeeksShort() {
    // https://vvc.gov.lv/advantagecms/export/docs/komisijas/saisinajumi.pdf
    return [
      "P",
      "O",
      "T",
      "C",
      "Pk",
      "S",
      "Sv",
    ];
  }
}
