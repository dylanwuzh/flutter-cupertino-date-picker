part of 'date_picker_i18n.dart';

/// Bahasa (IN) Indonesia
class _StringsIdId extends _StringsI18n {
  const _StringsIdId();

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
  List<String> getWeeksFull() {
    return ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu'];
  }

  @override
  List<String> getWeeksShort() {
    return ['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Min'];
  }
}
