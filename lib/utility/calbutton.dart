import 'package:calcullator/data/buttontext.dart';
import 'package:calcullator/provider/toglebuttonprovvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Calbutton extends ConsumerStatefulWidget {
  const Calbutton({super.key, required this.value});

  final String value;

  @override
  ConsumerState<Calbutton> createState() => _CalbuttonState();
}

class _CalbuttonState extends ConsumerState<Calbutton> {
  @override
  Widget build(BuildContext context) {
    final displaysized = MediaQuery.sizeOf(context);

    return Padding(
      padding: const EdgeInsets.all(5),
      child: Material(
        color: [btn.delete, btn.clr].contains(widget.value)
            ? const Color.fromARGB(255, 146, 142, 129)
            : btn.equal.contains(widget.value)
                ? const Color.fromARGB(255, 255, 255, 255)
                : [btn.per, btn.multiply, btn.plus, btn.minus, btn.devide].contains(widget.value)
                    ? const Color.fromARGB(255, 255, 81, 0)
                    : const Color.fromARGB(66, 32, 32, 32),
        shape: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white24),
            borderRadius: BorderRadius.circular(100)),
        child: InkWell(
          onTap: () {
            print("inkwell taped");
            ref.read(toggleButtonProvider.notifier).toggleButtonClick(widget.value);
            // This should print in debug mode
          },
          borderRadius: BorderRadius.circular(100),
          child: SizedBox(
            height: displaysized.height / 10,
            width: btn.n0.contains(widget.value) ? displaysized.width / 2.4 : displaysized.width / 5,
            child: Center(
              child: Text(
                widget.value,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: btn.equal.contains(widget.value) ? Colors.black : Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
