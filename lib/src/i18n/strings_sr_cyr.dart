part of 'date_picker_i18n.dart';

/// English (EN) United States
class _StringsEnUs extends _StringsI18n {
  const _StringsEnUs();

  @override
  String getCancelText() {
    return 'Откажи';
  }

  @override
  String getDoneText() {
    return 'Изабери';
  }

  @override
  List<String> getMonths() {
    return [
      "Јануар",
      "Фебруар",
      "Март",
      "Април",
      "Мај",
      "Јун",
      "Јул",
      "Август",
      "Септембар",
      "Октобар",
      "Новембар",
      "Децембар"
    ];
  }

  @override
  List<String> getWeeksFull() {
    return [
      "Понедељак",
      "Уторак",
      "Среда",
      "Четвртак",
      "Петак",
      "Субота",
      "Недеља",
    ];
  }

  @override
  List<String> getWeeksShort() {
    return [
      "Пон",
      "Уто",
      "Сре",
      "Чет",
      "Пет",
      "Суб",
      "Нед",
    ];
  }
}