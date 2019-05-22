import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:flutter/material.dart';

class DateTimePickerBottomSheet extends StatefulWidget {
  DateTimePickerBottomSheet({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DateTimePickerBottomSheetState();
}

const String MIN_DATETIME = '2019-05-15 09:23:10';
const String MAX_DATETIME = '2019-06-03 21:11:00';
const String INIT_DATETIME = '2019-05-16 09:00:00';

class _DateTimePickerBottomSheetState extends State<DateTimePickerBottomSheet> {
  String _format = 'yy年M月d日  EEE,H时:m分';
  bool _showTitle = true;

  TextEditingController _formatCtrl = TextEditingController();

  DatePickerLocale _locale = DatePickerLocale.zh_cn;
  List<DatePickerLocale> _locales = DatePickerLocale.values;

  DateTime _dateTime;

  @override
  void initState() {
    super.initState();
    _formatCtrl.text = _format;
    _dateTime = DateTime.parse(INIT_DATETIME);
  }

  /// Display time picker.
  void _showDateTimePicker() {
    DatePicker.showDatePicker(
      context,
      minDateTime: DateTime.parse(MIN_DATETIME),
      maxDateTime: DateTime.parse(MAX_DATETIME),
      initialDateTime: DateTime.parse(INIT_DATETIME),
      dateFormat: _format,
      locale: _locale,
      pickerTheme: DatePickerTheme(
        showTitle: _showTitle,
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
      _dateTime = dateTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> radios = List<Widget>();
    _locales.forEach((locale) {
      radios.add(Container(
        margin: EdgeInsets.only(right: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Radio(
                value: locale,
                groupValue: _locale,
                onChanged: (value) {
                  setState(() {
                    _locale = value;
                  });
                }),
            Text(locale.toString().substring(locale.toString().indexOf('.') + 1)),
          ],
        ),
      ));
    });

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
                  Text(MIN_DATETIME, style: Theme.of(context).textTheme.subhead),
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
                  Text(MAX_DATETIME, style: Theme.of(context).textTheme.subhead),
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
                  Text(INIT_DATETIME, style: Theme.of(context).textTheme.subhead),
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
                    value: _showTitle,
                    onChanged: (value) => setState(() {
                          _showTitle = value;
                        }),
                  )
                ],
              ),
            ),

            // locale
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[Text('Locale: '), Wrap(direction: Axis.horizontal, children: radios)],
              ),
            ),

            // Formatter input field
            TextField(
              controller: _formatCtrl,
              keyboardType: TextInputType.url,
              decoration: InputDecoration(
                labelText: 'Date Format: ',
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
                    child: Text(
                      '${_dateTime.year}-${_dateTime.month.toString().padLeft(2, '0')}-${_dateTime.day.toString().padLeft(2, '0')} ${_dateTime.hour.toString().padLeft(2, '0')}:${_dateTime.minute.toString().padLeft(2, '0')}:${_dateTime.second.toString().padLeft(2, '0')}',
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
        onPressed: _showDateTimePicker,
        tooltip: 'Show DateTimePicker',
        child: Icon(Icons.access_time),
      ),
    );
  }
}
