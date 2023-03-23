import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  DateTime currentDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050)
    );
    if (pickedDate != null && pickedDate != currentDate) {
      print(pickedDate);
      setState(() {
        currentDate = pickedDate;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentDate == null ? "Chưa chọn ngày" : DateFormat('dd-MM-yyyy').format(currentDate)),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(currentDate == null ? "Chưa chọn ngày" : DateFormat('dd-MM-yyyy').format(currentDate)),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text('Lựa chọn ngày'),
            ),
          ],
        ),
      ),
    );
  }
}