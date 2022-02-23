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

/// the arrow pad widget
class ArrowPad extends StatelessWidget {
  /// creates a rounded widget with 4 arrow keys
  ///
  /// - The widget uses parent's size if
  /// [height] and [width] are not specified
  /// - If [height] and [width] are mentioned,
  /// widget takes the user defined values
  /// - If parent's size is available and also user mentioned size,
  /// then the least of the two is taken
  /// - If the parent doesn't have a size, and user haven't mentioned the size,
  /// it takes a value of [height] = 90 and [width] = 90 as default
  ///
  /// Note: It is better to use it with min size of 55.0
  ///
  /// use [onPressedUp], [onPressedLeft], [onPressedRight], [onPressedDown]
  /// to declare functions on pressed arrows
  ///
  /// [ArrowPadIconStyle] determines the style of the arrow keys
  ///
  /// default padding will be `const EdgeInsets.all(8.0)` unless mentioned
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
    this.height,
    this.width,
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

  /// height of the arrow pad
  final double? height;

  /// width of the arrow pad
  final double? width;

  /// function when up arrow is pressed
  final void Function()? onPressedUp;

  /// function when down arrow is pressed
  final void Function()? onPressedDown;

  /// function when right arrow is pressed
  final void Function()? onPressedRight;

  /// function when left arrow is pressed
  final void Function()? onPressedLeft;

  /// Icon style of the arrow pad [ArrowPadIconStyle]
  ///
  /// Defaults to [ArrowPadIconStyle.chevron]
  final ArrowPadIconStyle arrowPadIconStyle;

  /// outer circle color of the arrow pad
  ///
  /// Defaults to `Color(0xFFE0E0E0)`
  final Color? outerColor;

  /// inner circle color of the arrow pad
  final Color? innerColor;

  /// arrow icon color of the arrow pad
  final Color? iconColor;

  /// splash color of the inner circle arrow pad
  final Color? splashColor;

  /// hover color of the inner circle arrow pad
  final Color? hoverColor;

  /// The amount of space by which to inset the child.
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    List<IconData> _icons = _getIconsFromIconStyle(arrowPadIconStyle);

    return Padding(
      padding: padding ?? const EdgeInsets.all(8.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double _height = constraints.maxHeight;
          double _width = constraints.maxWidth;

          if (height != null && height! <= _height) {
            _height = height!;
          } else if (_height == double.infinity) {
            _height = 90.0;
          }
          if (width != null && width! <= _width) {
            _width = width!;
          } else if (_width == double.infinity) {
            _width = 90.0;
          }

          double _padSize = min(_height, _width);

          return Container(
            height: _height,
            width: _width,
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
          );
        },
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
