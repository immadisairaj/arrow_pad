import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// icon styles of the arrow pad
enum ArrowPadIconStyle {
  /// the default arrow pad icon style
  ///
  /// uses the icons [CupertinoIcons.chevron_up],
  /// [CupertinoIcons.chevron_left], [CupertinoIcons.chevron_right]
  /// and [CupertinoIcons.chevron_down]
  chevron,

  /// uses the icons [Icons.arrow_upward],
  /// [Icons.arrow_back], [Icons.arrow_forward]
  /// and [Icons.arrow_downward]
  arrow;

  /// returns list of icons based on the current icon style
  ///
  /// position of the icons in the list is:
  /// - 0: up
  /// - 1: left
  /// - 2: right
  /// - 3: down
  List<IconData> getIcons() {
    return switch (this) {
      ArrowPadIconStyle.arrow => [
          Icons.arrow_upward,
          Icons.arrow_back,
          Icons.arrow_forward,
          Icons.arrow_downward,
        ],
      ArrowPadIconStyle.chevron || _ => [
          CupertinoIcons.chevron_up,
          CupertinoIcons.chevron_left,
          CupertinoIcons.chevron_right,
          CupertinoIcons.chevron_down,
        ],
    };
  }
}
