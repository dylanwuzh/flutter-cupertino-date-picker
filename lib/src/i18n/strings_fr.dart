part of 'date_picker_i18n.dart';

/// French (FR)
class _StringsFr extends _StringsI18n {
  const _StringsFr();

  @override
  String getCancelText() {
    return 'Annuler';
  }

  @override
  String getDoneText() {
    return 'Accepter';
  }

  @override
  List<String> getMonths() {
    return [
      "Janvier",
      "Février",
      "Mars",
      "Avril",
      "Mai",
      "Juin",
      "Juillet",
      "Août",
      "Septembre",
      "Octobre",
      "Novembre",
      "Décembre",
    ];
  }

  @override
  List<String> getWeeksFull() {
    return [
      "Lundi",
      "Mardi",
      "Mercredi",
      "Jeudi",
      "Vendredi",
      "Samedi",
      "Dimanche",
    ];
  }

  @override
  List<String> getWeeksShort() {
    return [
      "Lun.",
      "Mar.",
      "Mer.",
      "Jeu.",
      "Ven.",
      "Sam.",
      "Dim.",
    ];
  }

  @override
  List<String> getMonthsShort() {
    // TODO: implement getMonthsShort
    return null;
  }
}
