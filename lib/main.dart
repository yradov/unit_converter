import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  double? _numberForm;
  String? _startMeasure;
  String? _convertedMeasure;
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
    final TextStyle inputStyle = TextStyle(
      fontSize: 20,
      color: Colors.blue[900],
    );

    final TextStyle labelStyle = TextStyle(
      fontSize: 24,
      color: Colors.blue[700],
    );

    return MaterialApp(
      title: 'Measures Converter',
      home: Scaffold(
        appBar: AppBar(title: const Text('Measures Converter')),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Spacer(),
              Text(
                'Value',
                style: labelStyle,
              ),
              const Spacer(),
              TextField(
                  style: inputStyle,
                  decoration: const InputDecoration(
                    hintText: "Please insert the measure to be converted",
                  ),
                  onChanged: (text) {
                    var rv = double.tryParse(text);
                    //rv ??= 0;
                    setState(() {
                      _numberForm = rv;
                    });
                  }),
              const Spacer(),
              Text(
                'From',
                style: labelStyle,
              ),
              const Spacer(),
              DropdownButton(
                isExpanded: true,
                style: inputStyle,
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
              const Spacer(),
              Text(
                'To',
                style: labelStyle,
              ),
              const Spacer(),
              DropdownButton(
                isExpanded: true,
                style: inputStyle,
                items: _measures.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: inputStyle,
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _convertedMeasure = value.toString();
                  });
                },
                value: _convertedMeasure,
              ),
              const Spacer(
                flex: 2,
              ),
              ElevatedButton(
                child: Text("Convert", style: inputStyle),
                onPressed: () => true,
              ),
              const Spacer(
                flex: 2,
              ),
              Text((_numberForm == null) ? '' : _numberForm.toString(),
                  style: labelStyle),
              const Spacer(
                flex: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
