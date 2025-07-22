import 'package:flutter/material.dart';
import 'package:fluttercebdivsion/1507flutter/textstyleexmp.dart';

class ContainerExample extends StatelessWidget {
  const ContainerExample({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          color: Colors.amber,
          child: const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Hello Flutter",
              style: CustomTextStyles.style3,
            ),
          ),
        ),
      ),
    );
  }
}
