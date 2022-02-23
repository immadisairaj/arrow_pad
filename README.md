An arrow pad which resembles the mp3 player button style. But instead, there are 4 arrows.

![Arrow Pad Demo](https://user-images.githubusercontent.com/40348358/155262478-bf5d0f1a-6a4c-4233-9f58-032d5bcd2643.gif)

![Screenshot 1](https://user-images.githubusercontent.com/40348358/155262898-14c293dd-c39d-4772-adad-4a221a3a67d7.png)
![Screenshot 2](https://user-images.githubusercontent.com/40348358/155262967-e44897a3-0f14-4493-978a-8cba68180d31.png)

## Features

The package can be used in any plaform. It is platform independent.

- Customize the widget using your own styles
- Different icon styles

## Setup

There is no special setup required, just add the dependency in `pubspec.yaml`, import the file, and you are good to go..

Add the dependency in `pubspec.yaml`
```yaml
arrow_pad: ^0.1.0 # Note: use latest version
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

The Arrow Pad can be customized with colors and icon styles.
```dart
// custom usage
ArrowPad(
    height: 80.0,
    width: 80.0,
    innerColor: Colors.blue,
    arrowPadIconStyle: ArrowPadIconStyle.arrow,
    onPressedUp: () => print('up'),
    onPressedLeft: () => print('left'),
    onPressedRight: () => print('right'),
    onPressedDown: () => print('down'),
),
```
![Screenshot 3](https://user-images.githubusercontent.com/40348358/155263058-8b760258-b7a4-4bc0-976e-b4d02f7b0120.png)

You can find more usage details in the [`/example`](https://github.com/immadisairaj/arrow_pad/tree/main/example).

## Additional information

<!-- TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more. -->

This package is licensed under [BSD 3-Clause License](https://github.com/immadisairaj/arrow_pad/blob/main/LICENSE)

<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->
