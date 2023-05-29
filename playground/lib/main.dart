import 'package:arrow_pad/arrow_pad.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arrow Pad Playground',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ArrowPadIconStyle arrowPadIconStyle;
  late ClickTrigger clickTrigger;
  final String constString = 'Clicked';
  late String textToDisplay;

  @override
  void initState() {
    super.initState();
    arrowPadIconStyle = ArrowPadIconStyle.chevron;
    clickTrigger = ClickTrigger.onTapDown;
    textToDisplay = 'Not clicked yet';
  }

  @override
  Widget build(BuildContext context) {
    final headingStyle = Theme.of(context).textTheme.headlineSmall;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Arrow Pad Playground'),
        actions: [
          IconButton(
            onPressed: () => _launchUrl(
                Uri.parse('https://github.com/immadisairaj/arrow_pad')),
            icon: const Icon(Icons.code),
            tooltip: 'Open Source Code',
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: ArrowPad(
                    arrowPadIconStyle: arrowPadIconStyle,
                    clickTrigger: clickTrigger,
                    onPressed: (direction) => setState(
                      () => textToDisplay = '$constString $direction',
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Text(
                textToDisplay,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            Flexible(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Icon Style
                      Text('Icon Style', style: headingStyle),
                      RadioListTile(
                        title: const Text('Chevron'),
                        value: ArrowPadIconStyle.chevron,
                        groupValue: arrowPadIconStyle,
                        onChanged: (value) {
                          setState(() {
                            arrowPadIconStyle = value as ArrowPadIconStyle;
                          });
                        },
                      ),
                      RadioListTile(
                        title: const Text('Arrow'),
                        value: ArrowPadIconStyle.arrow,
                        groupValue: arrowPadIconStyle,
                        onChanged: (value) {
                          setState(() {
                            arrowPadIconStyle = value as ArrowPadIconStyle;
                          });
                        },
                      ),
                      // Click Trigger
                      SwitchListTile(
                        title: Text('Click Trigger', style: headingStyle),
                        subtitle: Text(
                          clickTrigger == ClickTrigger.onTapDown
                              ? 'On Tap Down is enabled'
                              : 'On Tap Up is enabled',
                        ),
                        value: clickTrigger == ClickTrigger.onTapDown,
                        onChanged: (value) {
                          setState(() {
                            clickTrigger =
                                clickTrigger == ClickTrigger.onTapDown
                                    ? ClickTrigger.onTapUp
                                    : ClickTrigger.onTapDown;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
