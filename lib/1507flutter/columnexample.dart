import 'package:flutter/material.dart';

class ColumnExample extends StatelessWidget {
  const ColumnExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.amber,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Text1"),
            SizedBox(
              height: 20,
            ),
            Text("Text1"),
            SizedBox(
              height: 20,
            ),
            Text("Text1"),
          ],
        ));
  }
}
