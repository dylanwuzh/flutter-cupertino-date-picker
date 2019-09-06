import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../date_time_formatter.dart';
import '../date_picker_theme.dart';
import '../date_picker_constants.dart';
import '../i18n/date_picker_i18n.dart';
import 'date_picker_title_widget.dart';

/// TimePicker widget.
///
/// @author dylan wu
/// @since 2019-05-10
class TimePickerWidget extends StatefulWidget {
  TimePickerWidget({
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
  State<StatefulWidget> createState() => _TimePickerWidgetState(
      this.minDateTime,
      this.maxDateTime,
      this.initDateTime,
      this.minuteDivider);
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  DateTime _minTime, _maxTime;
  int _currHour, _currMinute, _currSecond, _currAmpm;
  int _minuteDivider;
  List<int> _12HourRange, _24HourRange, _minuteRange, _secondRange, _ampmRange;
  FixedExtentScrollController _12HourScrollCtrl,
      _24HourScrollCtrl,
      _minuteScrollCtrl,
      _secondScrollCtrl,
      _ampmScrollCtrl;

  Map<String, FixedExtentScrollController> _scrollCtrlMap;
  Map<String, List<int>> _valueRangeMap;

  bool _isChangeTimeRange = false;

  _TimePickerWidgetState(DateTime minTime, DateTime maxTime, DateTime initTime,
      int minuteDivider) {
    if (minTime == null) {
      minTime = DateTime.parse(DATE_PICKER_MIN_DATETIME);
    }
    if (maxTime == null) {
      maxTime = DateTime.parse(DATE_PICKER_MAX_DATETIME);
    }
    if (initTime == null) {
      // init time is now
      initTime = DateTime.now();
    }
    this._minTime = minTime;
    this._maxTime = maxTime;
    this._currHour = initTime.hour;
    this._currMinute = initTime.minute;
    this._currSecond = initTime.second;

    this._minuteDivider = minuteDivider;

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
    _24HourScrollCtrl =
        FixedExtentScrollController(initialItem: _currHour - _24HourRange.first);
    _12HourScrollCtrl =
      FixedExtentScrollController(initialItem: (_currHour % 12 == 0 ? 12 : _currHour % 12) - _12HourRange.first);
    _minuteScrollCtrl = FixedExtentScrollController(
        initialItem: (_currMinute - _minuteRange.first) ~/ _minuteDivider);
    _secondScrollCtrl = FixedExtentScrollController(
        initialItem: _currSecond - _secondRange.first);
    _ampmScrollCtrl = FixedExtentScrollController(
      initialItem: (_currHour / 12).floor());

    _scrollCtrlMap = {
      'H': _24HourScrollCtrl,
      'h': _12HourScrollCtrl,
      'm': _minuteScrollCtrl,
      's': _secondScrollCtrl,
      'a': _ampmScrollCtrl,
    };
    _valueRangeMap = {'H': _24HourRange, 'h': _12HourRange, 'm': _minuteRange, 's': _secondRange, 'a': _ampmRange};
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
      DateTime now = DateTime.now();
      DateTime dateTime = DateTime(
          now.year, now.month, now.day, _currHour, _currMinute, _currSecond);
      widget.onConfirm(dateTime, _calcSelectIndexList());
    }
    Navigator.pop(context);
  }

  /// notify selected time changed
  void _onSelectedChange() {
    if (widget.onChange != null) {
      DateTime now = DateTime.now();
      DateTime dateTime = DateTime(
          now.year, now.month, now.day, _currHour, _currMinute, _currSecond);
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
    List<String> formatArr =
        DateTimeFormatter.splitDateFormat(widget.dateFormat);

    List<Widget> pickers = formatArr.map((format) {
      List<int> valueRange = _findPickerItemRange(format);

      return _renderDatePickerColumnComponent(
        scrollCtrl: _findScrollCtrl(format),
        valueRange: valueRange,
        format: format,
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
    }).toList();
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, children: pickers);
  }

  Widget _renderDatePickerColumnComponent({
    @required FixedExtentScrollController scrollCtrl,
    @required List<int> valueRange,
    @required String format,
    @required ValueChanged<int> valueChanged,
    int minuteDivider,
  }) {
    int count = format.contains('m')
      ? _calculateMinuteChildCount(valueRange, minuteDivider)
      : valueRange.last - valueRange.first + 1;
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.all(8.0),
        height: widget.pickerTheme.pickerHeight,
        decoration: BoxDecoration(color: widget.pickerTheme.backgroundColor),
        child: CupertinoPicker.builder(
          backgroundColor: widget.pickerTheme.backgroundColor,
          scrollController: scrollCtrl,
          itemExtent: widget.pickerTheme.itemHeight,
          onSelectedItemChanged: valueChanged,
          childCount: count,
          itemBuilder: (context, index) {
            int value = valueRange.first + index;

            if (format.contains('m')) {
              value = minuteDivider * index;
            }

            return _renderDatePickerItemComponent(value, format);
          },
        ),
      ),
    );
  }

