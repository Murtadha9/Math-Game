import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NumberPad extends StatelessWidget {
  final String child;
  var color = Color.fromARGB(168, 38, 128, 202);
  final VoidCallback onTap;

  NumberPad({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    if (child == 'C') {
      color = Colors.green;
    } else if (child == 'DEL') {
      color = Colors.red;
    } else if (child == '=') {
      color = Colors.deepPurple;
    }

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(child,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
