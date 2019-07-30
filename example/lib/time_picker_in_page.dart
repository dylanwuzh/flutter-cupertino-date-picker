import 'package:flutter/material.dart';

import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

///
/// @author dylan wu
/// @since 2019-05-10
class TimePickerInPage extends StatefulWidget {
  TimePickerInPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TimePickerInPageState();
}

const String MIN_DATETIME = '2010-05-12 05:15:20';
const String MAX_DATETIME = '2021-11-25 22:45:10';
const String INIT_DATETIME = '2019-05-17 18:13:15';
const String DATE_FORMAT = 'HH时:mm分:s';

class _TimePickerInPageState extends State<TimePickerInPage> {
  DateTime _dateTime;

  @override
  void initState() {
    super.initState();
    _dateTime = DateTime.parse(INIT_DATETIME);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle hintTextStyle =
        Theme.of(context).textTheme.subhead.apply(color: Color(0xFF999999));
    return Scaffold(
      appBar: AppBar(title: Text("TimePicker In Page")),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
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

            // date format
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 115.0,
                    child: Text('Date Format:', style: hintTextStyle),
                  ),
                  Text(DATE_FORMAT, style: Theme.of(context).textTheme.subhead),
                ],
              ),
            ),

            // date format input field
            Container(
              margin: EdgeInsets.only(top: 8.0, bottom: 40.0),
              child: TimePickerWidget(
                minDateTime: DateTime.parse(MIN_DATETIME),
                maxDateTime: DateTime.parse(MAX_DATETIME),
                initDateTime: DateTime.parse(INIT_DATETIME),
                dateFormat: DATE_FORMAT,
                minuteDivider: 15,
                pickerTheme: DateTimePickerTheme(
                    showTitle: false, backgroundColor: Color(0xFFe1bee7)),
                onChange: (dateTime, selectedIndex) {
                  setState(() {
                    _dateTime = dateTime;
                  });
                },
              ),
            ),

            // selected time
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Selected Time:',
                    style: Theme.of(context).textTheme.subhead),
                Container(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    _dateTime != null
                        ? '${_dateTime.hour.toString().padLeft(2, '0')}:${_dateTime.minute.toString().padLeft(2, '0')}:${_dateTime.second.toString().padLeft(2, '0')}'
                        : '',
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
