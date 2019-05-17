import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:flutter/material.dart';

class DateTimePickerBottomSheet extends StatefulWidget {
  DateTimePickerBottomSheet({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DateTimePickerBottomSheetState();
}

class _DateTimePickerBottomSheetState extends State<DateTimePickerBottomSheet> {
  String _datetime = '';

  String _format = 'yyyy年M月d日EEE,H时:m分';
  bool _showTitleActions = true;

  TextEditingController _formatCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _formatCtrl.text = _format;
  }

  /// Display time picker.
  void _showDateTimePicker() {
    CupertinoDatePicker.showDatePicker(
      context,
      minDateTime: DateTime(2019, 5, 15, 9, 23, 10),
      maxDateTime: DateTime(2019, 6, 3, 21, 10, 0),
      initialDateTime: DateTime(2019, 5, 16, 9, 0, 0),
      dateFormat: _format,
      pickerTheme: DatePickerTheme(
        showTitle: _showTitleActions,
      ),
      pickerMode: DateTimePickerMode.datetime, // show TimePicker
      onCancel: () {
        debugPrint('onCancel');
      },
      onChange: (dateTime, List<int> index) {
        _changeDatetime(dateTime);
      },
      onConfirm: (dateTime, List<int> index) {
        _changeDatetime(dateTime);
      },
    );
  }

  void _changeDatetime(DateTime dateTime) {
    setState(() {
      _datetime =
          '${dateTime.year}-${dateTime.month}-${dateTime.day} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DateTimePicker Bottom Sheet')),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 115.0,
                    child: Text(
                      'min DateTime:',
                      style: Theme.of(context).textTheme.subhead.apply(color: Color(0xFF999999)),
                    ),
                  ),
                  Text('2019-05-15 09:23:10', style: Theme.of(context).textTheme.subhead),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 115.0,
                    child: Text('max DateTime:',
                        style: Theme.of(context).textTheme.subhead.apply(color: Color(0xFF999999))),
                  ),
                  Text('2019-06-03 21:10:00', style: Theme.of(context).textTheme.subhead),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 115.0,
                    child: Text('init DateTime:',
                        style: Theme.of(context).textTheme.subhead.apply(color: Color(0xFF999999))),
                  ),
                  Text('2019-05-16 09:00:00', style: Theme.of(context).textTheme.subhead),
                ],
              ),
            ),

            // show title actions checkbox
            Container(
              height: 30.0,
              margin: EdgeInsets.only(top: 16.0),
              child: Row(
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
            ),

            // Formatter input field
            TextField(
              controller: _formatCtrl,
              keyboardType: TextInputType.url,
              decoration: InputDecoration(
                labelText: 'Formatter',
                hintText: 'yyyyMMdd HH:mm:ss / H:m / H时:m分',
                hintStyle: TextStyle(color: Colors.black26),
              ),
              onChanged: (value) => _format = value,
            ),

            // Selected date
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Selected DateTime:', style: Theme.of(context).textTheme.subhead),
                  Container(
                    padding: EdgeInsets.only(top: 4.0),
                    child: Text('$_datetime', style: Theme.of(context).textTheme.title),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDateTimePicker,
        tooltip: 'Show DateTimePicker',
        child: Icon(Icons.access_time),
      ),
    );
  }
}
