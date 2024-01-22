# on_off_switch

A Flutter package that provides an interactive on/off switch widget.

![on_off_switch Demo](https://media.giphy.com/media/euHIKzZ9mntFWJ7XYv/giphy.gif)
## Installation

Add the following line to your `pubspec.yaml` file:

```yaml
dependencies:
  on_off_switch: ^0.0.1
```

Then, run:

`$ flutter pub get
`

## **Usage**

Import the package in your Dart code:

`import 'package:on_off_switch/on_off_switch.dart';
`

Use the OnOffSwitch widget in your Flutter app:

```
OnOffSwitch(
  value: true, // or false
  onChanged: (bool newValue) {
    // Handle the switch state change
    print('Switch value changed: $newValue');
  },
)
```

## Example

Check out the example folder for a simple usage example.

API Reference
OnOffSwitch
Properties
- value (bool): The current state of the switch.
- onChanged (Function(bool)): Callback function called when the switch state changes.

```agsl
OnOffSwitch(
  value: true,
  onChanged: (bool newValue) {
    print('Switch value changed: $newValue');
  },
)

```

## License

This package is open-source and available under the MIT License.