part of 'date_picker_i18n.dart';

/// Arabic (ar) Egypt
class _StringsArEg extends _StringsI18n {
  const _StringsArEg();

  @override
  String getCancelText() {
    return 'إلغاء';
  }

  @override
  String getDoneText() {
    return 'تم';
  }

  @override
  List<String> getMonths() {
    return [
      "يناير",
      "فبراير",
      "مارس",
      "أبريل",
      "مايو",
      "يونيو",
      "يوليو",
      "أغسطس",
      "سبتمبر",
      "أكتوبر",
      "نوفمبر",
      "ديسمبر"
    ];
  }

  @override
  List<String> getMonthsShort() {
    return null;
  }

  @override
  List<String> getWeeksFull() {
    return [
      "الأثنين",
      "الثلاثاء",
      "الأربعاء",
      "الخميس",
      "الجمعه",
      "السبت",
      "الأحد",
    ];
  }

  @override
  List<String> getWeeksShort() {
    return [
      "ن",
      "ث",
      "ر",
      "خ",
      "ج",
      "س",
      "ح",
    ];
  }
}
