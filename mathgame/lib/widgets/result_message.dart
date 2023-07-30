import 'package:flutter/material.dart';

class ResultMessage extends StatelessWidget {
  final String text;
  final VoidCallback ontap;
  final icon;
  const ResultMessage(
      {super.key, required this.text, required this.ontap, this.icon});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple,
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(text),
            InkWell(
              onTap: ontap,
              child: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: Colors.deepPurple[300],
                    borderRadius: BorderRadius.circular(8)),
                child: Icon(icon),
              ),
            )
          ],
        ),
      ),
    );
  }
}
