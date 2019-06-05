# Flutter Cupertino Date Picker

[[Pub Packages]](https://pub.dartlang.org/packages/flutter_cupertino_date_picker)

Flutter 的日期选择器控件，iOS 样式。

![示例][1]

## 用法

#### 1\. 添加依赖

在项目的 `pubspec.yaml` 文件中添加依赖：

```yaml
dependencies:
  flutter_cupertino_date_picker: ^1.0.2
```

#### 2\. 获取包

执行 Flutter 的命令获取包资源：

```bash
$ flutter packages get
```

#### 3\. 导入控件

在项目中导入该控件：

```dart
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
```

#### 4\. 显示控件

##### BottomSheet形式


```dart
/// 显示BottomSheet形式的日期时间选择器。
/// 
/// context: [BuildContext]
/// minDateTime: [DateTime] 日期选择器的最小值
/// maxDateTime: [DateTime] 日期选择器的最大值
/// initialDateTime: [DateTime] 日期选择器的初始值
/// dateFormat: [String] 日期时间格式化
/// locale: [DateTimePickerLocale] 国际化，语言地区
/// pickerMode: [DateTimePickerMode] 显示的类型: date(日期选择器)、time(时间选择器)、datetime(日期时间选择器)
/// pickerTheme: [DateTimePickerTheme] 日期选择器的样式
/// onCancel: [DateVoidCallback] 点击标题取消按钮的回调事件
/// onChange: [DateValueCallback] 选择的日期时间改变的事件
/// onConfirm: [DateValueCallback] 点击标题确定按钮的回调事件
DatePicker.showDatePicker(
  BuildContext context,
  DateTime minDateTime,
  DateTime maxDateTime,
  DateTime initialDateTime,
  String dateFormat,
  DateTimePickerLocale locale: DATETIME_PICKER_LOCALE_DEFAULT,
  DateTimePickerMode pickerMode: DateTimePickerMode.date,
  DateTimePickerTheme pickerTheme: DatePickerTheme.Default,
  DateVoidCallback onCancel,
  DateValueCallback onChange,
  DateValueCallback onConfirm,
});
```

##### 日期选择器控件，可以在页面上显示

```dart
/// 显示日期选择器
///
/// minDateTime: [DateTime] 日期选择器的最小值
/// maxDateTime: [DateTime] 日期选择器的最大值
/// initialDateTime: [DateTime] 日期选择器的初始值
/// dateFormat: [String] 日期时间格式化
/// locale: [DateTimePickerLocale] 国际化，语言地区
/// pickerTheme: [DateTimePickerTheme] 日期选择器的样式
/// onCancel: [DateVoidCallback] 点击标题取消按钮的回调事件
/// onChange: [DateValueCallback] 选择的日期时间改变的事件
/// onConfirm: [DateValueCallback] 点击标题确定按钮的回调事件
DatePickerWidget({
  DateTime minDateTime,
  DateTime maxDateTime,
  DateTime initialDateTime,
  String dateFormat: DATETIME_PICKER_DATE_FORMAT,
  DateTimePickerLocale locale: DATETIME_PICKER_LOCALE_DEFAULT,
  DateTimePickerTheme pickerTheme: DatePickerTheme.Default,
  DateVoidCallback onCancel,
  DateValueCallback onChange,
  DateValueCallback onConfirm,
})
```

##### TimePicker Widget

```dart
/// 显示时间选择器
/// 
/// minDateTime: [DateTime] 日期选择器的最小值
/// maxDateTime: [DateTime] 日期选择器的最大值
/// initialDateTime: [DateTime] 日期选择器的初始值
/// dateFormat: [String] 日期时间格式化
/// locale: [DateTimePickerLocale] 国际化，语言地区
/// pickerTheme: [DateTimePickerTheme] 日期选择器的样式
/// onCancel: [DateVoidCallback] 点击标题取消按钮的回调事件
/// onChange: [DateValueCallback] 选择的日期时间改变的事件
/// onConfirm: [DateValueCallback] 点击标题确定按钮的回调事件
TimePickerWidget({
  DateTime minDateTime,
  DateTime maxDateTime,
  DateTime initialDateTime,
  String dateFormat: DATETIME_PICKER_DATE_FORMAT,
  DateTimePickerLocale locale: DATETIME_PICKER_LOCALE_DEFAULT,
  DateTimePickerTheme pickerTheme: DatePickerTheme.Default,
  DateVoidCallback onCancel,
  DateValueCallback onChange,
  DateValueCallback onConfirm,
})
```

##### DateTimePicker Widget

```dart
/// 显示日期时间选择器
/// 
/// minDateTime: [DateTime] 日期选择器的最小值
/// maxDateTime: [DateTime] 日期选择器的最大值
/// initialDateTime: [DateTime] 日期选择器的初始值
/// dateFormat: [String] 日期时间格式化
/// locale: [DateTimePickerLocale] 国际化，语言地区
/// pickerTheme: [DateTimePickerTheme] 日期选择器的样式
/// onCancel: [DateVoidCallback] 点击标题取消按钮的回调事件
/// onChange: [DateValueCallback] 选择的日期时间改变的事件
/// onConfirm: [DateValueCallback] 点击标题确定按钮的回调事件
DateTimePickerWidget({
  DateTime minDateTime,
  DateTime maxDateTime,
  DateTime initialDateTime,
  String dateFormat: DATETIME_PICKER_DATE_FORMAT,
  DateTimePickerLocale locale: DATETIME_PICKER_LOCALE_DEFAULT,
  DateTimePickerTheme pickerTheme: DatePickerTheme.Default,
  DateVoidCallback onCancel,
  DateValueCallback onChange,
  DateValueCallback onConfirm,
})
```

#### 5\. DateTimePickerLocale

多语言支持:

- en_us: 美式英语 ***[Default locale]***
- zh_cn: 简体中文
- pt_br: 葡萄牙语(巴西)
- es: 西班牙语

##### 添加更多的语言

Fork 该项目, 在 `lib/date_picker_i18n.dart` 文件中添加语言对应的文字（标题栏按钮、月份、星期）.

```dart
/// Done widget's text
const Map<DateTimePickerLocale, String> DONE = { ... };

/// Cancel widget's text
const Map<DateTimePickerLocale, String> CANCEL = { ... };

/// en_US
const List<String> EN_US_MONTHS = [ ... ];

/// en_US weeks with full name
const List<String> EN_US_WEEKS_FULL = [ ... ];

/// en_US weeks with short name
const List<String> EN_US_WEEKS_SHORT = [ ... ];
```

#### 6\. dateFormat

|Pattern|Meaning        |e.g.       |
|:----|:----------------|:----------|
|yyyy |年份              |2019, 2020|
|yy   |年份, 2位数字      |19, 20|
|MMMM |月份              |January(en_us), 01(zh_cn)|
|MMM  |月份, 缩写         |Jan(en_us), 01(zh_cn)|
|MM   |月份, 2位数字      |01、11
|M    |月份              |1, 11|
|dd   |日期, 2位数字      |05, 25|
|d    |日期              |5, 25|
|EEEE |星期              |Monday(en_us), 星期一(zh_cn)|
|EEE  |星期, 缩写         |Mon(en_us), 周一(zh_cn)|
|HH   |时 (0~23), 2位数字 |04, 12, 20|
|H    |时 (0~23)         |4, 12, 20|
|mm   |分, 2位数字        |05, 40|
|m    |分                |5, 40|
|ss   |秒, 2位数字        |06, 55|
|s    |秒                |6, 55|
|yyyy年|格式化            |2019年, 2020年|
|H时   |格式化            |5时, 21时|

##### Date Format Separator

支持的分隔符: `|,-._: `.

#### 7\. DateTimePickerTheme

```dart
/// 日期时间选择器的样式
///
/// [backgroundColor] 背景色
/// [cancelTextStyle] 默认标题栏取消按钮的样式 [TextStyle]
/// [confirmTextStyle] 默认标题栏确定按钮的样式 [TextStyle]
/// [cancel] 自定义标题栏取消按钮
/// [confirm] 自定义标题栏确定按钮
/// [title] 自定义标题栏。如果指定了自定义标题栏，不显示默认的标题栏。指定自定义的标题栏时必须指定 [titleHeight] 的值
/// [showTitle] 是否显示默认的标题栏。如果设置为false，默认的取消、确定按钮都不会显示，自定义的标题栏不受影响
/// [pickerHeight] 日期选择器的高度
/// [titleHeight] 标题栏的高度
/// [itemHeight] 选择器每一行的高度
/// [itemTextStyle] 选择器每一行的样式 [TextStyle]
const DateTimePickerTheme({
  this.backgroundColor: DATETIME_PICKER_BACKGROUND_COLOR,
  this.cancelTextStyle,
  this.confirmTextStyle,
  this.cancel,
  this.confirm,
  this.title,
  this.showTitle: DATETIME_PICKER_SHOW_TITLE_DEFAULT,
  this.pickerHeight: DATETIME_PICKER_HEIGHT,
  this.titleHeight: DATETIME_PICKER_TITLE_HEIGHT,
  this.itemHeight: DATETIME_PICKER_ITEM_HEIGHT,
  this.itemTextStyle: DATETIME_PICKER_ITEM_TEXT_STYLE,
});
```

## Example

[Example sources](https://github.com/wuzhendev/flutter-cupertino-date-picker/tree/master/example)

[Example APK](https://raw.githubusercontent.com/wuzhendev/assets/master/flutter-datepicker/flutter_cupertino_date_picker_v1.0.0.apk)

![Example APK Download](https://github.com/wuzhendev/assets/blob/master/flutter-datepicker/date_picker_qrcode_v1.0.0.png?raw=true)

### DatePicker

![Example: DatePicker][1]

![Example: DatePickerWidget][2]

### TimePicker

![Example: TimePicker][3]

![Example: TimePickerWidget][4]

### DateTimePicker

![Example: DateTimePicker][5]

![Example: DateTimePickerWidget][6]

## License

```
Copyright 2018 wuzhen

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

[1]:https://github.com/wuzhendev/assets/blob/master/flutter-datepicker/flutter_date_picker_14.jpg?raw=true
[2]:https://github.com/wuzhendev/assets/blob/master/flutter-datepicker/flutter_date_picker_15.jpg?raw=true
[3]:https://github.com/wuzhendev/assets/blob/master/flutter-datepicker/flutter_date_picker_16.jpg?raw=true
[4]:https://github.com/wuzhendev/assets/blob/master/flutter-datepicker/flutter_date_picker_17.jpg?raw=true
[5]:https://github.com/wuzhendev/assets/blob/master/flutter-datepicker/flutter_date_picker_18.jpg?raw=true
[6]:https://github.com/wuzhendev/assets/blob/master/flutter-datepicker/flutter_date_picker_19.jpg?raw=true
