import 'package:arrow_pad/arrow_pad.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arrow Pad Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ArrowPadExample(),
    );
  }
}

class ArrowPadExample extends StatelessWidget {
  const ArrowPadExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Arrow Pad Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ArrowPad(
              padding: const EdgeInsets.all(8.0),
              height: height / 4,
              width: width / 4,
            ),
            ArrowPad(
              padding: const EdgeInsets.all(8.0),
              height: height / 4,
              width: width / 4,
              arrowPadIconStyle: ArrowPadIconStyle.arrow,
            ),
          ],
        ),
      ),
    );
  }
}
