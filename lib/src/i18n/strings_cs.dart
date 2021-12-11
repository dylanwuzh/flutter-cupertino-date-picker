part of 'date_picker_i18n.dart';

/// Czech (CZ)
class _StringsCs extends _StringsI18n {
  const _StringsCs();

  @override
  String getCancelText() {
    return 'Zrušit';
  }

  @override
  String getDoneText() {
    return 'Hotovo';
  }

  @override
  List<String> getMonths() {
    return [
      "leden",
      "únor",
      "březen",
      "duben",
      "květen",
      "červen",
      "červenec",
      "srpen",
      "září",
      "říjen",
      "listopad",
      "prosinec"
    ];
  }

  @override
  List<String> getMonthsShort() {
    /// Doesn't exist formal method of enrollment
    /// https://prirucka.ujc.cas.cz/?id=810&dotaz=kalend%C3%A1%C5%99n%C3%AD%20datum
    return [
      "leden",
      "únor",
      "březen",
      "duben",
      "květen",
      "červen",
      "červenec",
      "srpen",
      "září",
      "říjen",
      "listopad",
      "prosinec"
    ];
  }

  @override
  List<String> getWeeksFull() {
    return [
      "pondělí",
      "úterý",
      "středa",
      "čtvrtek",
      "pátek",
      "sobota",
      "neděle",
    ];
  }

  @override
  List<String> getWeeksShort() {
    return [
      "po",
      "út",
      "st",
      "čt",
      "pá",
      "so",
      "ne",
    ];
  }
}
