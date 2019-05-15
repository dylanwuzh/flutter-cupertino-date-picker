import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_cupertino_date_picker/constants.dart';
import 'package:flutter_cupertino_date_picker/locale_message.dart';

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
    this.dateFormat: TIME_PICKER_FORMAT_DEFAULT,
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
  State<StatefulWidget> createState() => _TimePickerWidgetState(this.minDateTime, this.maxDateTime, this.initDateTime);
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  DateTime _minTime, _maxTime;
  int _currHour, _currMinute, _currSecond;
  List<int> _hourRange, _minuteRange, _secondRange;
  FixedExtentScrollController _hourScrollCtrl, _minuteScrollCtrl, _secondScrollCtrl;
  bool _isChangeTimeRange = false;

  _TimePickerWidgetState(DateTime minTime, DateTime maxTime, DateTime initTime) {
    if (minTime == null) {
      // date is useless, minimum time: 2019-01-01 00:00:00
      minTime = DateTime(2019);
    }
    if (maxTime == null) {
      // date is useless, maximum time: 2019-01-01 23:59:59
      maxTime = DateTime(2019, 1, 1, 23, 59, 59);
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

    // limit the range of hour
    this._hourRange = _calcHourRange();
    this._currHour = min(max(_hourRange.first, _currHour), _hourRange.last);

    // limit the range of minute
    this._minuteRange = _calcMinuteRange();
    this._currMinute = min(max(_minuteRange.first, _currMinute), _minuteRange.last);

    // limit the range of second
    this._secondRange = _calcSecondRange();
    this._currSecond = min(max(_secondRange.first, _currSecond), _secondRange.last);

    // create scroll controller
    _hourScrollCtrl = FixedExtentScrollController(initialItem: _currHour - _hourRange.first);
    _minuteScrollCtrl = FixedExtentScrollController(initialItem: _currMinute - _minuteRange.first);
    _secondScrollCtrl = FixedExtentScrollController(initialItem: _currSecond - _secondRange.first);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Material(color: Colors.transparent, child: _renderPickerView(context)),
    );
  }

  /// render time picker widgets
  Widget _renderPickerView(BuildContext context) {
    Widget pickerWidget = _renderTimePickerWidget();
    if (widget.showTitleActions) {
      return Column(children: <Widget>[_renderTitleWidget(context), pickerWidget]);
    }
    return pickerWidget;
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
      widget.onConfirm(_currHour, _currMinute, _currSecond);
    }
    if (widget.onConfirm2 != null) {
      DateTime now = DateTime.now();
      DateTime dateTime = DateTime(now.year, now.month, now.hour, _currHour, _currMinute, _currSecond);
      widget.onConfirm2(dateTime, _calcSelectIndexList());
    }
    Navigator.pop(context);
  }

  /// render the time picker widget
  Widget _renderTimePickerWidget() {
    List<Widget> pickers = List<Widget>();
    List<String> formatSplit = widget.dateFormat.split(':');
    for (int i = 0; i < formatSplit.length; i++) {
      var formatter = formatSplit[i];
      // contain hour picker
      if (formatter.contains("H")) {
        pickers.add(_renderHoursPickerComponent(formatter));
      }
      // contain minute picker
      else if (formatter.contains("m")) {
        pickers.add(_renderMinutesPickerComponent(formatter));
      }
      // contain second picker
      else if (formatter.contains("s")) {
        pickers.add(_renderSecondsPickerComponent(formatter));
      }
    }
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: pickers);
  }

  /// render the picker component of hour
  Widget _renderHoursPickerComponent(String formatter) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.all(8.0),
        height: DATE_PICKER_HEIGHT,
        decoration: BoxDecoration(color: widget.backgroundColor),
        child: CupertinoPicker.builder(
          backgroundColor: widget.backgroundColor,
          scrollController: _hourScrollCtrl,
          itemExtent: DATE_PICKER_ITEM_HEIGHT,
          onSelectedItemChanged: (int index) => _changeHourSelection(index),
          childCount: _hourRange.last - _hourRange.first + 1,
          itemBuilder: (context, index) {
            return Container(
              height: DATE_PICKER_ITEM_HEIGHT,
              alignment: Alignment.center,
              child: Text(
                _formatNumber(_hourRange.first + index, formatter, 'H'),
                style: TextStyle(color: DATE_PICKER_TEXT_COLOR, fontSize: DATE_PICKER_FONT_SIZE),
              ),
            );
          },
        ),
      ),
    );
  }

  /// change the selection of hour picker
  void _changeHourSelection(int index) {
    int value = _hourRange.first + index;
    if (_currHour != value) {
      _currHour = value;
      _changeTimeRange();
      _notifyTimeChanged();
    }
  }

  /// render the picker component of minute
  Widget _renderMinutesPickerComponent(String formatter) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.all(8.0),
        height: DATE_PICKER_HEIGHT,
        decoration: BoxDecoration(color: widget.backgroundColor),
        child: CupertinoPicker.builder(
          backgroundColor: widget.backgroundColor,
          scrollController: _minuteScrollCtrl,
          itemExtent: DATE_PICKER_ITEM_HEIGHT,
          onSelectedItemChanged: (int index) => _changeMinuteSelection(index),
          childCount: _minuteRange.last - _minuteRange.first + 1,
          itemBuilder: (context, index) {
            return Container(
              height: DATE_PICKER_ITEM_HEIGHT,
              alignment: Alignment.center,
              child: Text(
                _formatNumber(_minuteRange.first + index, formatter, 'm'),
                style: TextStyle(color: DATE_PICKER_TEXT_COLOR, fontSize: DATE_PICKER_FONT_SIZE),
              ),
            );
          },
        ),
      ),
    );
  }

  /// change the selection of month picker
  void _changeMinuteSelection(int index) {
    int value = _minuteRange.first + index;
    if (_currMinute != value) {
      _currMinute = value;
      _changeTimeRange();
      _notifyTimeChanged();
    }
  }

  /// render the picker component of seconds
  Widget _renderSecondsPickerComponent(String formatter) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.all(8.0),
        height: DATE_PICKER_HEIGHT,
        decoration: BoxDecoration(color: widget.backgroundColor),
        child: CupertinoPicker.builder(
            backgroundColor: widget.backgroundColor,
            scrollController: _secondScrollCtrl,
            itemExtent: DATE_PICKER_ITEM_HEIGHT,
            onSelectedItemChanged: (int index) => _changeSecondSelection(index),
            childCount: _secondRange.last - _secondRange.first + 1,
            itemBuilder: (context, index) {
              return Container(
                height: DATE_PICKER_ITEM_HEIGHT,
                alignment: Alignment.center,
                child: Text(
                  _formatNumber(_secondRange.first + index, formatter, 's'),
                  style: TextStyle(color: DATE_PICKER_TEXT_COLOR, fontSize: DATE_PICKER_FONT_SIZE),
                ),
              );
            }),
      ),
    );
  }

  /// format number value for display
  String _formatNumber(int value, String formatter, String unit) {
    if (formatter.contains('$unit$unit')) {
      return formatter.replaceAll('$unit$unit', value < 10 ? '0$value' : '$value');
    }
    return formatter.replaceAll(unit, value.toString());
  }

  /// change the selection of second picker
  void _changeSecondSelection(int index) {
    int value = _secondRange.first + index;
    if (_currSecond != value) {
      _currSecond = value;
      _notifyTimeChanged();
    }
  }

  /// change range of minute and second
  void _changeTimeRange() {
    if (_isChangeTimeRange) {
      return;
    }
    _isChangeTimeRange = true;

    List<int> minuteRange = _calcMinuteRange();
    bool minuteRangeChanged = _minuteRange.first != minuteRange.first || _minuteRange.last != minuteRange.last;
    if (minuteRangeChanged) {
      // selected hour changed
      _currMinute = max(min(_currMinute, minuteRange.last), minuteRange.first);
    }

    List<int> secondRange = _calcSecondRange();
    debugPrint('secondRange: $secondRange');
    bool secondRangeChanged = _secondRange.first != secondRange.first || _secondRange.last != secondRange.last;
    if (secondRangeChanged) {
      // second range changed, need limit the value of selected second
      _currSecond = max(min(_currSecond, secondRange.last), secondRange.first);
    }

    setState(() {
      _minuteRange = minuteRange;
      _secondRange = secondRange;
    });

    if (minuteRangeChanged) {
      // CupertinoPicker refresh data not working (https://github.com/flutter/flutter/issues/22999)
      int currMinute = _currMinute;
      _minuteScrollCtrl.jumpToItem(minuteRange.last - minuteRange.first);
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

  /// notify selected time changed
  void _notifyTimeChanged() {
    if (widget.onChanged != null) {
      widget.onChanged(_currHour, _currMinute, _currSecond);
    }
    if (widget.onChanged2 != null) {
      DateTime now = DateTime.now();
      DateTime dateTime = DateTime(now.year, now.month, now.day, _currHour, _currMinute, _currSecond);
      widget.onChanged2(dateTime, _calcSelectIndexList());
    }
  }

  /// calculate selected index list
  List<int> _calcSelectIndexList() {
    int hourIndex = _currHour - _hourRange.first;
    int minuteIndex = _currMinute - _minuteRange.first;
    int secondIndex = _currSecond - _secondRange.first;
    return [hourIndex, minuteIndex, secondIndex];
  }

  /// calculate the range of hour
  List<int> _calcHourRange() {
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

    debugPrint('currHour=$currHour, currMinute=$currMinute, minHour=$minHour, minMinute=$minMinute');
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
}
