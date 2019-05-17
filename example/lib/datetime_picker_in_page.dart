import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

///
/// @author dylan wu
/// @since 2019-05-10
class DateTimePickerInPage extends StatefulWidget {
  DateTimePickerInPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DateTimePickerInPageState();
}

class _DateTimePickerInPageState extends State<DateTimePickerInPage> {
  DateTime _currDateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TimePicker In Page")),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 40.0),
              child: TimePickerWidget(
                minDateTime: DateTime(2019, 5, 15, 8, 10, 10),
                maxDateTime: DateTime(2019, 5, 15, 12, 20, 20),
                initDateTime: DateTime(2019, 5, 15, 10, 1, 10),
                dateFormat: 'HH时:mm分:s',
                pickerTheme: DatePickerTheme(showTitle: false),
                onChange: (dateTime, selectedIndex) {
                  setState(() {
                    _currDateTime = dateTime;
                  });
                },
              ),
            ),

            // Selected date
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Selected DateTime:', style: Theme.of(context).textTheme.subhead),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 4.0),
                  child: Text(
                    _currDateTime != null
                        ? '${_currDateTime.year}-${_currDateTime.month}-${_currDateTime.day} ${_currDateTime.hour.toString().padLeft(2, '0')}:${_currDateTime.minute.toString().padLeft(2, '0')}:${_currDateTime.second.toString().padLeft(2, '0')}'
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