  _calculateMinuteChildCount(List<int> valueRange, int divider) {
    if (divider == 0) {
      print("Cant devide by 0");
      return (valueRange.last - valueRange.first + 1);
    }

    return (valueRange.last - valueRange.first + 1) ~/ divider;
  }

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

  /// change the selection of hour picker
  void _changeMinuteSelection(int index) {
    // TODO: this looks like it would break date ranges but not taking into account _minuteRange.first
    int value = index * _minuteDivider;
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
    int value = _secondRange.first + index;
    if (_currSecond != value) {
      _currHour = _currHour % 12 + index * 12;
      _onSelectedChange();
    }
  }

  /// change range of minute and second
  void _changeTimeRange() {
    if (_isChangeTimeRange) {
      return;
    }
    _isChangeTimeRange = true;

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

    setState(() {
      _minuteRange = minuteRange;
      _secondRange = secondRange;

      _valueRangeMap['m'] = minuteRange;
      _valueRangeMap['s'] = secondRange;
    });

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

  /// calculate the range of hour
  List<int> _calc12HourRange() {
    int minHour = 1, maxHour = 12;
    if (_currAmpm == 0) {
      if (_minTime.hour < 12) {
        minHour = _minTime.hour;
      }
      if (_maxTime.hour < 12) {
        maxHour = _maxTime.hour;
      }
    } else if (_currAmpm == 1) {
      if (_minTime.hour >= 12) {
        minHour = _minTime.hour;
      }
      if (_maxTime.hour >= 12) {
        maxHour = _maxTime.hour;
      }
    }
    return [minHour, maxHour];
  }

  /// calculate the range of hour
  List<int> _calc24HourRange() {
    return [_minTime.hour, _maxTime.hour];
  }

  /// calculate the range of minute
  List<int> _calcMinuteRange({currHour}) {
    int minMinute = 0, maxMinute = 59;
    int minHour = _minTime.hour;
    int maxHour = _maxTime.hour;
    if (currHour == null) {
      currHour = _currHour;
    }

    if (minHour == currHour) {
      // selected minimum hour, limit minute range
      minMinute = _minTime.minute;
    }
    if (maxHour == currHour) {
      // selected maximum hour, limit minute range
      maxMinute = _maxTime.minute;
    }
    return [minMinute, maxMinute];
  }

  /// calculate the range of second
  List<int> _calcSecondRange({currHour, currMinute}) {
    int minSecond = 0, maxSecond = 59;
    int minHour = _minTime.hour;
    int maxHour = _maxTime.hour;
    int minMinute = _minTime.minute;
    int maxMinute = _maxTime.minute;

    if (currHour == null) {
      currHour = _currHour;
    }
    if (currMinute == null) {
      currMinute = _currMinute;
    }

    if (minHour == currHour && minMinute == currMinute) {
      // selected minimum hour and minute, limit second range
      minSecond = _minTime.second;
    }
    if (maxHour == currHour && maxMinute == currMinute) {
      // selected maximum hour and minute, limit second range
      maxSecond = _maxTime.second;
    }
    return [minSecond, maxSecond];
  }

  List<int> _calcAmpmRange({currHour, currMinute}) {
    if (_24HourRange.first < 12 && _24HourRange.last > 12) {
      return [ 0, 1 ];
    } else if (_24HourRange.first < 12) {
      return [ 0 ];
    }
    return [ 1 ];
  }

}
