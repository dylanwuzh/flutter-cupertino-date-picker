import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Date Picker Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _datetime = '';
  int _year = 2018;
  int _month = 11;
  int _date = 11;

  String _lang = 'zh';
  String _format = 'yyyy-mm-dd';
  bool _showTitleActions = true;

  TextEditingController _langCtrl = TextEditingController();
  TextEditingController _formatCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _langCtrl.text = 'zh';
    _formatCtrl.text = 'yyyy-mm-dd';

    DateTime now = DateTime.now();
    _year = now.year;
    _month = now.month;
    _date = now.day;
  }

  /// Display date picker.
  void _showDatePicker() {
    final bool showTitleActions = false;
    DatePicker.showDatePicker(
      context,
      showTitleActions: _showTitleActions,
      minYear: 1970,
      maxYear: 2020,
      initialYear: _year,
      initialMonth: _month,
      initialDate: _date,
      confirm: Text(
        'custom ok',
        style: TextStyle(color: Colors.red),
      ),
      cancel: Text(
        'custom cancel',
        style: TextStyle(color: Colors.cyan),
      ),
      locale: _lang,
      dateFormat: _format,
      onChanged: (year, month, date) {
        debugPrint('onChanged date: $year-$month-$date');

        if (!showTitleActions) {
          _changeDatetime(year, month, date);
        }
      },
      onConfirm: (year, month, date) {
        _changeDatetime(year, month, date);
      },
    );
  }

  void _changeDatetime(int year, int month, int date) {
    setState(() {
      _year = year;
      _month = month;
      _date = date;
      _datetime = '$year-$month-$date';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Picker Demo'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: <Widget>[
            // show title actions checkbox
            Row(
              children: <Widget>[
                Text(
                  'Show title actions',
                  style: TextStyle(fontSize: 16.0),
                ),
                Checkbox(
                  value: _showTitleActions,
                  onChanged: (value) {
                    setState(() {
                      _showTitleActions = value;
                    });
                  },
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
              onChanged: (value) {
                _lang = value;
              },
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
                  Text(
                    'Selected Date:',
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                      '$_datetime',
                      style: Theme.of(context).textTheme.title,
                    ),
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
