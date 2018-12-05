# Flutter Cupertino Date Picker

[[Pub Packages]](https://pub.dartlang.org/packages/flutter_cupertino_date_picker)

Flutter 的日期选择器控件，iOS 样式。

![示例][1]

## 用法

#### 1\. 添加依赖

在项目的 `pubspec.yaml` 文件中添加依赖：

```yaml
dependencies:
  flutter_cupertino_date_picker: ^0.3.0
```

#### 2\. 获取包

执行 Flutter 的命令获取包资源：

```bash
$ flutter packages get
```

#### 3\. 导入控件

在项目中导入该控件：

```dart
import 'packages:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
```

#### 4\. 显示控件

```dart
///
/// context: BuildContext.
/// showTitleActions: 是否显示带有确定、取消按钮的标题栏。
/// locale: 国际化标题文字、年、月、日，默认显示英文，'zh' 为中文。
/// minYear: 年份选择器的最小值，默认值：1900年。
/// maxYear: 年份选择器的最大值，默认值：2100年。
/// initialYear: 年份选择器的初始值。
/// initialMonth: 月份选择器的初始值。
/// initialDate: 日期选择器的初始值。
/// cancel: 自定义的取消按钮。
/// confirm: 自定义的确认按钮。
/// onChange: 当前选择的日期改变时的回调事件。
/// onConfirm: 点击标题栏确定按钮的回调事件。
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
  onChanged: (year, month, date) { },
  onConfirm: (year, month, date) { },
);
```

***showTitleActions: false***

![示例: showTitleActions=false][2]

***locale: 'zh'***

中文显示标题按钮、年、月、日

[Thanks to: Robbie Boyd](https://github.com/vagrantrobbie)

![Example: locale=zh][3]

***dateFormat: 'yyyy-mmm-dd'***

日期格式化，目前只支持英文月份

```
dd-mm-yyyy -> 1-10-2018
dd-mmm-yyyy -> 1-Oct-2018
dd-mmmm-yyyy -> 1-October-2018
```

![Example: dateFormat][4]

## 示例

[示例源码](https://github.com/wuzhendev/flutter-cupertino-date-picker/tree/master/example)

## Futures

1. 对显示的日期进行格式化处理。

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
