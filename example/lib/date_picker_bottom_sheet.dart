import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class DatePickerBottomSheet extends StatefulWidget {
  DatePickerBottomSheet({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DatePickerBottomSheetState();
}

class _DatePickerBottomSheetState extends State<DatePickerBottomSheet> {
  String _datetime = '';
  String _format = 'yyyy-MM-dd';
  bool _showTitleActions = true;

  TextEditingController _langCtrl = TextEditingController();
  TextEditingController _formatCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _langCtrl.text = 'zh';
    _formatCtrl.text = _format;
  }

  /// Display date picker.
  void _showDatePicker() {
    CupertinoDatePicker.showDatePicker(
      context,
      pickerTheme: DatePickerTheme(
        showTitle: _showTitleActions,
        confirm: Text('custom ok', style: TextStyle(color: Colors.red)),
        cancel: Text('custom cancel', style: TextStyle(color: Colors.cyan)),
      ),
      minDateTime: DateTime(2000),
      maxDateTime: DateTime(2021, 5, 15),
      initialDateTime: DateTime(2019, 1, 1),
      dateFormat: _format,
      locale: DatePickerLocale.zh_cn,
      onCancel: () {
        debugPrint('onCancel');
      },
      onChange: (dateTime, List<int> index) {
        debugPrint('onChange date: $dateTime');
        debugPrint('onChange index: $index');
        _changeDatetime(dateTime.year, dateTime.month, dateTime.day);
      },
      onConfirm: (dateTime, List<int> index) {
        debugPrint('onConfirm2 date: $dateTime');
        debugPrint('onConfirm2 index: $index');
        _changeDatetime(dateTime.year, dateTime.month, dateTime.day);
      },
    );
  }

  void _changeDatetime(int year, int month, int day) {
    setState(() {
      _datetime = '$year-$month-$day';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DatePicker Bottom Sheet')),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: <Widget>[
            // show title actions checkbox
            Row(
              children: <Widget>[
                Text('Show title actions', style: TextStyle(fontSize: 16.0)),
                Checkbox(
                  value: _showTitleActions,
                  onChanged: (value) => setState(() {
                        _showTitleActions = value;
                      }),
                )
              ],
            ),

            // Language input field
            TextField(
              controller: _langCtrl,
              keyboardType: TextInputType.url,
              decoration: InputDecoration(
                labelText: 'Language',
                hintText: 'en / zh ...',
                hintStyle: TextStyle(color: Colors.black26),
              ),
              onChanged: (value) {},
            ),

            // Formatter input field
            TextField(
              controller: _formatCtrl,
              keyboardType: TextInputType.url,
              decoration: InputDecoration(
                labelText: 'Formatter',
                hintText: 'yyyy-mm-dd / yyyy-mmm-dd / yyyy-mmmm-dd',
                hintStyle: TextStyle(color: Colors.black26),
              ),
              onChanged: (value) {
                _format = value;
              },
            ),

            // Selected date
            Container(
              margin: EdgeInsets.only(top: 40.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Selected Date:', style: Theme.of(context).textTheme.subhead),
                  Container(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text('$_datetime', style: Theme.of(context).textTheme.title),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDatePicker,
        tooltip: 'Show DatePicker',
        child: Icon(Icons.date_range),
      ),
    );
  }
}
