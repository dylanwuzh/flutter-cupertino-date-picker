import 'package:flutter/material.dart';

/// Default value of language
const String DATE_PICKER_LOCALE_DEFAULT = 'zh';

/// Default value of date format
const String DATE_PICKER_FORMAT_DEFAULT = 'yyyy-mm-dd';

/// The height of DatePicker
const double DATE_PICKER_HEIGHT = 210.0;

/// The height of DatePicker's title
const double DATE_PICKER_TITLE_HEIGHT = 44.0;

/// The height of DatePicker's picker item
const double DATE_PICKER_ITEM_HEIGHT = 36.0;

/// The font size of DatePicker's picker text
const double DATE_PICKER_FONT_SIZE = 18.0;

/// The color of DatePicker's picker text
const Color DATE_PICKER_TEXT_COLOR = const Color(0xFF000046);

/// Default value of DatePicker's min year
const int DATE_PICKER_MIN_YEAR_DEFAULT = 1900;

/// Default value of DatePicker's max year
const int DATE_PICKER_MAX_YEAR_DEFAULT = 2100;

/// The count of month in one year
const int DATE_PICKER_MONTH_COUNT = 12;

/// Solar months of 31 days
const List<int> DATE_PICKER_31_DAYS_MONTHS = const <int>[1, 3, 5, 7, 8, 10, 12];

/// Selected value of DatePicker. Use [DateValueCallback] instead of.
@deprecated
typedef DateChangedCallback(int year, int month, int date);

/// Selected value of DatePicker
typedef DateValueCallback(DateTime dateTime, List<int> selectedIndex);

/// Pressed cancel callback
typedef DateVoidCallback();
