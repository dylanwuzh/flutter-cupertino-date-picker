import 'package:flutter/material.dart';

import './date_picker_bottom_sheet.dart';
import './date_picker_in_page.dart';
import './datetime_picker_bottom_sheet.dart';
import './datetime_picker_in_page.dart';
import './time_picker_bottom_sheet.dart';
import './time_picker_in_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Date Picker Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(color: Colors.white, fontSize: 16.0);
    return Scaffold(
      appBar: AppBar(title: Text('Date Picker Demo')),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
              color: Colors.blue,
              child: Text("DatePicker Bottom Sheet", style: textStyle),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return DatePickerBottomSheet();
                }));
              },
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text("DatePicker In Page", style: textStyle),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return DatePickerInPage();
                }));
              },
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text("TimePicker Bottom Sheet", style: textStyle),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return TimePickerBottomSheet();
                }));
              },
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text("TimePicker In Page", style: textStyle),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return TimePickerInPage();
                }));
              },
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text("DateTimePicker Bottom Sheet", style: textStyle),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return DateTimePickerBottomSheet();
                }));
              },
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text("DateTimePicker In Page", style: textStyle),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return DateTimePickerInPage();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
