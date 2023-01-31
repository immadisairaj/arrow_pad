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

class ArrowPadExample extends StatefulWidget {
  const ArrowPadExample({Key? key}) : super(key: key);

  @override
  _ArrowPadExampleState createState() => _ArrowPadExampleState();
}

class _ArrowPadExampleState extends State<ArrowPadExample> {
  String _secondArrowPadValue = 'With Functions (tapDown)';
  String _thirdArrowPadValue = 'With Functions (tapUp)';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Arrow Pad Example'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  ArrowPad(),
                  Text('Default Arrow Pad'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ArrowPad(
                    padding: const EdgeInsets.all(8.0),
                    height: height / 5,
                    width: width / 4,
                    iconColor: Colors.white,
                    innerColor: Colors.red,
                    outerColor: const Color(0xFFCC0000),
                    splashColor: const Color(0xFFCC0000),
                    hoverColor: const Color(0xFFFF4D4D),
                    onPressedUp: () {
                      setState(() {
                        _secondArrowPadValue = 'Up Pressed (tapDown)';
                      });
                    },
                    onPressedDown: () {
                      setState(() {
                        _secondArrowPadValue = 'Down Pressed (tapDown)';
                      });
                    },
                    onPressedLeft: () {
                      setState(() {
                        _secondArrowPadValue = 'Left Pressed (tapDown)';
                      });
                    },
                    onPressedRight: () {
                      setState(() {
                        _secondArrowPadValue = 'Right Pressed (tapDown)';
                      });
                    },
                  ),
                  Text(_secondArrowPadValue),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ArrowPad(
                    padding: const EdgeInsets.all(8.0),
                    height: height / 5,
                    width: width / 4,
                    iconColor: Colors.white,
                    innerColor: Colors.red,
                    outerColor: const Color(0xFFCC0000),
                    splashColor: const Color(0xFFCC0000),
                    hoverColor: const Color(0xFFFF4D4D),
                    clickTrigger: ClickTrigger.onTapUp,
                    onPressedUp: () {
                      setState(() {
                        _thirdArrowPadValue = 'Up Pressed (tapUp)';
                      });
                    },
                    onPressedDown: () {
                      setState(() {
                        _thirdArrowPadValue = 'Down Pressed (tapUp)';
                      });
                    },
                    onPressedLeft: () {
                      setState(() {
                        _thirdArrowPadValue = 'Left Pressed (tapUp)';
                      });
                    },
                    onPressedRight: () {
                      setState(() {
                        _thirdArrowPadValue = 'Right Pressed (tapUp)';
                      });
                    },
                  ),
                  Text(_thirdArrowPadValue),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ArrowPad(
                    padding: const EdgeInsets.all(8.0),
                    height: height / 5,
                    width: width / 4,
                    arrowPadIconStyle: ArrowPadIconStyle.arrow,
                    hoverColor: Colors.green,
                    iconColor: const Color(0xFF631739),
                    outerColor: const Color(0xFF86FC8A),
                  ),
                  const Text('Without Functions'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ArrowPad(
                    height: height / 7,
                    width: width / 6,
                    innerColor: Colors.blue,
                    arrowPadIconStyle: ArrowPadIconStyle.arrow,
                  ),
                  const Text('Small Size'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
