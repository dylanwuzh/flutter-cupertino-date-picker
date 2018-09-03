import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Date Picker Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _datetime = '';
  int year = 2018;
  int month = 9;
  int date = 3;

  /// Display date picker.
  void _showDatePicker() {
    final bool showTitleActions = false;
    DatePicker.showDatePicker(
      context,
      showTitleActions: showTitleActions,
      minYear: 1970,
      maxYear: 2020,
      initialYear: year,
      initialMonth: month,
      initialDate: date,
      locale: 'en',
      dateFormat: 'yyyy-mmm-dd',
      onChanged: (year, month, date) {
        print('onChanged date: $year-$month-$date');

        if (!showTitleActions) {
          settingDatetime(year, month, date);
        }
      },
      onConfirm: (year, month, date) {
        settingDatetime(year, month, date);
      },
    );
  }

  void settingDatetime(int year, int month, int date) {
    setState(() {
      this.year = year;
      this.month = month;
      this.date = date;
      _datetime = '$year-$month-$date';
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Date Picker Demo'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'Selected Date:',
              style: Theme.of(context).textTheme.subhead,
            ),
            new Text(
              '$_datetime',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _showDatePicker,
        tooltip: 'DatePicker',
        child: new Icon(Icons.date_range),
      ),
    );
  }
}
