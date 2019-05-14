import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_cupertino_date_picker/constants.dart';
import 'package:flutter_cupertino_date_picker/locale_message.dart';

/// DatePicker widget.
///
/// @author dylan wu
/// @since 2019-05-10
class DatePickerWidget extends StatefulWidget {
  DatePickerWidget({
    Key key,
    @deprecated this.minYear,
    @deprecated this.maxYear,
    this.minDateTime,
    this.maxDateTime,
    this.initDateTime,
    this.dateFormat: DATE_PICKER_FORMAT_DEFAULT,
    this.showTitleActions: false,
    this.locale: 'zh',
    this.backgroundColor: Colors.white,
    this.cancel,
    this.confirm,
    this.onCancel,
    this.onChanged,
    this.onConfirm,
    this.onChanged2,
    this.onConfirm2,
  }) : super(key: key);

  @deprecated
  final int minYear, maxYear;

  final DateTime minDateTime, maxDateTime, initDateTime;
  final String dateFormat;

  final bool showTitleActions;
  final String locale;
  final Color backgroundColor;

  final Widget cancel, confirm;
  final DateVoidCallback onCancel;
  final DateChangedCallback onChanged, onConfirm;
  final DateValueCallback onChanged2, onConfirm2;

  @override
  State<StatefulWidget> createState() => _DatePickerWidgetState(
      this.minDateTime, this.maxDateTime, this.initDateTime,
      minYear: this.minYear, maxYear: this.maxYear);
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime _minDateTime, _maxDateTime;
  int _currYear, _currMonth, _currDay;
  List<int> _monthRange, _dayRange;
  FixedExtentScrollController _yearScrollCtrl, _monthScrollCtrl, _dayScrollCtrl;

