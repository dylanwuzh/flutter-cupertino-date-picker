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
    this.minYear,
    this.maxYear,
    this.initDateTime,
    this.dateFormat,
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

  final int minYear, maxYear;
  final DateTime initDateTime;
  final String dateFormat;

  final bool showTitleActions;
  final String locale;
  final Color backgroundColor;

  final Widget cancel, confirm;
  final DateVoidCallback onCancel;
  final DateChangedCallback onChanged, onConfirm;
  final DateValueCallback onChanged2, onConfirm2;

  @override
  State<StatefulWidget> createState() => _DatePickerWidgetState(this.minYear, this.maxYear, this.initDateTime);
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  int _currentYear, _currentMonth, _currentDay;
  int _dayCountOfMonth;
  FixedExtentScrollController _yearScrollCtrl, _monthScrollCtrl, _dayScrollCtrl;

  _DatePickerWidgetState(minYear, maxYear, DateTime initDateTime) {
    this._currentYear = initDateTime.year;
    this._currentMonth = initDateTime.month;
    this._currentDay = initDateTime.day;

    // limit the range of year、month、day
    this._currentYear = min(max(minYear, this._currentYear), maxYear);
    this._currentMonth = min(max(1, this._currentMonth), 12);
    this._currentDay = min(max(1, this._currentDay), 31);

    _dayCountOfMonth = _calcDayCountOfMonth();

    // create scroll controller
    _yearScrollCtrl = FixedExtentScrollController(initialItem: _currentYear - minYear);
    _monthScrollCtrl = FixedExtentScrollController(initialItem: _currentMonth - 1);
    _dayScrollCtrl = FixedExtentScrollController(initialItem: _currentDay - 1);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Material(color: Colors.transparent, child: _renderPickerView(context)),
    );
  }

  /// render date picker widgets
  Widget _renderPickerView(BuildContext context) {
    Widget datePickerWidget = _renderDatePickerWidget();
    if (widget.showTitleActions) {
      return Column(children: <Widget>[_renderTitleWidget(context), datePickerWidget]);
    }
    return datePickerWidget;
  }

  /// render title action widgets
  Widget _renderTitleWidget(BuildContext context) {
    Widget cancelWidget = widget.cancel;
    if (cancelWidget == null) {
      var cancelText = LocaleMessage.getLocaleCancel(widget.locale);
      cancelWidget = Text(cancelText, style: TextStyle(color: Theme.of(context).unselectedWidgetColor, fontSize: 16.0));
    }

    Widget confirmWidget = widget.confirm;
    if (confirmWidget == null) {
      var confirmText = LocaleMessage.getLocaleDone(widget.locale);
      confirmWidget = Text(confirmText, style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16.0));
    }

    return Container(
      height: DATE_PICKER_TITLE_HEIGHT,
      decoration: BoxDecoration(color: widget.backgroundColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: DATE_PICKER_TITLE_HEIGHT,
            child: FlatButton(child: cancelWidget, onPressed: () => _onPressedCancel()),
          ),
          Container(
            height: DATE_PICKER_TITLE_HEIGHT,
            child: FlatButton(child: confirmWidget, onPressed: () => _onPressedConfirm()),
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
      widget.onConfirm(_currentYear, _currentMonth, _currentDay);
    }
    if (widget.onConfirm2 != null) {
      DateTime dateTime = DateTime(_currentYear, _currentMonth, _currentDay);
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
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: pickers);
  }

  /// render the picker component of year
  Widget _renderYearsPickerComponent(String yearAppend) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.all(8.0),
        height: DATE_PICKER_HEIGHT,
        decoration: BoxDecoration(color: widget.backgroundColor),
        child: CupertinoPicker(
          backgroundColor: widget.backgroundColor,
          scrollController: _yearScrollCtrl,
          itemExtent: DATE_PICKER_ITEM_HEIGHT,
          onSelectedItemChanged: (int index) => _changeYearSelection(index),
          children: List.generate(widget.maxYear - widget.minYear + 1, (int index) {
            return Container(
              height: DATE_PICKER_ITEM_HEIGHT,
              alignment: Alignment.center,
              child: Text(
                '${widget.minYear + index}$yearAppend',
                style: TextStyle(color: DATE_PICKER_TEXT_COLOR, fontSize: DATE_PICKER_FONT_SIZE),
              ),
            );
          }),
        ),
      ),
    );
  }

  /// change the selection of year picker
  void _changeYearSelection(int index) {
    int year = widget.minYear + index;
    if (_currentYear != year) {
      _currentYear = year;
      _changeDayRange();
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
        child: CupertinoPicker(
          backgroundColor: widget.backgroundColor,
          scrollController: _monthScrollCtrl,
          itemExtent: DATE_PICKER_ITEM_HEIGHT,
          onSelectedItemChanged: (int index) => _changeMonthSelection(index),
          children: List.generate(DATE_PICKER_MONTH_COUNT, (int index) {
            return Container(
              height: DATE_PICKER_ITEM_HEIGHT,
              alignment: Alignment.center,
              child: Text(
                (format == null)
                    // index is 0,1,2...11  month is 1,2,3...12
                    ? '${index + 1}$monthAppend'
                    : '${_formatMonthComplex(index, format)}$monthAppend',
                style: TextStyle(color: DATE_PICKER_TEXT_COLOR, fontSize: DATE_PICKER_FONT_SIZE),
              ),
            );
          }),
        ),
      ),
    );
  }

  /// change the selection of month picker
  void _changeMonthSelection(int index) {
    int month = index + 1;
    if (_currentMonth != month) {
      _currentMonth = month;
      _changeDayRange();
      _notifyDateChanged();
    }
  }

  /// format month
  String _formatMonthComplex(int month, String format) {
    if (widget.locale == null) {
      return (month + 1).toString();
    }

    List<String> months = LocaleMessage.getLocaleMonths(widget.locale);
    if (months == null) {
      return (month + 1).toString();
    }

    if (format.length <= 2) {
      return (month + 1).toString();
    } else if (format.length <= 3) {
      return months[month].substring(0, 3);
    } else {
      return months[month];
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
        child: CupertinoPicker(
          backgroundColor: widget.backgroundColor,
          scrollController: _dayScrollCtrl,
          itemExtent: DATE_PICKER_ITEM_HEIGHT,
          onSelectedItemChanged: (int index) => _changeDaySelection(index),
          children: List.generate(_dayCountOfMonth, (int index) {
            return Container(
              height: DATE_PICKER_ITEM_HEIGHT,
              alignment: Alignment.center,
              child: Text(
                "${index + 1}$dayAppend",
                style: TextStyle(color: DATE_PICKER_TEXT_COLOR, fontSize: DATE_PICKER_FONT_SIZE),
              ),
            );
          }),
        ),
      ),
    );
  }

  /// change the selection of day picker
  void _changeDaySelection(int index) {
    int dayOfMonth = index + 1;
    if (_currentDay != dayOfMonth) {
      _currentDay = dayOfMonth;
      _notifyDateChanged();
    }
  }

  /// change range of day_of_month
  void _changeDayRange() {
    int dayCount = _calcDayCountOfMonth();
    if (_dayCountOfMonth != dayCount) {
      setState(() {
        _dayCountOfMonth = dayCount;
      });
    }
    if (_currentDay > dayCount) {
      _currentDay = dayCount;
    }
  }

  /// calculate the count of day in current month
  int _calcDayCountOfMonth() {
    if (_currentMonth == 2) {
      return isLeapYear(_currentYear) ? 29 : 28;
    } else if (DATE_PICKER_31_DAYS_MONTHS.contains(_currentMonth)) {
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
      widget.onChanged(_currentYear, _currentMonth, _currentDay);
    }
    if (widget.onChanged2 != null) {
      DateTime dateTime = DateTime(_currentYear, _currentMonth, _currentDay);
      widget.onChanged2(dateTime, _calcSelectIndexList());
    }
  }

  /// calculate selected index list
  List<int> _calcSelectIndexList() {
    int yearIndex = this._currentYear - widget.minYear;
    int monthIndex = this._currentMonth - 1;
    int dayIndex = this._currentDay - 1;
    return [yearIndex, monthIndex, dayIndex];
  }
}
