import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'randomly_colored_box.dart';

void main() {
  runApp(ProviderScope(
    child: MaterialApp(
      home: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(
            builder: (context, ref, child) {
              return Center(
                child: RandomlyColoredBox(
                  color: ref.watch(randomColorProvider),
                  onUpdate: () {
                    ref.read(randomColorProvider.notifier).update();
                  },
                ),
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              return Center(
                child: RandomlyColoredBox(
                  color: ref.watch(randomColorProvider2),
                  onUpdate: () {
                    ref.read(randomColorProvider2.notifier).update();
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 32),
        ],
      ),
    ),
  ));
}

final randomColorProvider = StateNotifierProvider<RandomColor, Color>((ref) {
  return RandomColor(Colors.black);
});
final randomColorProvider2 = StateNotifierProvider<RandomColor, Color>((ref) {
  return RandomColor(Colors.black);
});

class RandomColor extends StateNotifier<Color> {
  RandomColor(Color color) : super(color);

  void update() {
    state = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }
}
