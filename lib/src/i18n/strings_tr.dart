part of 'date_picker_i18n.dart';

/// Turkish (TR)
class _StringsTr extends _StringsI18n {
  const _StringsTr();

  @override
  String getCancelText() {
    return 'Vazgeç';
  }

  @override
  String getDoneText() {
    return 'Tamam';
  }

  @override
  List<String> getMonths() {
    return [
      "Ocak",
      "Şubat",
      "Mart",
      "Nisan",
      "Mayıs",
      "Haziran",
      "Temmuz",
      "Ağustos",
      "Eylül",
      "Ekim",
      "Kasım",
      "Aralık"
    ];
  }

  @override
   List<String> getMonthsShort() {
    return [
      "Ock.",
      "Şub.",
      "Mar.",
      "Nis.",
      "May",
      "Haz",
      "Tem.",
      "Ağu.",
      "Eyl.",
      "Eki.",
      "Kas.",
      "Ara.",
    ];
  }

  @override
  List<String> getWeeksFull() {
    return [
      "Pazartesi",
      "Salı",
      "Çarşamba",
      "Perşembe",
      "Cuma",
      "Cumartesi",
      "Pazar",
    ];
  }

  @override
  List<String> getWeeksShort() {
    return [
      "Pzt",
      "Sal",
      "Çrş",
      "Per",
      "Cum",
      "Cmt",
      "Pzr",
    ];
  }
}
