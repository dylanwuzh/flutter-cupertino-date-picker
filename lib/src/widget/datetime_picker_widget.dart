import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../date_time_formatter.dart';
import '../date_picker.dart';
import '../date_picker_theme.dart';
import '../date_picker_constants.dart';
import '../i18n/date_picker_i18n.dart';
import 'date_picker_title_widget.dart';

/// DateTimePicker widget. Can display date and time picker.
///
/// @author dylan wu
/// @since 2019-05-10
class DateTimePickerWidget extends StatefulWidget {
  DateTimePickerWidget({
    Key key,
    this.minDateTime,
    this.maxDateTime,
    this.initDateTime,
    this.dateFormat: DATETIME_PICKER_TIME_FORMAT,
    this.locale: DATETIME_PICKER_LOCALE_DEFAULT,
    this.pickerTheme: DateTimePickerTheme.Default,
    this.minuteDivider = 1,
    this.onCancel,
    this.onChange,
    this.onConfirm,
  }) : super(key: key) {
    DateTime minTime = minDateTime ?? DateTime.parse(DATE_PICKER_MIN_DATETIME);
    DateTime maxTime = maxDateTime ?? DateTime.parse(DATE_PICKER_MAX_DATETIME);
    assert(minTime.compareTo(maxTime) < 0);
  }

  final DateTime minDateTime, maxDateTime, initDateTime;
  final String dateFormat;
  final DateTimePickerLocale locale;
  final DateTimePickerTheme pickerTheme;
  final DateVoidCallback onCancel;
  final DateValueCallback onChange, onConfirm;
  final int minuteDivider;

  @override
  State<StatefulWidget> createState() => _DateTimePickerWidgetState(
      this.minDateTime,
      this.maxDateTime,
      this.initDateTime,
      this.minuteDivider);
}

class _DateTimePickerWidgetState extends State<DateTimePickerWidget> {
  DateTime _minTime, _maxTime;
  int _currDay, _currHour, _currMinute, _currSecond, _currAmpm;
  List<int> _dayRange,
      _12HourRange,
      _24HourRange,
      _minuteRange,
      _secondRange,
      _ampmRange;
  int _minuteDivider;
  FixedExtentScrollController _dayScrollCtrl,
      _12HourScrollCtrl,
      _24HourScrollCtrl,
      _minuteScrollCtrl,
      _secondScrollCtrl,
      _ampmScrollCtrl;

  Map<String, FixedExtentScrollController> _scrollCtrlMap;
  Map<String, List<int>> _valueRangeMap;

  bool _isChangeTimeRange = false;

  final DateTime _baselineDate = DateTime(1900, 1, 1);

