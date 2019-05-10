import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import './picker_in_page.dart';
import './picker_bottom_sheet.dart';

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
              child: Text("Date Picker Bottom Sheet", style: textStyle),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return PickerBottomSheet();
                }));
              },
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text("Date Picker In Page", style: textStyle),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return PickerInPage();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
