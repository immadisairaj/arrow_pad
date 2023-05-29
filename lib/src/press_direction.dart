/// direction of where the button is pressed
enum PressDirection {
  /// when pressed up
  up,

  /// when pressed right
  right,

  /// when pressed down
  down,

  /// when pressed left
  left;

  @override
  String toString() => switch (this) {
        PressDirection.up => 'up',
        PressDirection.right => 'right',
        PressDirection.down => 'down',
        PressDirection.left => 'left',
      };
}
