import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class TimePickerBottomSheet extends StatefulWidget {
  TimePickerBottomSheet({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TimePickerBottomSheetState();
}

class _TimePickerBottomSheetState extends State<TimePickerBottomSheet> {
  String _datetime = '';

  String _format = 'HH:mm';
  bool _showTitleActions = true;

  TextEditingController _formatCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _formatCtrl.text = _format;
  }

  /// Display time picker.
  void _showTimePicker() {
    final bool showTitleActions = false;
    DatePicker.showDatePicker(
      context,
      showTitleActions: _showTitleActions,
      minDateTime: DateTime(2019, 5, 15, 9, 0, 0),
      maxDateTime: DateTime(2021, 5, 15, 21, 0, 0),
      initialDateTime: DateTime.now(),
      confirm: Text('custom ok', style: TextStyle(color: Colors.red)),
      cancel: Text('custom cancel', style: TextStyle(color: Colors.cyan)),
      dateFormat: _format,
      mode: DateTimePickerMode.time, // show TimePicker
      onCancel: () {
        debugPrint('onCancel');
      },
      onChanged2: (dateTime, List<int> index) {
        if (!showTitleActions) {
          _changeDatetime(dateTime);
        }
      },
      onConfirm2: (dateTime, List<int> index) {
        _changeDatetime(dateTime);
      },
    );
  }

  void _changeDatetime(DateTime dateTime) {
    setState(() {
      _datetime = DateFormat(_format).format(dateTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TimePicker Bottom Sheet')),
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

            // Formatter input field
            TextField(
              controller: _formatCtrl,
              keyboardType: TextInputType.url,
              decoration: InputDecoration(
                labelText: 'Formatter',
                hintText: 'HH:mm:ss / H:m / H时:m分',
                hintStyle: TextStyle(color: Colors.black26),
              ),
              onChanged: (value) => _format = value,
            ),

            // Selected date
            Container(
              margin: EdgeInsets.only(top: 40.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Selected Time:', style: Theme.of(context).textTheme.subhead),
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
        onPressed: _showTimePicker,
        tooltip: 'Show TimePicker',
        child: Icon(Icons.access_time),
      ),
    );
  }
}
