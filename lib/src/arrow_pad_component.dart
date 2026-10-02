// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:math';

import 'package:material_ui/material_ui.dart';

import 'arrow_pad_icon_style.dart';
import 'click_trigger.dart';
import 'press_direction.dart';

/// the arrow pad widget
class ArrowPad extends StatefulWidget {
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
  /// Use [onPressed] to declare functions on pressed arrows
  ///
  /// Use [onPressStart] and [onPressEnd] to react to a press being held, e.g.
  /// to move something while an arrow is down and stop when it is released.
  /// They are independent of [clickTrigger] and [onPressed].
  ///
  /// Use [clickTrigger] to declare when to trigger the pressed functions.
  /// Either on [ClickTrigger.onTapDown] or [ClickTrigger.onTapUp]
  ///
  /// [ArrowPadIconStyle] determines the style of the arrow keys
  ///
  /// Default padding will be `const EdgeInsets.all(8.0)` unless mentioned
  ///
  /// By default, the theming of the arrow pad will be taken from the
  /// [ThemeData] of ancestors (if available). There are also different
  /// customization options  available like [innerColor], [outerColor], etc.
  ///
  /// Example usage:
  /// ```dart
  /// ArrowPad(
  ///   height: 70,
  ///   width: 70,
  ///   arrowPadIconStyle = ArrowPadIconStyle.arrow,
  ///   clickTrigger: ClickTrigger.onTapUp,
  ///   onPressed: (direction) => print('Pressed $direction'),
  /// ),
  /// ```
  const ArrowPad({
    super.key,
    this.height,
    this.width,
    this.onPressedUp,
    this.onPressedDown,
    this.onPressedLeft,
    this.onPressedRight,
    this.onPressed,
    this.onPressStart,
    this.onPressEnd,
    this.clickTrigger = ClickTrigger.onTapDown,
    this.arrowPadIconStyle = ArrowPadIconStyle.chevron,
    this.outerColor,
    this.innerColor,
    this.iconColor,
    this.splashColor,
    this.hoverColor,
    this.padding,
  }) : assert(
            !(onPressed != null &&
                (onPressedDown != null ||
                    onPressedUp != null ||
                    onPressedRight != null ||
                    onPressedLeft != null)),
            'Either use [onPressed] or the old 4 methods.');

  /// height of the arrow pad
  final double? height;

  /// width of the arrow pad
  final double? width;

  /// function when up arrow is pressed
  @Deprecated('Use [onPressed] instead')
  final void Function()? onPressedUp;

  /// function when down arrow is pressed
  @Deprecated('Use [onPressed] instead')
  final void Function()? onPressedDown;

  /// function when right arrow is pressed
  @Deprecated('Use [onPressed] instead')
  final void Function()? onPressedRight;

  /// function when left arrow is pressed
  @Deprecated('Use [onPressed] instead')
  final void Function()? onPressedLeft;

  /// function when pressed any button
  final void Function(PressDirection direction)? onPressed;

  /// Called when an arrow is pressed down, with the pressed direction.
  ///
  /// Always fires on touch down, regardless of [clickTrigger]. Every call is
  /// followed by exactly one [onPressEnd] call for the same direction.
  final void Function(PressDirection direction)? onPressStart;

  /// Called when the press that triggered [onPressStart] ends, either because
  /// the finger was lifted or because the gesture was cancelled (for example
  /// when a scrollable took over the pointer).
  final void Function(PressDirection direction)? onPressEnd;

  /// When to trigger the pressed functions using [ClickTrigger]
  ///
  /// Defaults to [ClickTrigger.onTapDown]
  final ClickTrigger? clickTrigger;

  /// Icon style of the arrow pad [ArrowPadIconStyle]
  ///
  /// Defaults to [ArrowPadIconStyle.chevron]
  final ArrowPadIconStyle arrowPadIconStyle;

  /// outer circle color of the arrow pad
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
  State<ArrowPad> createState() => _ArrowPadState();
}

