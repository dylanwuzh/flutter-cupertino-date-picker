part of 'date_picker_i18n.dart';

/// Georgian (GE)
class _StringsGe extends _StringsI18n {
  const _StringsGe();

  @override
  String getCancelText() {
    return 'გაუქმება';
  }

  @override
  String getDoneText() {
    return 'დასრულება';
  }

  @override
  List<String> getMonths() {
    return [
      "იანვარი",
      "თებერვალი",
      "მარტი",
      "აპრილი",
      "მაისი",
      "ივნისი",
      "ივლისი",
      "აგვისტო",
      "სექტემბერი",
      "ოქტომბერი",
      "ნოემბერი",
      "დეკემბერი",
    ];
  }

  @override
  List<String> getWeeksFull() {
    return [
      "ორშაბათი",
      "სამშაბათი",
      "ოთხშაბათი",
      "ხუთშაბათი",
      "პარასკევი",
      "შაბათი",
      "კვირა",
    ];
  }

  @override
  List<String> getWeeksShort() {
    return [
      "ორშ",
      "სამშ",
      "ოთხ",
      "ხუთ",
      "პარ",
      "შაბ",
      "კვ",
    ];
  }
    @override
  List<String> getMonthsShort() {
    // TODO: implement getMonthsShort
    return null;
  }
}

