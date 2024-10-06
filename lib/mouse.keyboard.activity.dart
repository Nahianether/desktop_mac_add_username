import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ActivityDetectionPage extends StatefulWidget {
  const ActivityDetectionPage({super.key});

  @override
  ActivityDetectionPageState createState() => ActivityDetectionPageState();
}

class ActivityDetectionPageState extends State<ActivityDetectionPage> {
  String _mouseActivity = "No mouse activity";
  String _keyActivity = "No key activity";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mouse and Keyboard Activity Detection'),
      ),
      body: Center(
        child: RawKeyboardListener(
          focusNode: FocusNode(),
          autofocus: true,
          onKey: (RawKeyEvent event) {
            setState(() {
              if (event is RawKeyDownEvent) {
                _keyActivity = "Key Pressed: ${event.logicalKey.debugName}";
              }
            });
          },
          child: Listener(
            onPointerHover: (PointerHoverEvent event) {
              setState(() {
                _mouseActivity = "Mouse moved to: (${event.position.dx}, ${event.position.dy})";
              });
            },
            onPointerDown: (PointerDownEvent event) {
              setState(() {
                _mouseActivity = "Mouse clicked at: (${event.position.dx}, ${event.position.dy})";
              });
            },
            child: Container(
              width: 400,
              height: 400,
              color: Colors.blue.shade50,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_mouseActivity),
                  const SizedBox(height: 20),
                  Text(_keyActivity),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
