import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Authentication'),

      ),
      body: Center(
        child: Text('successfully implement',
        style: TextStyle(
          color: Colors.blueAccent,
              fontSize: 20.0
        ),
        ),
      ),
    );
  }
}
