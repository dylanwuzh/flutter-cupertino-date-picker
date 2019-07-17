part of 'date_picker_i18n.dart';

/// Bengali (BN)
class _StringsBn extends _StringsI18n {
  const _StringsBn();

  @override
  String getCancelText() {
    return 'বাতিল';
  }

  @override
  String getDoneText() {
    return 'সম্পন্ন';
  }

  @override
  List<String> getMonths() {
    return [
      "জানুয়ারী",
      "ফেব্রুয়ারি",
      "মার্চ",
      "এপ্রিল",
      "মে",
      "জুন",
      "জুলাই",
      "অগাস্ট",
      "সেপ্টেম্বর",
      "অক্টোবর",
      "নভেম্বর",
      "ডিসেম্বর"
    ];
  }

  @override
  List<String> getWeeksFull() {
    return [
      "রবিবার",
      "সোমবার",
      "মঙ্গলবার",
      "বুধবার",
      "বৃহস্পতিবার",
      "শুক্রবার",
      "শনিবার",
    ];
  }

  @override
  List<String> getWeeksShort() {
    return [
      "রবি",
      "সোম",
      "মঙ্গল",
      "বুধ",
      "বৃহস্পতি",
      "শুক্র",
      "শনি",
    ];
  }
}
