## 1.0.0
- **Breaking:** migrate to the standalone `package:material_ui` and
  `package:cupertino_ui` (Flutter 3.47+). `ArrowPad` now reads `Theme` from
  `material_ui`, so apps must use `MaterialApp` from `material_ui` (or the
  `MaterialUiCompatibilityBridge`). The ArrowPad API itself is unchanged.
- Requires Dart `^3.13.0` and Flutter `>=3.47.0`.
- `cupertino_icons` ^2.0.0
- Add `onPressStart` and `onPressEnd` to react to a held arrow (touch down /
  finger up or gesture cancelled). Independent of `clickTrigger`.
- `ArrowPad` is now a `StatefulWidget` (no API change) to pair start/end calls.
- Add `public_member_api_docs` lint and update to `flutter_lints` 6

Need the old `package:flutter/material.dart` version? Stay on `arrow_pad: ^0.2.0`.

## 0.3.0 (unreleased, folded into 1.0.0)
- Add `onPressStart` and `onPressEnd` to react to a held arrow (touch down /
  finger up or gesture cancelled). Independent of `clickTrigger`.
- `ArrowPad` is now a `StatefulWidget` (no API change) to pair start/end calls.
- Update lints to `flutter_lints` 6

## 0.2.0
- Deprecate onPressedUp, onPressedRight, onPressedDown, onPressedLeft
- Instead use onPressed
- Now supports dynamic colors based on ThemeData
- Updates to Flutter 3.10

## 0.1.5
- add option to trigger the pressed functions on tap down or tap up (clickTrigger)
- refactor the code

## 0.1.4
- make the widget to fit in sized box instead of container
- make the inner circle adjust dynamically

## 0.1.3
- fix dependency issue
- update documentation

## 0.1.2
- update documentation

## 0.1.1
- Update Readme
- Add documentation

## 0.1.0
- Initial Release
