import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Date Picker Timeline Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DatePickerController _controller = DatePickerController();

  DateTime _selectedValue = DateTime.now();

  static final dateInfoHeight = 11.0;
  final Map<DateTime, Widget> unselectedWeather = {
    for (int i = 0; i < 10; i++)
      ...{
        DateTime.now().add(Duration(days: i)): Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.wb_sunny,
              color: Colors.yellow,
              size: dateInfoHeight,
            ),
            Text(
              "20°C",
              style: TextStyle(
                color: Colors.yellow,
                fontSize: dateInfoHeight,
              ),
            ),
          ],
        ),
      }
  };

  final Map<DateTime, Widget> selectedWeather = {
    for (int i = 0; i < 10; i++)
      ...{
        DateTime.now().add(Duration(days: i)): Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.ac_unit,
              color: Colors.blue,
              size: dateInfoHeight,
            ),
            Text(
              "10°C",
              style: TextStyle(
                color: Colors.blue,
                fontSize: dateInfoHeight,
              ),
            ),
          ],
        ),
      }
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.replay),
          onPressed: () {
            _controller.animateToSelection();
          },
        ),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          color: Colors.blueGrey[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("You Selected:"),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Text(_selectedValue.toString()),
              Padding(
                padding: EdgeInsets.all(20),
              ),
              Container(
                child: DatePicker(
                  DateTime.now(),
                  height: 90,
                  controller: _controller,
                  initialSelectedDate: DateTime.now(),
                  onDateChange: (date) {
                    // New date selected
                    setState(() {
                      _selectedValue = date;
                    });
                  },
                  selectedDateInfo: selectedWeather,
                  unselectedDateInfo: unselectedWeather,
                  dateInfoHeight: dateInfoHeight,
                ),
              ),
            ],
          ),
        ));
  }
}
