import 'package:flutter/material.dart';

class CalculatorLayout extends StatelessWidget {
  const CalculatorLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Calculator text",
            style: TextStyle(
              color: Colors.black,
              fontSize: 50,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          customRow1(),
          customRow1(),
          customRow1(),
          customRow1(),
          customRow1(),
          customRow1(),
        ],
      ),
    );
  }

  Row customRow1() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(onPressed: null, child: Text("M+")),
        SizedBox(width: 5),
        ElevatedButton(onPressed: null, child: Text("M+")),
        SizedBox(width: 5),
        ElevatedButton(onPressed: null, child: Text("M+")),
        SizedBox(width: 5),
        ElevatedButton(onPressed: null, child: Text("M+")),
        SizedBox(width: 5),
        ElevatedButton(onPressed: null, child: Text("M+")),
        SizedBox(width: 5),
        ElevatedButton(onPressed: null, child: Text("M+")),
      ],
    );
  }
}
