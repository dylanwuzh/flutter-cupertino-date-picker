part of 'date_picker_i18n.dart';

/// Hungarian
class _StringsHu extends _StringsI18n {
  const _StringsHu();

  @override
  String getCancelText() {
    return 'Mégsem';
  }

  @override
  String getDoneText() {
    return 'Mentés';
  }

  @override
  List<String> getMonths() {
    return [
      "Január",
      "Február",
      "Március",
      "Április",
      "Május",
      "Június",
      "Július",
      "Augusztus",
      "Szeptember",
      "Október",
      "November",
      "December"
    ];
  }

  @override
  List<String> getWeeksFull() {
    return [
      "Hétfő",
      "Kedd",
      "Szerda",
      "Csütörtök",
      "Péntek",
      "Szombat",
      "Vasárnap",
    ];
  }

  @override
  List<String> getWeeksShort() {
    return [
      "H",
      "K",
      "Sze",
      "Cs",
      "P",
      "Szo",
      "V",
    ];
  }
}
