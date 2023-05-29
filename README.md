An arrow pad which resembles the mp3 player button style. But instead, there are 4 arrows.

![Arrow Pad Demo](https://user-images.githubusercontent.com/40348358/155262478-bf5d0f1a-6a4c-4233-9f58-032d5bcd2643.gif)

![Screenshot 1](https://user-images.githubusercontent.com/40348358/155262898-14c293dd-c39d-4772-adad-4a221a3a67d7.png)
![Screenshot 2](https://user-images.githubusercontent.com/40348358/155262967-e44897a3-0f14-4493-978a-8cba68180d31.png)

## Features

The package can be used in any plaform. It is platform independent.

- Customize the widget using your own styles
- Different icon styles
- Click trigger on tap down or tap up

## Setup

There is no special setup required, just add the dependency in `pubspec.yaml`, import the file, and you are good to go..

Add the dependency in `pubspec.yaml`
```yaml
arrow_pad: ^0.2.0 # Note: use latest version
```

Import the widget into dart file
```dart
import 'package:arrow_pad/arrow_pad.dart';
```
## Usage

The default usage of the arrow pad:
```dart
// default usage
const ArrowPad(),
```
![Screenshot 1](https://user-images.githubusercontent.com/40348358/155262898-14c293dd-c39d-4772-adad-4a221a3a67d7.png)

The Arrow Pad can be customized with colors, icon styles and click trigger.
```dart
// custom usage
ArrowPad(
    height: 80.0,
    width: 80.0,
    innerColor: Colors.blue,
    arrowPadIconStyle: ArrowPadIconStyle.arrow,
    clickTrigger: ClickTrigger.onTapDown,
    onPressedUp: () => print('up'),
    onPressedLeft: () => print('left'),
    onPressedRight: () => print('right'),
    onPressedDown: () => print('down'),
),
```
![Screenshot 3](https://user-images.githubusercontent.com/40348358/155263058-8b760258-b7a4-4bc0-976e-b4d02f7b0120.png)

You can find more usage details in the [`/example`](https://github.com/immadisairaj/arrow_pad/tree/main/example).

## Dependency

This package uses [`cupertino_icons`](https://pub.dev/packages/cupertino_icons) for the default arrow icon style.

## Additional information

This package is licensed under [BSD 3-Clause License](https://github.com/immadisairaj/arrow_pad/blob/main/LICENSE)
