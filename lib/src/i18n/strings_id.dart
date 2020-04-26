part of 'date_picker_i18n.dart';

/// Indonesia (ID)
class _StringsId extends _StringsI18n {
  const _StringsId();

  @override
  String getCancelText() {
    return 'Batalkan';
  }

  @override
  String getDoneText() {
    return 'Simpan';
  }

  @override
  List<String> getMonths() {
    return [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember'
    ];
  }

  @override
  List<String> getMonthsShort() {
    return null;
  }

  @override
  List<String> getWeeksFull() {
    return ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu'];
  }

  @override
  List<String> getWeeksShort() {
    return ['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Min'];
  }
}