class _ArrowPadState extends State<ArrowPad> {
  /// direction of the press currently held down (if any)
  PressDirection? _held;

  @override
  Widget build(BuildContext context) {
    final icons = widget.arrowPadIconStyle.getIcons();

    var lSplashColor = widget.splashColor;
    if (Theme.of(context).useMaterial3) {
      // use dynamic color from primary when using material 3
      lSplashColor = widget.splashColor ??
          Theme.of(context).colorScheme.primary.withAlpha(80);
    }

    return Padding(
      padding: widget.padding ?? const EdgeInsets.all(8.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double cHeight = constraints.maxHeight;
          double cWidth = constraints.maxWidth;

          if (widget.height != null && widget.height! <= cHeight) {
            cHeight = widget.height!;
          } else if (cHeight == double.infinity) {
            cHeight = 90.0;
          }
          if (widget.width != null && widget.width! <= cWidth) {
            cWidth = widget.width!;
          } else if (cWidth == double.infinity) {
            cWidth = 90.0;
          }

          double padSize = min(cHeight, cWidth);

          return SizedBox(
            height: cHeight,
            width: cWidth,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: widget.outerColor ??
                      Theme.of(context).colorScheme.primary.withAlpha(80),
                  shape: BoxShape.circle,
                ),
                height: padSize,
                width: padSize,
                child: Padding(
                  padding: EdgeInsets.all(padSize * 0.035),
                  child: Center(
                    child: Material(
                      color: Colors.transparent,
                      child: Card(
                        color: widget.innerColor ??
                            Theme.of(context).colorScheme.primaryContainer,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(padSize),
                        ),
                        child: InkWell(
                          splashColor: lSplashColor,
                          hoverColor: widget.hoverColor,
                          borderRadius: BorderRadius.circular(padSize - 10),
                          onTap: () {},
                          onTapDown: (details) {
                            final direction =
                                _directionAt(details.localPosition, padSize);
                            _held = direction;
                            if (direction != null) {
                              widget.onPressStart?.call(direction);
                              if (widget.clickTrigger ==
                                  ClickTrigger.onTapDown) {
                                _fire(direction);
                              }
                            }
                          },
                          onTapUp: (details) {
                            _release();
                            if (widget.clickTrigger == ClickTrigger.onTapUp) {
                              final direction = _directionAt(
                                  details.localPosition, padSize);
                              if (direction != null) _fire(direction);
                            }
                          },
                          onTapCancel: _release,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            child: IconTheme(
                              data: IconThemeData(
                                size: padSize / 5,
                                color: widget.iconColor ??
                                    Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(icons[0]),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(icons[1]),
                                        Icon(icons[2]),
                                      ],
                                    ),
                                  ),
                                  Icon(icons[3]),
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
        },
      ),
    );
  }

  /// ends the held press (if any) and notifies [ArrowPad.onPressEnd].
  void _release() {
    final direction = _held;
    _held = null;
    if (direction != null) widget.onPressEnd?.call(direction);
  }

  /// returns the arrow under [position], or null for the corners / centre.
  PressDirection? _directionAt(Offset position, double padSize) {
    final x = position.dx;
    final y = position.dy;
    final part = (padSize - 20) / 3;
    if (x > part && x < part * 2) {
      if (y < part) return PressDirection.up;
      if (y > part * 2) return PressDirection.down;
    } else if (y > part && y < part * 2) {
      if (x < part) return PressDirection.left;
      if (x > part * 2) return PressDirection.right;
    }
    return null;
  }

  /// notifies [ArrowPad.onPressed] and the deprecated per-direction callbacks.
  void _fire(PressDirection direction) {
    widget.onPressed?.call(direction);
    switch (direction) {
      case PressDirection.up:
        widget.onPressedUp?.call();
      case PressDirection.right:
        widget.onPressedRight?.call();
      case PressDirection.down:
        widget.onPressedDown?.call();
      case PressDirection.left:
        widget.onPressedLeft?.call();
    }
  }
}
