import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Colors',
      theme: ThemeData(
        primarySwatch: const MaterialColor(
          0xFFFFFFFF,
          const <int, Color>{
            50: const Color(0xFFFFFFFF),
            100: const Color(0xFFFFFFFF),
            200: const Color(0xFFFFFFFF),
            300: const Color(0xFFFFFFFF),
            400: const Color(0xFFFFFFFF),
            500: const Color(0xFFFFFFFF),
            600: const Color(0xFFFFFFFF),
            700: const Color(0xFFFFFFFF),
            800: const Color(0xFFFFFFFF),
            900: const Color(0xFFFFFFFF),
          },
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Colors'),
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
  String _hexCode = 'FFFFFF';

  Color _toColor(String hexValue) {
    try {
      if (hexValue
          .trim()
          .length == 6) {
        return new Color(int.parse(hexValue, radix: 16) + 0xFF000000);
      } else {
        return new Color(0xFFFFFFFF);
      }
    } catch(e) {
      return new Color(0xFFFFFFFF);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Text('#'),
                  hintText: 'Hexadecimal RGB value',
                ),
                onSubmitted: (value) {
                  setState(() {
                    _hexCode = value;
                  });
                },
              ),
              SizedBox(height: 32,),
              Container(
                height: 40,
                width: 40,
                color: _toColor(_hexCode),
              )
            ],
          ),
        ),
      ),
    );
  }
}
