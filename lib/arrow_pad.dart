library arrow_pad;

import 'dart:math';

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
  arrow,
}

class ArrowPad extends StatelessWidget {
  /// creates a rounded widget with 4 arrow keys
  ///
  /// required [height] and [width] determines the size of the widget.
  /// Better to use it with min size of 55.0
  ///
  /// use [onPressedUp], [onPressedLeft], [onPressedRight], [onPressedDown]
  /// to declare functions on pressed arrows
  ///
  /// [ArrowPadIconStyle] determines the style of the arrow keys
  ///
  /// There are different customization options available like [innerColor],
  /// [outerColor], etc.
  ///
  /// Example usage:
  /// ```dart
  /// ArrowPad(
  ///   height: 70,
  ///   width: 70,
  ///   arrowPadIconStyle = ArrowPadIconStyle.arrow,
  ///   onPressedUp: () => print('up'),
  ///   onPressedLeft: () => print('left'),
  ///   onPressedRight: () => print('right'),
  ///   onPressedDown: () => print('down'),
  /// ),
  /// ```
  const ArrowPad({
    Key? key,
    required this.height,
    required this.width,
    this.onPressedUp,
    this.onPressedDown,
    this.onPressedLeft,
    this.onPressedRight,
    this.arrowPadIconStyle = ArrowPadIconStyle.chevron,
    this.outerColor = const Color(0xFFE0E0E0),
    this.innerColor,
    this.iconColor,
    this.splashColor,
    this.hoverColor,
    this.padding,
  }) : super(key: key);

  final double height;
  final double width;
  final void Function()? onPressedUp;
  final void Function()? onPressedDown;
  final void Function()? onPressedRight;
  final void Function()? onPressedLeft;
  final ArrowPadIconStyle arrowPadIconStyle;
  final Color? outerColor;
  final Color? innerColor;
  final Color? iconColor;
  final Color? splashColor;
  final Color? hoverColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    double _padSize = min(height, width);

    List<IconData> _icons = _getIconsFromIconStyle(arrowPadIconStyle);

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Container(
        height: height,
        width: width,
        color: Colors.transparent,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: outerColor,
              shape: BoxShape.circle,
            ),
            height: _padSize,
            width: _padSize,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: Material(
                  color: Colors.transparent,
                  child: Card(
                    color: innerColor,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(_padSize),
                    ),
                    child: InkWell(
                      splashColor: splashColor,
                      hoverColor: hoverColor,
                      borderRadius: BorderRadius.circular(_padSize - 10),
                      onTap: () {},
                      onTapDown: (details) {
                        double x = details.localPosition.dx;
                        double y = details.localPosition.dy;
                        double part = (_padSize - 20) / 3;
                        if (x > part && x < part * 2) {
                          // up or down
                          if (y < part) {
                            if (onPressedUp != null) {
                              onPressedUp!();
                            }
                          } else if (y > part * 2) {
                            if (onPressedDown != null) {
                              onPressedDown!();
                            }
                          }
                        } else if (y > part && y < part * 2) {
                          // left or right
                          if (x < part) {
                            if (onPressedLeft != null) {
                              onPressedLeft!();
                            }
                          } else if (x > part * 2) {
                            if (onPressedRight != null) {
                              onPressedRight!();
                            }
                          }
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              _icons[0],
                              size: _padSize / 5,
                              color: iconColor,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    _icons[1],
                                    size: _padSize / 5,
                                    color: iconColor,
                                  ),
                                  Icon(
                                    _icons[2],
                                    size: _padSize / 5,
                                    color: iconColor,
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              _icons[3],
                              size: _padSize / 5,
                              color: iconColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// returns list of icons based on [iconStyle]
  /// [iconStyle] can be [ArrowPadIconStyle.chevron] or [ArrowPadIconStyle.arrow]
  ///
  /// position of the icons in the list is:
  /// - 0: up
  /// - 1: left
  /// - 2: right
  /// - 3: down
  List<IconData> _getIconsFromIconStyle(ArrowPadIconStyle iconStyle) {
    switch (iconStyle) {
      case ArrowPadIconStyle.arrow:
        return [
          Icons.arrow_upward,
          Icons.arrow_back,
          Icons.arrow_forward,
          Icons.arrow_downward,
        ];
      case ArrowPadIconStyle.chevron:
      default:
        return [
          CupertinoIcons.chevron_up,
          CupertinoIcons.chevron_left,
          CupertinoIcons.chevron_right,
          CupertinoIcons.chevron_down,
        ];
    }
  }
}
