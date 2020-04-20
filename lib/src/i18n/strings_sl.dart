part of 'date_picker_i18n.dart';

/// Slovenian
class _StringsSl extends _StringsI18n {
  const _StringsSl();

  @override
  String getCancelText() {
    return 'Prekliči';
  }

  @override
  String getDoneText() {
    return 'Done';
  }

  @override
  List<String> getMonths() {
    return [
      "Januar",
      "Februar",
      "Marec",
      "April",
      "Maj",
      "Junij",
      "Julij",
      "Avgust",
      "September",
      "Oktober",
      "November",
      "December"
    ];
  }

  @override
  List<String> getWeeksFull() {
    return [
      "Ponedeljek",
      "Torek",
      "Sreda",
      "Četrtek",
      "Petek",
      "Sobota",
      "Nedelja",
    ];
  }

  @override
  List<String> getWeeksShort() {
    return [
      "Pon",
      "Tor",
      "Sre",
      "Čet",
      "Pet",
      "Sob",
      "Ned",
    ];
  }
}
