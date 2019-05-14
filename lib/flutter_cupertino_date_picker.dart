///
/// author: Dylan Wu
/// since: 2018/06/21
///
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_cupertino_date_picker/constants.dart';
import 'package:flutter_cupertino_date_picker/date_picker_widget.dart';

class DatePicker {
  ///
  /// Display date picker bottom sheet.
  ///
  /// cancel: Custom cancel button
  /// confirm: Custom confirm button
  ///
  static void showDatePicker(
    BuildContext context, {
    int minYear: DATE_PICKER_MIN_YEAR_DEFAULT,
    int maxYear: DATE_PICKER_MAX_YEAR_DEFAULT,
    DateTime minDateTime,
    DateTime maxDateTime,
    @deprecated int initialYear,
    @deprecated int initialMonth,
    @deprecated int initialDate,
    DateTime initialDateTime,
    bool showTitleActions: true,
    Widget cancel,
    Widget confirm,
    DateVoidCallback onCancel,
    @deprecated DateChangedCallback onChanged,
    @deprecated DateChangedCallback onConfirm,
    DateValueCallback onChanged2,
    DateValueCallback onConfirm2,
    locale: DATE_PICKER_LOCALE_DEFAULT,
    dateFormat: DATE_PICKER_FORMAT_DEFAULT,
  }) {
    if (dateFormat == null || dateFormat.length == 0) {
      dateFormat = DATE_PICKER_FORMAT_DEFAULT;
    }

    // handle the range of year
    if (minDateTime == null) {
      minDateTime = DateTime(minYear);
    }
    if (maxDateTime == null) {
      maxDateTime = DateTime(maxYear);
    }

    // handle initial DateTime
    DateTime now = DateTime.now();
    if (initialYear == null) {
      initialYear = now.year;
    }
    if (initialMonth == null) {
      initialMonth = now.month;
    }
    if (initialDate == null) {
      initialDate = now.day;
    }
    if (initialDateTime != null) {
      initialYear = initialDateTime.year;
      initialMonth = initialDateTime.month;
      initialDate = initialDateTime.day;
    }

    Navigator.push(
      context,
      new _DatePickerRoute(
        showTitleActions: showTitleActions,
        minDateTime: minDateTime,
        maxDateTime: maxDateTime,
        initialDateTime: initialDateTime,
        cancel: cancel,
        confirm: confirm,
        onChanged: onChanged,
        onConfirm: onConfirm,
        onChanged2: onChanged2,
        onConfirm2: onConfirm2,
        onCancel: onCancel,
        locale: locale,
        dateFormat: dateFormat,
        theme: Theme.of(context, shadowThemeOnly: true),
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
      ),
    );
  }
}

class _DatePickerRoute<T> extends PopupRoute<T> {
  _DatePickerRoute({
    this.showTitleActions,
    this.minDateTime,
    this.maxDateTime,
    this.initialDateTime,
    this.cancel,
    this.confirm,
    this.onChanged,
    this.onConfirm,
    this.onChanged2,
    this.onConfirm2,
    this.onCancel,
    this.theme,
    this.barrierLabel,
    this.locale,
    this.dateFormat,
    RouteSettings settings,
  }) : super(settings: settings);

  final bool showTitleActions;

  final DateTime minDateTime, maxDateTime, initialDateTime;

  final Widget cancel, confirm;
  final VoidCallback onCancel;
  final DateChangedCallback onChanged;
  final DateChangedCallback onConfirm;
  final DateValueCallback onChanged2;
  final DateValueCallback onConfirm2;

  final ThemeData theme;
  final String locale;
  final String dateFormat;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  bool get barrierDismissible => true;

  @override
  final String barrierLabel;

  @override
  Color get barrierColor => Colors.black54;

  AnimationController _animationController;

  @override
  AnimationController createAnimationController() {
    assert(_animationController == null);
    _animationController =
        BottomSheet.createAnimationController(navigator.overlay);
    return _animationController;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    Widget bottomSheet = new MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: _DatePickerComponentStateless(
        route: this,
        pickerHeight: showTitleActions
            ? DATE_PICKER_TITLE_HEIGHT + DATE_PICKER_HEIGHT
            : DATE_PICKER_HEIGHT,
      ),
    );
    if (theme != null) {
      bottomSheet = new Theme(data: theme, child: bottomSheet);
    }
    return bottomSheet;
  }
}

class _DatePickerComponentStateless extends StatelessWidget {
  final _DatePickerRoute route;
  final double _pickerHeight;

  _DatePickerComponentStateless(
      {Key key, @required this.route, @required pickerHeight})
      : this._pickerHeight = pickerHeight;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      child: new AnimatedBuilder(
        animation: route.animation,
        builder: (BuildContext context, Widget child) {
          return new ClipRect(
            child: new CustomSingleChildLayout(
              delegate: new _BottomPickerLayout(route.animation.value,
                  pickerHeight: _pickerHeight),
              child: DatePickerWidget(
                minDateTime: route.minDateTime,
                maxDateTime: route.maxDateTime,
                initDateTime: route.initialDateTime,
                dateFormat: route.dateFormat,
                showTitleActions: route.showTitleActions,
                locale: route.locale,
                cancel: route.cancel,
                confirm: route.confirm,
                onCancel: route.onCancel,
                onChanged: route.onChanged,
                onConfirm: route.onConfirm,
                onChanged2: route.onChanged2,
                onConfirm2: route.onConfirm2,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _BottomPickerLayout extends SingleChildLayoutDelegate {
  _BottomPickerLayout(this.progress, {this.pickerHeight});

  final double progress;
  final double pickerHeight;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return new BoxConstraints(
      minWidth: constraints.maxWidth,
      maxWidth: constraints.maxWidth,
      minHeight: 0.0,
      maxHeight: pickerHeight,
    );
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    double height = size.height - childSize.height * progress;
    return new Offset(0.0, height);
  }

  @override
  bool shouldRelayout(_BottomPickerLayout oldDelegate) {
    return progress != oldDelegate.progress;
  }
}
