import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  double? _numberForm;
  String? _startMeasure;
  final List<String> _measures = [
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds (lbs)',
    'ounces',
  ];

  @override
  void initState() {
    _numberForm = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Measures Converter',
      home: Scaffold(
          appBar: AppBar(title: Text('Measures Converter')),
          body: Center(
            child: Column(
              children: [
                DropdownButton(
                  items: _measures.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _startMeasure = value.toString();
                    });
                  },
                  value: _startMeasure,
                ),
                TextField(onChanged: (text) {
                  var rv = double.tryParse(text);
                  //rv ??= 0;
                  setState(() {
                    _numberForm = rv;
                  });
                }),
                Text((_numberForm == null) ? '0' : _numberForm.toString())
              ],
            ),
          )),
    );
  }
}
