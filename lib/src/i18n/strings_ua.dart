part of 'date_picker_i18n.dart';

/// Ukraine (UA)
class _StringsUa extends _StringsI18n {
  const _StringsUa();

  @override
  String getCancelText() {
    return 'Скасувати';
  }

  @override
  String getDoneText() {
    return 'Готово';
  }

  @override
  List<String> getMonths() {
    return [
      "Cічень",
      "Лютий",
      "Березень",
      "Квітень",
      "Травень",
      "Червень",
      "Липень",
      "Серпень",
      "Вересень",
      "Жовтень",
      "Листопад",
      "Грудень",
    ];
  }

  @override
  List<String> getWeeksFull() {
    return [
      "Понеділок",
      "Вівторок",
      "Середа",
      "Четвер",
      "П\'ятниця",
      "Субота",
      "Неділя",
    ];
  }

  @override
  List<String> getWeeksShort() {
    return [
      "пн",
      "вт",
      "ср",
      "чт",
      "пт",
      "сб",
      "нд",
    ];
  }
}
