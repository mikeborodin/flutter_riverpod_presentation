import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod_presentation/randomly_colored_box.dart';
import 'package:provider/provider.dart';

class RandomColor extends ChangeNotifier {
  Color color;

  RandomColor(this.color);

  void update() {
    color = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    notifyListeners();
  }
}

void main() {
  runApp(MaterialApp(
    home: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ChangeNotifierProvider(
            create: (context) => RandomColor(Colors.black),
            child: Builder(builder: (context) {
              return Center(
                child: RandomlyColoredBox(
                  color: context.watch<RandomColor>().color,
                  onUpdate: () {
                    context.read<RandomColor>().update();
                  },
                ),
              );
            })),
        const SizedBox(height: 32),
        ChangeNotifierProvider(
          create: (context) => RandomColor(Colors.black),
          child: Builder(builder: (context) {
            return Center(
              child: RandomlyColoredBox(
                color: context.watch<RandomColor>().color,
                onUpdate: () {
                  context.read<RandomColor>().update();
                },
              ),
            );
          }),
        ),
      ],
    ),
  ));
}
