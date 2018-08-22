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

  /// Display date picker.
  void _showDatePicker() {
    DatePicker.showDatePicker(
      context,
      showTitleActions: false,
      minYear: 1970,
      maxYear: 2020,
      initialYear: 2018,
      initialMonth: 8,
      initialDate: 23,
      locale: 'zh',
      onChanged: (year, month, date) {
        print('onChanged date: $year-$month-$date');
      },
      onConfirm: (year, month, date) {
        setState(() {
          _datetime = '$year-$month-$date';
        });
      },
    );
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
