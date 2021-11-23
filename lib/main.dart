import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  double? _numberForm;

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
