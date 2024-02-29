import 'package:flutter/material.dart';
import './my_object.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _myObject = MyObject(value: 0);

  String? title;
  Widget _buildText() {
    return Text(
      'Giá trị: ${_myObject.value}',
      style: const TextStyle(fontSize: 20),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.person),
          title: Text(title ?? 'DeBugging App'),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            _buildText(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    _myObject.increase();
                    setState(() {});
                  },
                  child: const Text('increase'),
                ),
                OutlinedButton(
                  onPressed: () {
                    _myObject.decrease();
                    setState(() {});
                  },
                  child: const Text('decrease'),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
