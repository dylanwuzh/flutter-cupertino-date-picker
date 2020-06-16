part of 'date_picker_i18n.dart';

/// Portuguese (PT) Brazil
class _StringsPtBr extends _StringsI18n {
  const _StringsPtBr();

  @override
  String getCancelText() {
    return 'Cancelar';
  }

  @override
  String getDoneText() {
    return 'Confirmar';
  }

  @override
  List<String> getMonths() {
    return [
      "Janeiro",
      "Fevereiro",
      "Março",
      "Abril",
      "Maio",
      "Junho",
      "Julho",
      "Agosto",
      "Setembro",
      "Outubro",
      "Novembro",
      "Dezembro"
    ];
  }

  @override
  List<String> getMonthsShort() {
    return [
      "Jan.",
      "Fev.",
      "Mar.",
      "Abr.",
      "Mai.",
      "Jun.",
      "Jul.",
      "Ago.",
      "Set.",
      "Out.",
      "Nov.",
      "Dez.",
    ];
  }

  @override
  List<String> getWeeksFull() {
    return [
      "Segunda",
      "Terca",
      "Quarta",
      "Quinta",
      "Sexta",
      "Sabado",
      "Domingo",
    ];
  }

  @override
  List<String> getWeeksShort() {
    return [
      "Seg",
      "Ter",
      "Qua",
      "Qui",
      "Sex",
      "Sab",
      "Dom",
    ];
  }
}
