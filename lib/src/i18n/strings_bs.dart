part of 'date_picker_i18n.dart';

/// Bosnian (BS)
class _StringsBs extends _StringsI18n {
  const _StringsBs();

  @override
  String getCancelText() {
    return 'Otkaži';
  }

  @override
  String getDoneText() {
    return 'Završi';
  }

  @override
  List<String> getMonths() {
    return [
      "Januar",
      "Februar",
      "Mart",
      "April",
      "Maj",
      "Juni",
      "Juli",
      "August",
      "Septembar",
      "Oktobar",
      "Novembar",
      "Decembar",
    ];
  }

  @override
  List<String> getMonthsShort() {
    return null;
  }

  @override
  List<String> getWeeksFull() {
    return [
      "Ponedjeljak",
      "Utorak",
      "Srijeda",
      "Četvrtak",
      "Petak",
      "Subota",
      "Nedjelja",
    ];
  }

  @override
  List<String> getWeeksShort() {
    return [
      "Pon",
      "Uto",
      "Sri",
      "Čet",
      "Pet",
      "Sub",
      "Ned",
    ];
  }
}
