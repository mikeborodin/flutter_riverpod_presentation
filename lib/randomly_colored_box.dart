import 'package:flutter/material.dart';

class RandomlyColoredBox extends StatelessWidget {
  final void Function() onUpdate;
  final Color color;

  const RandomlyColoredBox({
    super.key,
    required this.color,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Builder(builder: (context) {
          return ColoredBox(
            color: color,
            child: const SizedBox(
              width: 300,
              height: 300,
            ),
          );
        }),
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: onUpdate,
          child: const Text('Open the Black Box'),
        )
      ],
    );
  }
}
