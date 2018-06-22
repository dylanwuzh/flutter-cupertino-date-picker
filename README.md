# Flutter Cupertino Date Picker

[[pub packages]](https://pub.dartlang.org/packages/flutter_cupertino_date_picker)
| [中文说明](./README_zh-cn.md)

Flutter cupertino date picker.

![示例](http://openproject.oss-cn-beijing.aliyuncs.com/images/flutter/date_picker1.png!image_scale1)

## Usage

#### 1\. Depend

Add this to you package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_cupertino_date_picker: ^0.0.3
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
/// minYear: Min value of year's selection range. Default is 1900.
/// maxYear: Max value of year's selection range. Default is 2100.
/// initialYear: Initial value of year.
/// initialMonth: Initial value of month.
/// initialDate: Initial value of date.
/// onChange: An option callback when the currently selected datetime changes.
/// onConfirm: An option callback when tap the confirm button in title bar.
DatePicker.showDatePicker(
  context,
  showTitleActions: true,
  minYear: 1970,
  maxYear: 2020,
  initialYear: 2018,
  initialMonth: 6,
  initialDate: 21,
  onChanged: (year, month, date) { },
  onConfirm: (year, month, date) { },
);
```

***showTitleActions: false***

![示例: showTitleActions=false](http://openproject.oss-cn-beijing.aliyuncs.com/images/flutter/date_picker2.png!image_scale1)

## Example

[Example sources](https://github.com/wuzhendev/flutter-cupertino-date-picker/tree/master/example)

## Futures

1. Format datetime display.
2. Internationalization.

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