  _DatePickerWidgetState(
      DateTime minDateTime, DateTime maxDateTime, DateTime initDateTime,
      {int minYear: DATE_PICKER_MIN_YEAR_DEFAULT,
      int maxYear: DATE_PICKER_MAX_YEAR_DEFAULT}) {
    if (initDateTime == null) {
      initDateTime = DateTime.now();
    }
    this._currYear = initDateTime.year;
    this._currMonth = initDateTime.month;
    this._currDay = initDateTime.day;

    // limit the range of year
    this._minDateTime =
        minDateTime ?? DateTime(minYear ?? DATE_PICKER_MIN_YEAR_DEFAULT);
    this._maxDateTime =
        maxDateTime ?? DateTime(maxYear ?? DATE_PICKER_MAX_YEAR_DEFAULT);
    this._currYear =
        min(max(_minDateTime.year, this._currYear), _maxDateTime.year);

    // limit the range of month
    this._monthRange = _calcMonthRange();
    this._currMonth =
        min(max(this._monthRange[0], this._currMonth), this._monthRange[1]);

    // limit the range of day
    this._dayRange = _calcDayRange();
    this._currDay =
        min(max(this._dayRange[0], this._currDay), this._dayRange[1]);

    // create scroll controller
    _yearScrollCtrl =
        FixedExtentScrollController(initialItem: _currYear - _minDateTime.year);
    _monthScrollCtrl = FixedExtentScrollController(initialItem: _currMonth - 1);
    _dayScrollCtrl = FixedExtentScrollController(initialItem: _currDay - 1);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Material(
          color: Colors.transparent, child: _renderPickerView(context)),
    );
  }

  /// render date picker widgets
  Widget _renderPickerView(BuildContext context) {
    Widget datePickerWidget = _renderDatePickerWidget();
    if (widget.showTitleActions) {
      return Column(
          children: <Widget>[_renderTitleWidget(context), datePickerWidget]);
    }
    return datePickerWidget;
  }

  /// render title action widgets
  Widget _renderTitleWidget(BuildContext context) {
    Widget cancelWidget = widget.cancel;
    if (cancelWidget == null) {
      var cancelText = LocaleMessage.getLocaleCancel(widget.locale);
      cancelWidget = Text(cancelText,
          style: TextStyle(
              color: Theme.of(context).unselectedWidgetColor, fontSize: 16.0));
    }

    Widget confirmWidget = widget.confirm;
    if (confirmWidget == null) {
      var confirmText = LocaleMessage.getLocaleDone(widget.locale);
      confirmWidget = Text(confirmText,
          style:
              TextStyle(color: Theme.of(context).primaryColor, fontSize: 16.0));
    }

    return Container(
      height: DATE_PICKER_TITLE_HEIGHT,
      decoration: BoxDecoration(color: widget.backgroundColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: DATE_PICKER_TITLE_HEIGHT,
            child: FlatButton(
                child: cancelWidget, onPressed: () => _onPressedCancel()),
          ),
          Container(
            height: DATE_PICKER_TITLE_HEIGHT,
            child: FlatButton(
                child: confirmWidget, onPressed: () => _onPressedConfirm()),
          ),
        ],
      ),
    );
  }

  /// pressed cancel widget
  void _onPressedCancel() {
    if (widget.onCancel != null) {
      widget.onCancel();
    }
    Navigator.pop(context);
  }

  /// pressed confirm widget
  void _onPressedConfirm() {
    if (widget.onConfirm != null) {
      widget.onConfirm(_currYear, _currMonth, _currDay);
    }
    if (widget.onConfirm2 != null) {
      DateTime dateTime = DateTime(_currYear, _currMonth, _currDay);
      widget.onConfirm2(dateTime, _calcSelectIndexList());
    }
    Navigator.pop(context);
  }

  /// render the picker widget of year、month and day
  Widget _renderDatePickerWidget() {
    List<Widget> pickers = List<Widget>();
    List<String> formatSplit = widget.dateFormat.split('-');
    for (int i = 0; i < formatSplit.length; i++) {
      var format = formatSplit[i];
      // contain year picker
      if (format.contains("yy")) {
        String yearAppend = LocaleMessage.getLocaleYearUnit(widget.locale);
        pickers.add(_renderYearsPickerComponent(yearAppend));
      }
      // contain month picker
      else if (format.toLowerCase().contains("mm")) {
        String monthAppend = LocaleMessage.getLocaleMonthUnit(widget.locale);
        pickers.add(_renderMonthsPickerComponent(monthAppend, format: format));
      }
      // contain day picker
      else if (format.contains("dd")) {
        String dayAppend = LocaleMessage.getLocaleDayUnit(widget.locale);
        pickers.add(_renderDaysPickerComponent(dayAppend));
      }
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, children: pickers);
  }

  /// render the picker component of year
  Widget _renderYearsPickerComponent(String yearAppend) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.all(8.0),
        height: DATE_PICKER_HEIGHT,
        decoration: BoxDecoration(color: widget.backgroundColor),
        child: CupertinoPicker.builder(
          backgroundColor: widget.backgroundColor,
          scrollController: _yearScrollCtrl,
          itemExtent: DATE_PICKER_ITEM_HEIGHT,
          onSelectedItemChanged: (int index) => _changeYearSelection(index),
          childCount: this._maxDateTime.year - this._minDateTime.year + 1,
          itemBuilder: (context, index) {
            return Container(
              height: DATE_PICKER_ITEM_HEIGHT,
              alignment: Alignment.center,
              child: Text(
                '${this._minDateTime.year + index}$yearAppend',
                style: TextStyle(
                    color: DATE_PICKER_TEXT_COLOR,
                    fontSize: DATE_PICKER_FONT_SIZE),
              ),
            );
          },
        ),
      ),
    );
  }

  /// change the selection of year picker
  void _changeYearSelection(int index) {
    int year = this._minDateTime.year + index;
    if (_currYear != year) {
      _currYear = year;
      _changeDateRange();
      _notifyDateChanged();
    }
  }

  /// render the picker component of month
  Widget _renderMonthsPickerComponent(String monthAppend, {String format}) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.all(8.0),
        height: DATE_PICKER_HEIGHT,
        decoration: BoxDecoration(color: widget.backgroundColor),
        child: CupertinoPicker.builder(
          backgroundColor: widget.backgroundColor,
          scrollController: _monthScrollCtrl,
          itemExtent: DATE_PICKER_ITEM_HEIGHT,
          onSelectedItemChanged: (int index) => _changeMonthSelection(index),
          childCount: _monthRange.last - _monthRange.first + 1,
          itemBuilder: (context, index) {
            return Container(
              height: DATE_PICKER_ITEM_HEIGHT,
              alignment: Alignment.center,
              child: Text(
                (format == null)
                    ? '${_monthRange.first + index}$monthAppend'
                    : '${_formatMonthComplex(_monthRange.first + index, format)}$monthAppend',
                style: TextStyle(
                    color: DATE_PICKER_TEXT_COLOR,
                    fontSize: DATE_PICKER_FONT_SIZE),
              ),
            );
          },
        ),
      ),
    );
  }

  /// change the selection of month picker
  void _changeMonthSelection(int index) {
    int month = _monthRange.first + index;
    if (_currMonth != month) {
      _currMonth = month;
      _changeDateRange();
      _notifyDateChanged();
    }
  }

  /// format month
  String _formatMonthComplex(int month, String format) {
    if (widget.locale == null) {
      return month.toString();
    }

    List<String> months = LocaleMessage.getLocaleMonths(widget.locale);
    if (months == null) {
      return month.toString();
    }

    if (format.length <= 2) {
      return month.toString();
    } else if (format.length <= 3) {
      return months[month - 1].substring(0, 3);
    } else {
      return months[month - 1];
    }
  }

  /// render the picker component of day
  Widget _renderDaysPickerComponent(String dayAppend) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.all(8.0),
        height: DATE_PICKER_HEIGHT,
        decoration: BoxDecoration(color: widget.backgroundColor),
        child: CupertinoPicker.builder(
            backgroundColor: widget.backgroundColor,
            scrollController: _dayScrollCtrl,
            itemExtent: DATE_PICKER_ITEM_HEIGHT,
            onSelectedItemChanged: (int index) => _changeDaySelection(index),
            childCount: _dayRange.last - _dayRange.first + 1,
            itemBuilder: (context, index) {
              return Container(
                height: DATE_PICKER_ITEM_HEIGHT,
                alignment: Alignment.center,
                child: Text(
                  "${_dayRange.first + index}$dayAppend",
                  style: TextStyle(
                      color: DATE_PICKER_TEXT_COLOR,
                      fontSize: DATE_PICKER_FONT_SIZE),
                ),
              );
            }),
      ),
    );
  }

  /// change the selection of day picker
  void _changeDaySelection(int index) {
    int dayOfMonth = _dayRange.first + index;
    if (_currDay != dayOfMonth) {
      _currDay = dayOfMonth;
      _notifyDateChanged();
    }
  }

  bool _isChangeDateRange = false;

  /// change range of month and day
  void _changeDateRange() {
    if (_isChangeDateRange) {
      return;
    }
    _isChangeDateRange = true;

    List<int> monthRange = _calcMonthRange();
    bool monthRangeChanged = _monthRange.first != monthRange.first ||
        _monthRange.last != monthRange.last;
    if (monthRangeChanged) {
      // selected year changed
      _currMonth = max(min(_currMonth, monthRange.last), monthRange.first);
    }

    List<int> dayRange = _calcDayRange();
    bool dayRangeChanged =
        _dayRange.first != dayRange.first || _dayRange.last != dayRange.last;
    if (dayRangeChanged) {
      // day range changed, need limit the value of selected day
      _currDay = max(min(_currDay, dayRange.last), dayRange.first);
    }

    setState(() {
      _monthRange = monthRange;
      _dayRange = dayRange;
    });

    if (monthRangeChanged) {
      // CupertinoPicker refresh data not working (https://github.com/flutter/flutter/issues/22999)
      int currMonth = _currMonth;
      _monthScrollCtrl.jumpToItem(monthRange.last - monthRange.first);
      if (currMonth < monthRange.last) {
        _monthScrollCtrl.jumpToItem(currMonth - monthRange.first);
      }
    }

    if (dayRangeChanged) {
      // CupertinoPicker refresh data not working (https://github.com/flutter/flutter/issues/22999)
      int currDay = _currDay;
      _dayScrollCtrl.jumpToItem(dayRange.last - dayRange.first);
      if (currDay < dayRange.last) {
        _dayScrollCtrl.jumpToItem(currDay - dayRange.first);
      }
    }

    _isChangeDateRange = false;
  }

  /// calculate the count of day in current month
  int _calcDayCountOfMonth() {
    if (_currMonth == 2) {
      return isLeapYear(_currYear) ? 29 : 28;
    } else if (DATE_PICKER_31_DAYS_MONTHS.contains(_currMonth)) {
      return 31;
    }
    return 30;
  }

  /// whether or not is leap year
  bool isLeapYear(int year) {
    return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;
  }

  /// notify selected date changed
  void _notifyDateChanged() {
    if (widget.onChanged != null) {
      widget.onChanged(_currYear, _currMonth, _currDay);
    }
    if (widget.onChanged2 != null) {
      DateTime dateTime = DateTime(_currYear, _currMonth, _currDay);
      widget.onChanged2(dateTime, _calcSelectIndexList());
    }
  }

  /// calculate selected index list
  List<int> _calcSelectIndexList() {
    int yearIndex = this._currYear - this._minDateTime.year;
    int monthIndex = this._currMonth - this._monthRange.first;
    int dayIndex = this._currDay - this._dayRange.first;
    return [yearIndex, monthIndex, dayIndex];
  }

  /// calculate the range of month
  List<int> _calcMonthRange() {
    int minMonth = 1, maxMonth = 12;
    int minYear = this._minDateTime.year;
    int maxYear = this._maxDateTime.year;
    if (minYear == this._currYear) {
      // selected minimum year, limit month range
      minMonth = _minDateTime.month;
    }
    if (maxYear == this._currYear) {
      // selected maximum year, limit month range
      maxMonth = this._maxDateTime.month;
    }
    return [minMonth, maxMonth];
  }

  /// calculate the range of day
  List<int> _calcDayRange({currMonth}) {
    int minDay = 1, maxDay = _calcDayCountOfMonth();
    int minYear = this._minDateTime.year;
    int maxYear = this._maxDateTime.year;
    int minMonth = this._minDateTime.month;
    int maxMonth = this._maxDateTime.month;
    if (currMonth == null) {
      currMonth = this._currMonth;
    }
    if (minYear == this._currYear && minMonth == this._currMonth) {
      // selected minimum year and month, limit day range
      minDay = this._minDateTime.day;
    }
    if (maxYear == this._currYear && maxMonth == this._currMonth) {
      // selected maximum year and month, limit day range
      maxDay = this._maxDateTime.day;
    }
    return [minDay, maxDay];
  }
}
