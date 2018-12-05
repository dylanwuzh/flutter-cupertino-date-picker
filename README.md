# Flutter Cupertino Date Picker

[[pub packages]](https://pub.dartlang.org/packages/flutter_cupertino_date_picker)
| [中文说明](./README_zh-cn.md)

Flutter cupertino date picker.

![Example][1]

## Usage

#### 1\. Depend

Add this to you package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_cupertino_date_picker: ^0.3.0
```

#### 2\. Install

Run command:

```bash
$ flutter packages get
```

#### 3\. Import

Import in Dart code:

```dart
import 'packages:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
```

#### 4\. Display DatePicker

```dart
///
/// context: BuildContext.
/// showTitleActions: Display confirm and cancel button in title bar or not.
/// local: i18n, 'zh' for Chinese, default is English.
/// minYear: Min value of year's selection range. Default is 1900.
/// maxYear: Max value of year's selection range. Default is 2100.
/// initialYear: Initial value of year.
/// initialMonth: Initial value of month.
/// initialDate: Initial value of date.
/// cancel: Custom cancel button.
/// confirm: Custom confirm button.
/// dateFormat: Format English months.
/// onChange: An option callback when the currently selected datetime changes.
/// onConfirm: An option callback when tap the confirm button in title bar.
DatePicker.showDatePicker(
  context,
  showTitleActions: true,
  locale: 'zh',
  minYear: 1970,
  maxYear: 2020,
  initialYear: 2018,
  initialMonth: 6,
  initialDate: 21,
  cancel: Text('custom cancel'),
  confirm: Text('custom confirm'),
  dateFormat: 'yyyy-mm-dd'
  onChanged: (year, month, date) { },
  onConfirm: (year, month, date) { },
);
```

***showTitleActions: false***

![Example: showTitleActions=false][2]

***locale: 'zh'***

i18n, default is English

[Thanks to: Robbie Boyd](https://github.com/vagrantrobbie)


![Example: locale=zh][3]

***dateFormat: 'yyyy-mmm-dd'***

Just support English months.

It will also put the Pickers in the same order. The date String output does not change

```
dd-mm-yyyy -> 1-10-2018
dd-mmm-yyyy -> 1-Oct-2018
dd-mmmm-yyyy -> 1-October-2018
```

![Example: dateFormat][4]

## Example

[Example sources](https://github.com/wuzhendev/flutter-cupertino-date-picker/tree/master/example)

## Futures

1. Format datetime display.

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

[1]:https://openproject.oss-cn-beijing.aliyuncs.com/images/flutter/flutter_date_picker_4.png?x-oss-process=style/image_scale1
[2]:https://openproject.oss-cn-beijing.aliyuncs.com/images/flutter/flutter_date_picker_5.png?x-oss-process=style/image_scale1
[3]:https://openproject.oss-cn-beijing.aliyuncs.com/images/flutter/flutter_date_picker_6.png?x-oss-process=style/image_scale1
[4]:https://openproject.oss-cn-beijing.aliyuncs.com/images/flutter/flutter_date_picker_7.png?x-oss-process=style/image_scale1
