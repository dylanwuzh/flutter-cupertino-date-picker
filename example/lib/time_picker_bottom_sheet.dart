import 'package:flutter/material.dart';

import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class TimePickerBottomSheet extends StatefulWidget {
  TimePickerBottomSheet({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TimePickerBottomSheetState();
}

const String MIN_DATETIME = '2010-05-12 10:47:00';
const String MAX_DATETIME = '2021-11-25 22:45:10';
const String INIT_DATETIME = '2019-05-17 18:13:15';

class _TimePickerBottomSheetState extends State<TimePickerBottomSheet> {
  String _format = 'HH:mm';
  TextEditingController _formatCtrl = TextEditingController();

  DateTime _dateTime;

  @override
  void initState() {
    super.initState();
    _formatCtrl.text = _format;
    _dateTime = DateTime.parse(INIT_DATETIME);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle hintTextStyle =
        Theme.of(context).textTheme.subhead.apply(color: Color(0xFF999999));
    return Scaffold(
      appBar: AppBar(title: Text('TimePicker Bottom Sheet')),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // min datetime hint
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 115.0,
                    child: Text('min DateTime:', style: hintTextStyle),
                  ),
                  Text(MIN_DATETIME.substring(11),
                      style: Theme.of(context).textTheme.subhead),
                ],
              ),
            ),

            // max datetime hint
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 115.0,
                    child: Text('max DateTime:', style: hintTextStyle),
                  ),
                  Text(MAX_DATETIME.substring(11),
                      style: Theme.of(context).textTheme.subhead),
                ],
              ),
            ),

            // init datetime hint
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 115.0,
                    child: Text('init DateTime:', style: hintTextStyle),
                  ),
                  Text(INIT_DATETIME.substring(11),
                      style: Theme.of(context).textTheme.subhead),
                ],
              ),
            ),

            // show custom title widget
            Row(
              children: <Widget>[
                Text('show custom title', style: hintTextStyle),
                Checkbox(value: true, onChanged: (value) {}),
              ],
            ),

            // custom title height
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 8.0),
                    child: Text('custom title height:', style: hintTextStyle),
                  ),
                  Text('56.0', style: Theme.of(context).textTheme.subhead),
                ],
              ),
            ),

            // date format input field
            TextField(
              controller: _formatCtrl,
              keyboardType: TextInputType.url,
              decoration: InputDecoration(
                labelText: 'Formatter',
                hintText: 'HH:mm:ss / H-m / H时.m分',
                hintStyle: TextStyle(color: Colors.black26),
              ),
              onChanged: (value) => _format = value,
            ),

            // selected time
            Container(
              margin: EdgeInsets.only(top: 40.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Selected Time:',
                      style: Theme.of(context).textTheme.subhead),
                  Container(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                        '${_dateTime.hour.toString().padLeft(2, '0')}:${_dateTime.minute.toString().padLeft(2, '0')}:${_dateTime.second.toString().padLeft(2, '0')}',
                        style: Theme.of(context).textTheme.title),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showTimePicker,
        tooltip: 'Show TimePicker',
        child: Icon(Icons.access_time),
      ),
    );
  }

  /// Display time picker.
  void _showTimePicker() {
    DatePicker.showDatePicker(
      context,
      minDateTime: DateTime.parse(MIN_DATETIME),
      maxDateTime: DateTime.parse(MAX_DATETIME),
      initialDateTime: DateTime.parse(INIT_DATETIME),
      dateFormat: _format,
      pickerMode: DateTimePickerMode.time, // show TimePicker
      pickerTheme: DateTimePickerTheme(
        title: Container(
          decoration: BoxDecoration(color: Color(0xFFEFEFEF)),
          width: double.infinity,
          height: 56.0,
          alignment: Alignment.center,
          child: Text(
            'custom Title',
            style: TextStyle(color: Colors.green, fontSize: 24.0),
          ),
        ),
        titleHeight: 56.0,
      ),
      onCancel: () {
        debugPrint('onCancel');
      },
      onChange: (dateTime, List<int> index) {
        setState(() {
          _dateTime = dateTime;
        });
      },
      onConfirm: (dateTime, List<int> index) {
        setState(() {
          _dateTime = dateTime;
        });
      },
    );
  }
}