  _DateTimePickerWidgetState(DateTime minTime, DateTime maxTime,
      DateTime initTime, int minuteDivider) {
    // check minTime value
    if (minTime == null) {
      minTime = DateTime.parse(DATE_PICKER_MIN_DATETIME);
    }
    // check maxTime value
    if (maxTime == null) {
      maxTime = DateTime.parse(DATE_PICKER_MAX_DATETIME);
    }
    // check initTime value
    if (initTime == null) {
      initTime = DateTime.now();
    }
    // limit initTime value
    if (initTime.compareTo(minTime) < 0) {
      initTime = minTime;
    }
    if (initTime.compareTo(maxTime) > 0) {
      initTime = maxTime;
    }

    this._minTime = minTime;
    this._maxTime = maxTime;
    this._currHour = initTime.hour;
    this._currMinute = initTime.minute;
    this._currSecond = initTime.second;

    this._minuteDivider = minuteDivider;

    // limit the range of date
    this._dayRange = _calcDayRange();
    int currDate = initTime.difference(_baselineDate).inDays;
    this._currDay = min(max(_dayRange.first, currDate), _dayRange.last);

    // limit the range of hour
    this._12HourRange = _calc12HourRange();
    this._24HourRange = _calc24HourRange();
    this._currHour = min(max(_24HourRange.first, _currHour), _24HourRange.last);

    // limit the range of minute
    this._minuteRange = _calcMinuteRange();
    this._currMinute =
        min(max(_minuteRange.first, _currMinute), _minuteRange.last);

    // limit the range of second
    this._secondRange = _calcSecondRange();
    this._currSecond =
        min(max(_secondRange.first, _currSecond), _secondRange.last);

    this._ampmRange = _calcAmpmRange();
    this._currAmpm = _currHour < 12 ? 0 : 1;

    // create scroll controller
    _dayScrollCtrl =
        FixedExtentScrollController(initialItem: _currDay - _dayRange.first);
    _24HourScrollCtrl = FixedExtentScrollController(
        initialItem: _currHour - _24HourRange.first);
    _12HourScrollCtrl = FixedExtentScrollController(
        initialItem:
            (_currHour % 12 == 0 ? 12 : _currHour % 12) - _12HourRange.first);
    _minuteScrollCtrl = FixedExtentScrollController(
        initialItem: (_currMinute - _minuteRange.first) ~/ _minuteDivider);
    _secondScrollCtrl = FixedExtentScrollController(
        initialItem: _currSecond - _secondRange.first);
    _ampmScrollCtrl =
        FixedExtentScrollController(initialItem: (_currHour / 12).floor());

    _scrollCtrlMap = {
      'H': _24HourScrollCtrl,
      'h': _12HourScrollCtrl,
      'm': _minuteScrollCtrl,
      's': _secondScrollCtrl,
      'a': _ampmScrollCtrl,
    };
    _valueRangeMap = {
      'H': _24HourRange,
      'h': _12HourRange,
      'm': _minuteRange,
      's': _secondRange,
      'a': _ampmRange
    };
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Material(
          color: Colors.transparent, child: _renderPickerView(context)),
    );
  }

  /// render time picker widgets
  Widget _renderPickerView(BuildContext context) {
    Widget pickerWidget = _renderDatePickerWidget();

    // display the title widget
    if (widget.pickerTheme.title != null || widget.pickerTheme.showTitle) {
      Widget titleWidget = DatePickerTitleWidget(
        pickerTheme: widget.pickerTheme,
        locale: widget.locale,
        onCancel: () => _onPressedCancel(),
        onConfirm: () => _onPressedConfirm(),
      );
      return Column(children: <Widget>[titleWidget, pickerWidget]);
    }
    return pickerWidget;
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
      DateTime day = _baselineDate.add(Duration(days: _currDay));
      DateTime dateTime = DateTime(
          day.year, day.month, day.day, _currHour, _currMinute, _currSecond);
      widget.onConfirm(dateTime, _calcSelectIndexList());
    }
    Navigator.pop(context);
  }

  /// notify selected datetime changed
  void _onSelectedChange() {
    if (widget.onChange != null) {
      DateTime day = _baselineDate.add(Duration(days: _currDay));
      DateTime dateTime = DateTime(
          day.year, day.month, day.day, _currHour, _currMinute, _currSecond);
      widget.onChange(dateTime, _calcSelectIndexList());
    }
  }

  /// find scroll controller by specified format
  FixedExtentScrollController _findScrollCtrl(String format) {
    String key = _scrollCtrlMap.keys.firstWhere((key) => format.contains(key));

    return _scrollCtrlMap[key];
  }

  /// find item value range by specified format
  List<int> _findPickerItemRange(String format) {
    String key = _valueRangeMap.keys.firstWhere((key) => format.contains(key));
    return _valueRangeMap[key];
  }

  /// render the picker widget of year、month and day
  Widget _renderDatePickerWidget() {
    List<Widget> pickers = <Widget>[];
    List<String> formatArr = DateTimeFormatter.splitDateFormat(
        widget.dateFormat,
        mode: DateTimePickerMode.datetime);
    int count = formatArr.length;
    int dayFlex = count > 3 ? count - 1 : count;

    // render day picker column
    String dayFormat = formatArr.removeAt(0);
    Widget dayPickerColumn = _renderDatePickerColumnComponent(
      scrollCtrl: _dayScrollCtrl,
      valueRange: _dayRange,
      format: dayFormat,
      valueChanged: (value) {
        _changeDaySelection(value);
      },
      flex: dayFlex,
      itemBuilder: (BuildContext context, int index) =>
          _renderDayPickerItemComponent(_dayRange.first + index, dayFormat),
    );
    pickers.add(dayPickerColumn);

    // render time picker column
    var timePickers = formatArr.map((format) {
      print(format);
      List<int> valueRange = _findPickerItemRange(format);

      return _renderDatePickerColumnComponent(
        scrollCtrl: _findScrollCtrl(format),
        valueRange: valueRange,
        format: format,
        flex: 1,
        minuteDivider: widget.minuteDivider,
        valueChanged: (value) {
          if (format.contains('h')) {
            _change12HourSelection(value);
          } else if (format.contains('H')) {
            _change24HourSelection(value);
          } else if (format.contains('m')) {
            _changeMinuteSelection(value);
          } else if (format.contains('s')) {
            _changeSecondSelection(value);
          } else if (format.contains('a')) {
            _changeAmPmSelection(value);
          }
        },
      );
    });
    pickers.addAll(timePickers);

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, children: pickers);
  }

  Widget _renderDatePickerColumnComponent({
    @required FixedExtentScrollController scrollCtrl,
    @required List<int> valueRange,
    @required String format,
    @required ValueChanged<int> valueChanged,
    int minuteDivider,
    int flex,
    IndexedWidgetBuilder itemBuilder,
  }) {
    Widget columnWidget = Container(
      padding: EdgeInsets.all(8.0),
      width: double.infinity,
      height: widget.pickerTheme.pickerHeight,
      decoration: BoxDecoration(color: widget.pickerTheme.backgroundColor),
      child: CupertinoPicker.builder(
        backgroundColor: widget.pickerTheme.backgroundColor,
        scrollController: scrollCtrl,
        itemExtent: widget.pickerTheme.itemHeight,
        onSelectedItemChanged: valueChanged,
        childCount: format.contains('m')
            ? _calculateMinuteChildCount(valueRange, minuteDivider)
            : valueRange.last - valueRange.first + 1,
        itemBuilder: itemBuilder == null
            ? (context, index) {
                int value = valueRange.first + index;

                if (format.contains('m')) {
                  value = minuteDivider * index;
                }

                return _renderDatePickerItemComponent(value, format);
              }
            : itemBuilder,
      ),
    );
    return Expanded(
      flex: flex,
      child: columnWidget,
    );
  }

  _calculateMinuteChildCount(List<int> valueRange, int divider) {
    if (divider == 0) {
      print("Cant devide by 0");
      return (valueRange.last - valueRange.first + 1);
    }

    return (valueRange.last - valueRange.first + 1) ~/ divider;
  }

  /// render day picker item
  Widget _renderDayPickerItemComponent(int value, String format) {
    DateTime dateTime = _baselineDate.add(Duration(days: value));
    return Container(
      height: widget.pickerTheme.itemHeight,
      alignment: Alignment.center,
      child: Text(
        DateTimeFormatter.formatDate(dateTime, format, widget.locale),
        style:
            widget.pickerTheme.itemTextStyle ?? DATETIME_PICKER_ITEM_TEXT_STYLE,
      ),
    );
  }

  /// render hour、minute、second picker item
  Widget _renderDatePickerItemComponent(int value, String format) {
    return Container(
      height: widget.pickerTheme.itemHeight,
      alignment: Alignment.center,
      child: Text(
        DateTimeFormatter.formatDateTime(value, format, widget.locale),
        style:
            widget.pickerTheme.itemTextStyle ?? DATETIME_PICKER_ITEM_TEXT_STYLE,
      ),
    );
  }

  /// change the selection of day picker
  void _changeDaySelection(int days) {
    int value = _dayRange.first + days;
    if (_currDay != value) {
      _currDay = value;
      _changeTimeRange();
      _onSelectedChange();
    }
  }

  /// change the selection of hour picker
  void _change24HourSelection(int index) {
    int value = _24HourRange.first + index;
    if (_currHour != value) {
      _currHour = value;
      _changeTimeRange();
      _onSelectedChange();
    }
  }

  /// change the selection of hour picker
  void _change12HourSelection(int index) {
    int value = _12HourRange.first + index;
    if (_currHour != value) {
      _currHour = (value == 12 ? 0 : value) + 12 * _currAmpm;
      _changeTimeRange();
      _onSelectedChange();
    }
  }

  /// change the selection of month picker
  /// change the selection of minute picker
  void _changeMinuteSelection(int index) {
    int value = _minuteRange.first + index;
    if (_currMinute != value) {
      _currMinute = value;
      _changeTimeRange();
      _onSelectedChange();
    }
  }

  /// change the selection of second picker
  void _changeSecondSelection(int index) {
    int value = _secondRange.first + index;
    if (_currSecond != value) {
      _currSecond = value;
      _onSelectedChange();
    }
  }

  /// change the selection of ampm picker
  void _changeAmPmSelection(int index) {
      _currHour = _currHour % 12 + index * 12;
      _onSelectedChange();
  }

  /// change range of hour, minute, second and ampm
  void _changeTimeRange() {
    if (_isChangeTimeRange) {
      return;
    }
    _isChangeTimeRange = true;

    bool hourRangeChanged = false;
    List<int> hourRange12 = _calc12HourRange();
    List<int> hourRange24 = _calc24HourRange();
    if (widget.dateFormat.contains('h')) {
      hourRangeChanged = _12HourRange.first != hourRange12.first ||
          _12HourRange.last != hourRange12.last;
      if (hourRangeChanged) {
        // selected day changed
        _currHour = max(min(_currHour, hourRange12.last), hourRange12.first);
      }
    } else {
      hourRangeChanged = _24HourRange.first != hourRange24.first ||
          _24HourRange.last != hourRange24.last;
      if (hourRangeChanged) {
        // selected day changed
        _currHour = max(min(_currHour, hourRange24.last), hourRange24.first);
      }
    }

    List<int> minuteRange = _calcMinuteRange();
    bool minuteRangeChanged = _minuteRange.first != minuteRange.first ||
        _minuteRange.last != minuteRange.last;
    if (minuteRangeChanged) {
      // selected hour changed
      _currMinute = max(min(_currMinute, minuteRange.last), minuteRange.first);
    }

    List<int> secondRange = _calcSecondRange();
    bool secondRangeChanged = _secondRange.first != secondRange.first ||
        _secondRange.last != secondRange.last;
    if (secondRangeChanged) {
      // second range changed, need limit the value of selected second
      _currSecond = max(min(_currSecond, secondRange.last), secondRange.first);
    }

    List<int> ampmRange = _calcAmpmRange();
    bool ampmRangeChanged = _ampmRange.first != ampmRange.first ||
        _ampmRange.last != ampmRange.last;
    if (ampmRangeChanged) {
      // ampm range changed, need limit the value of selected ampm
      _currAmpm = max(min(_currAmpm, ampmRange.last), ampmRange.first);
    }

    setState(() {
      _12HourRange = hourRange12;
      _24HourRange = hourRange24;
      _minuteRange = minuteRange;
      _secondRange = secondRange;

      _valueRangeMap['h'] = hourRange12;
      _valueRangeMap['H'] = hourRange24;
      _valueRangeMap['m'] = minuteRange;
      _valueRangeMap['s'] = secondRange;
    });

    if (hourRangeChanged) {
      // CupertinoPicker refresh data not working (https://github.com/flutter/flutter/issues/22999)
      int currHour = _currHour;
      if (widget.dateFormat.contains('h')) {
        _12HourScrollCtrl.jumpToItem(hourRange12.last - hourRange12.first);
        if (currHour < hourRange12.last) {
          _12HourScrollCtrl.jumpToItem(currHour - hourRange12.first);
        }
      } else {
        _24HourScrollCtrl.jumpToItem(hourRange24.last - hourRange24.first);
        if (currHour < hourRange24.last) {
          _24HourScrollCtrl.jumpToItem(currHour - hourRange24.first);
        }
      }
    }

    if (minuteRangeChanged) {
      // CupertinoPicker refresh data not working (https://github.com/flutter/flutter/issues/22999)
      int currMinute = _currMinute;
      _minuteScrollCtrl
          .jumpToItem((minuteRange.last - minuteRange.first) ~/ _minuteDivider);
      if (currMinute < minuteRange.last) {
        _minuteScrollCtrl.jumpToItem(currMinute - minuteRange.first);
      }
    }

    if (secondRangeChanged) {
      // CupertinoPicker refresh data not working (https://github.com/flutter/flutter/issues/22999)
      int currSecond = _currSecond;
      _secondScrollCtrl.jumpToItem(secondRange.last - secondRange.first);
      if (currSecond < secondRange.last) {
        _secondScrollCtrl.jumpToItem(currSecond - secondRange.first);
      }
    }

    _isChangeTimeRange = false;
  }

  /// calculate selected index list
  List<int> _calcSelectIndexList() {
    int hourIndex = _currHour - _24HourRange.first;
    int minuteIndex = _currMinute - _minuteRange.first;
    int secondIndex = _currSecond - _secondRange.first;
    int ampmIndex = _currAmpm;
    return [hourIndex, minuteIndex, secondIndex, ampmIndex];
  }

  /// calculate the range of day
  List<int> _calcDayRange() {
    int minDays = _minTime.difference(_baselineDate).inDays;
    int maxDays = _maxTime.difference(_baselineDate).inDays;
    return [minDays, maxDays];
  }

  /// calculate the range of hour
  List<int> _calc12HourRange() {
    int minHour = 1, maxHour = 12;
    if (_currAmpm == 0) {
      if (_currDay == _dayRange.first && _minTime.hour < 12) {
        minHour = _minTime.hour;
      }
      if (_currDay == _dayRange.last && _maxTime.hour < 12) {
        maxHour = _maxTime.hour;
      }
    } else if (_currAmpm == 1) {
      if (_currDay == _dayRange.first && _minTime.hour >= 12) {
        minHour = _minTime.hour;
      }
      if (_currDay == _dayRange.last && _maxTime.hour >= 12) {
        maxHour = _maxTime.hour;
      }
    }
    return [minHour, maxHour];
  }

  /// calculate the range of hour
  List<int> _calc24HourRange() {
    int minHour = 0, maxHour = 23;
    if (_currDay == _dayRange.first) {
      minHour = _minTime.hour;
    }
    if (_currDay == _dayRange.last) {
      maxHour = _maxTime.hour;
    }
    return [minHour, maxHour];
  }

  /// calculate the range of minute
  List<int> _calcMinuteRange({currHour}) {
    int minMinute = 0, maxMinute = 59;
    if (currHour == null) {
      currHour = _currHour;
    }

    if (_currDay == _dayRange.first && currHour == _minTime.hour) {
      // selected minimum day、hour, limit minute range
      minMinute = _minTime.minute;
    }
    if (_currDay == _dayRange.last && currHour == _maxTime.hour) {
      // selected maximum day、hour, limit minute range
      maxMinute = _maxTime.minute;
    }
    return [minMinute, maxMinute];
  }

  /// calculate the range of second
  List<int> _calcSecondRange({currHour, currMinute}) {
    int minSecond = 0, maxSecond = 59;

    if (currHour == null) {
      currHour = _currHour;
    }
    if (currMinute == null) {
      currMinute = _currMinute;
    }

    if (_currDay == _dayRange.first &&
        currHour == _minTime.hour &&
        currMinute == _minTime.minute) {
      // selected minimum hour and minute, limit second range
      minSecond = _minTime.second;
    }
    if (_currDay == _dayRange.last &&
        currHour == _maxTime.hour &&
        currMinute == _maxTime.minute) {
      // selected maximum hour and minute, limit second range
      maxSecond = _maxTime.second;
    }
    return [minSecond, maxSecond];
  }

  List<int> _calcAmpmRange({currHour, currMinute}) {
    if (_24HourRange.first < 12 && _24HourRange.last > 12) {
      return [0, 1];
    } else if (_24HourRange.first < 12) {
      return [0];
    }
    return [1];
  }
}
