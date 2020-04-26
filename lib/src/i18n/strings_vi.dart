part of 'date_picker_i18n.dart';

/// Vietnamese (VI) Vietnam
class _StringsVn extends _StringsI18n {
  const _StringsVn();

  @override
  String getCancelText() {
    return 'Hủy';
  }

  @override
  String getDoneText() {
    return 'Xong';
  }

  @override
  List<String> getMonths() {
    return [
      "Tháng 1",
      "Tháng 2",
      "Tháng 3",
      "Tháng 4",
      "Tháng 5",
      "Tháng 6",
      "Tháng 7",
      "Tháng 8",
      "Tháng 9",
      "Tháng 10",
      "Tháng 11",
      "Tháng 12"
    ];
  }

  @override
  List<String> getMonthsShort() {
    return null;
  }

  @override
  List<String> getWeeksFull() {
    return [
      "Thứ 2",
      "Thứ 3",
      "Thứ 4",
      "Thứ 5",
      "Thứ 6",
      "Thứ 7",
      "Chủ nhật",
    ];
  }

  @override
  List<String> getWeeksShort() {
    return ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];
  }
}
