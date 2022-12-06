import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(
      const ProviderScope(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: MyCheckBox(),
        ),
      ),
    );

final checkBoxState = StateProvider((ref) => false);

class MyCheckBox extends ConsumerWidget {
  const MyCheckBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isChecked = ref.watch(checkBoxState);

    final icon = isChecked ? Icons.check_box_outlined : Icons.check_box_outline_blank;
    return GestureDetector(
      onTap: () {
        ref.read(checkBoxState.notifier).state = !ref.read(checkBoxState);
      },
      child: Icon(
        icon,
        size: 128,
      ),
    );
  }
}
