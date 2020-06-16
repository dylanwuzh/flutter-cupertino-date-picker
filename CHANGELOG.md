## 1.0.26+2

- Update pt_br language.

## 1.0.26+1

- Update pt_br language.

## 1.0.26

- Modify the button widget of the custom title bar to support hidden title and button widget:

```dart
DatePicker.showDatePicker(
  pickerTheme: DateTimePickerTheme(
    showTitle: true,
    confirm: Text('custom Done', style: TextStyle(color: Colors.red)),
    cancel: null, // If a custom title bar is set, the widget(title/confirm/cancel) will not be displayed when the value is null
  ),
);
```

## 1.0.25

- Fixed bug: [Issues #89](https://github.com/dylanwuzh/flutter-cupertino-date-picker/issues/89)

## 1.0.24

- Added language support: Dutch (NL).

## 1.0.23+1

- Remove `keystore.properties`.

## 1.0.23

- Added date format separator: `/`.
- `DatePicker.showDatePicker`: check pickerMode is legal or not by date format.

## 1.0.22

- Support `onMonthChangeStartWithFirstDate` for DatePicker: When the selected month changes, whether to set the selected date as the first day of the month.

## 1.0.21

- Added language support: Bosnian (BS) and Croatian (HR).

## 1.0.20

- Added language support: Ukraine (UK).

## 1.0.19+1

- Update LICENSE file.

## 1.0.19

- Added language support: Serbia Cyrillic(DateTimePickerLocale.sr_cyrl) and Latin(DateTimePickerLocale.sr_latn).

## 1.0.18

- Added language support: Turkish (DateTimePickerLocale.tr).

## 1.0.17

- Added language support: Vietnamese (DateTimePickerLocale.vi).

## 1.0.16

- Added language support: French (DateTimePickerLocale.fr).

## 1.0.15+1

- Modified Indonesia's subtag: DateTimePickerLocale.in_id -> DateTimePickerLocale.id

## 1.0.15

- Added language support: Bahasa Indonesia (DateTimePickerLocale.in_id).

## 1.0.14

- Added language support: Arabic Egypt (DateTimePickerLocale.ar_eg).

## 1.0.13+1

- Fixed bug: `DateTimePickerMode.datetime` mode display error. Issues: [#91](https://github.com/dylanwuzh/flutter-cupertino-date-picker/issues/91)

## 1.0.13

- Compatible with Flutter `dev` channel.

## 1.0.12

- Fixed bug: when `onClose` is null, catch exception `Unhandled Exception: NoSuchMethodError: The method 'call' was called on null. Receiver: null`. Issues: [#40](https://github.com/wuzhendev/flutter-cupertino-date-picker/issues/40) and [#43](https://github.com/wuzhendev/flutter-cupertino-date-picker/issues/43).

## 1.0.11

- Added `minuteDivider` parameter.

## 1.0.10

- Added `onClose` callback.

## 1.0.9

- Added language support: Hungarian (DateTimePickerLocale.hu).

## 1.0.8

- Refactor i18n codes.

## 1.0.7

- Added language support: Italian (DateTimePickerLocale.it).

## 1.0.6

- Added language support: Korea (DateTimePickerLocale.ko).

## 1.0.5

- Added language support: German (DateTimePickerLocale.de).

## 1.0.4

- Added language support: Russian (DateTimePickerLocale.ru).

## 1.0.3

- Added language support: Japanese (DateTimePickerLocale.jp).

## 1.0.2

- Added language support: Arabic (DateTimePickerLocale.ar).

## 1.0.1

- Added language support: Bengali (DateTimePickerLocale.bn).

## 1.0.0

- Refactor code.
- Support `DatePicker`、`TimePicker`、`DateTimePicker`.
- Support `DatePickerWidget`、`TimePickerWidget`、`DateTimePickerWidget`.
- Upgrade date format.
- Add `DateTimePickerTheme`.
- Add `DateTimePickerLocale` for locale.

## 0.8.0

- Support set the value of minimum DateTime and maximum DateTime.

## 0.7.0

- Change days in a month when moth changes.

## 0.6.0

- Add `DatePickerWidget` widget for display DatePicker in page.

## 0.5.0

- Add `onChanged2(DateTime dateTime, List<int> selectedIndex)` callback.
- Add `onConfirm2(DateTime dateTime, List<int> selectedIndex)` callback.
- Add `minDateTime`.
- Add `maxDateTime`.
- Add `initialDateTime`.

## 0.4.0

- Add `onCancel` callback.

## 0.3.0

- Support Flutter v1.0.

## 0.2.0

- Add custom cancel and confirm button.

## 0.1.0

- Refactor locale message.

## 0.0.7

- Support language support: Portuguese Brazil (DateTimePickerLocale.pt_br).

## 0.0.6

- Support English months.

## 0.0.5

- Fix month and day in zh locale.

## 0.0.4

- Support i18n.

## 0.0.2

- Complete README file.

## 0.0.1

- Initial Release.
