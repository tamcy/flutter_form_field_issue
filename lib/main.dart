import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class OptionType {
  final String code;
  final String name;

  const OptionType(this.code, this.name);

  @override
  bool operator ==(other) {
    return code == other.code;
  }

  @override
  int get hashCode {
    return code.hashCode;
  }
}

const List<OptionType> options = [
  const OptionType('OPTION_1', '選項一'),
  const OptionType('OPTION_2', '選項二'),
  const OptionType('OPTION_3', 'AbGg'),
];

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double scaleFactor = 2.0;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: scaleFactor),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Form Field Issue'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  RaisedButton(
                    child: Text('1.0'),
                    onPressed: () => setState(() {
                          scaleFactor = 1.0;
                        }),
                  ),
                  RaisedButton(
                    child: Text('1.5'),
                    onPressed: () => setState(() {
                          scaleFactor = 1.5;
                        }),
                  ),
                  RaisedButton(
                    child: Text('2.0'),
                    onPressed: () => setState(() {
                          scaleFactor = 2.0;
                        }),
                  ),
                  RaisedButton(
                    child: Text('3.0'),
                    onPressed: () => setState(() {
                          scaleFactor = 3.0;
                        }),
                  ),
                ],
              ),
              TextFormField(
                initialValue: '中文文字測試AaBg',
                decoration: InputDecoration(
                  isDense: false,
                  labelText: '名稱',
                  errorText: '輸入錯誤',
                ),
              ),
              TextFormField(
                initialValue: '中文文字測試AaBg',
                decoration: InputDecoration(
                  isDense: false,
                  labelText: '名稱',
                ),
              ),
              TextFormField(
                initialValue: '中文文字測試AaBg',
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  isDense: false,
                  labelText: '名稱',
                  errorText: '輸入錯誤',
                ),
              ),
              TextFormField(
                initialValue: 'ENGLISH LABEL',
                decoration: InputDecoration(
                  isDense: false,
                  labelText: 'Enter Something Here',
                  errorText: 'Wrong Input',
                ),
              ),
              DropdownButtonFormField<OptionType>(
                value: const OptionType('OPTION_1', '選項一'),
                decoration: InputDecoration(
                  labelText: '類型',
                  errorText: '有錯',
                ),
                items: options.map((type) {
                  return DropdownMenuItem<OptionType>(
                    value: type,
                    child: Text(type.name),
                  );
                }).toList(),
              ),
              DropdownButtonFormField<OptionType>(
                value: const OptionType('OPTION_3', 'AbGg'),
                decoration: InputDecoration(
                  labelText: 'Dropdown Button',
                  errorText: 'Required',
                ),
                items: options.map((type) {
                  return DropdownMenuItem<OptionType>(
                    value: type,
                    child: Text(type.name),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
