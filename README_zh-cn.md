# Flutter Cupertino Date Picker

[[Pub Packages]](https://pub.dartlang.org/packages/flutter_cupertino_date_picker)

Flutter 的日期选择器控件，iOS 样式。

![示例][1]

## 用法

#### 1\. 添加依赖

在项目的 `pubspec.yaml` 文件中添加依赖：

```yaml
dependencies:
  flutter_cupertino_date_picker: ^1.0.26+2
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
/// onClose: [DateVoidCallback] 关闭日期时间选择器的回调事件
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
  DateVoidCallback onClose,
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
/// minuteDivider: [int] minute restriction, e.g. 5: every 5th minute will be shown (0, 5, 10, 15 ...)
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
  int minuteDivider: 1,
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
- ar: 阿拉伯语
- ar_eg: 阿拉伯语(埃及)
- bn: 孟加拉语
- bs: 波斯尼亚语
- de: 德语
- es: 西班牙语
- fr: 法语
- hr: 克罗地亚语
- hu: 匈牙利语
- in_id: 印尼语
- it: 意大利语
- jp: 日语
- ko: 韩语
- nl: 荷兰语
- pt_br: 葡萄牙语(巴西)
- ro: 罗马尼亚语
- ru: 俄语
- sr_cyrl: 塞尔维亚(西里尔)
- sr_latn: 塞尔维亚(拉丁文)
- tr: 土耳其语
- uk: 乌克兰语
- vi: 越南语
- zh_cn: 简体中文

##### 添加更多的语言

###### 1. 添加语言文件

Fork 该项目, 在 `lib/src/i18n/` 文件夹中添加语言文件。参考 `strings_en_us.dart` 文件。

```dart
/// English (EN) United States
class _StringsEnUs extends _StringsI18n {
  const _StringsEnUs();

  @override
  String getCancelText() {
    // TODO 返回标题栏取消按钮的显示文字
    return null;
  }

  @override
  String getDoneText() {
    // TODO 返回标题栏确定按钮的显示文字
    return null;
  }

  @override
  List<String> getMonths() {
    // TODO 返回月份的全称 [1月, 2月 ... 12月]
    return null;
  }

  @override
  List<String> getMonthsShort() {
    // TODO 返回月份的简称 [Jan, Feb ... Dec]，返回null默认对全程进行截取，最多截取3位
    return null;
  }

  @override
  List<String> getWeeksFull() {
    // TODO 返回星期几的全称 [周一, 周二 ... 周日]
    return null;
  }

  @override
  List<String> getWeeksShort() {
    // TODO 返回星期几的缩写 [周一, 周二 ... 周日]
    return null;
  }
}
```

###### 2. 添加 DateTimePickerLocale

在 `lib/src/i18n/date_picker_i18n.dart` 文件中添加新语言对应的 `DateTimePickerLocale`。

```dart
enum DateTimePickerLocale {
  /// English (EN) United States
  en_us,
}
```

###### 3. 添加 DateTimePickerLocale 和语言的对应关系

在 `lib/src/i18n/date_picker_i18n.dart` 文件中添加 DateTimePickerLocale 和语言的对应关系。

```dart
const Map<DateTimePickerLocale, _StringsI18n> datePickerI18n = {
  DateTimePickerLocale.en_us: const _StringsEnUs(),
};
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

支持的分隔符: `|,-/\._: `.

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

[Example APK](https://raw.githubusercontent.com/wuzhendev/assets/master/flutter-datepicker/flutter_cupertino_date_picker_v1.0.8.apk)

![Example APK Download](https://github.com/wuzhendev/assets/blob/master/flutter-datepicker/date_picker_qrcode_v1.0.8.png?raw=true)

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
