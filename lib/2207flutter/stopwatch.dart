import 'dart:async';
import 'package:flutter/material.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({super.key});

  @override
  State<Stopwatch> createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {
  int seconds = 0;
  late Timer timer;
  bool isTicking = false;
  String _secondsTotext() => seconds <= 1 ? "Second" : "Seconds";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stopwatch"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "$seconds ${_secondsTotext()}",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 10,
          ),
          controlpanel(),
          controlpanel1(),
        ],
      )),
    );
  }

  Row controlpanel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: isTicking ? null : _startTimer,
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(Colors.green),
            foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
          ),
          child: const Icon(Icons.start),
        ),
        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
          onPressed: isTicking ? _stopTimer : null,
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
            foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
          ),
          child: const Icon(Icons.stop),
        ),
        const SizedBox(
          width: 10,
        ),
        const ElevatedButton(
          onPressed: null,
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
            foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
          ),
          child: Icon(Icons.timer),
        ),
      ],
    );
  }

  Row controlpanel1() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: null,
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(Colors.amber),
            foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
          ),
          child: Icon(Icons.pause),
        ),
        SizedBox(
          width: 10,
        ),
        ElevatedButton(
          onPressed: null,
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(Colors.pink),
            foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
          ),
          child: Icon(Icons.clear_outlined),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void _startTimer() {
    timer = Timer.periodic(
        const Duration(
          seconds: 1,
        ),
        _onTick);
    setState(() {
      isTicking = true;
      seconds = 0;
    });
  }

  void _stopTimer() {
    timer.cancel();
    setState(() {
      isTicking = false;
    });
  }

  void _onTick(Timer timer) {
    setState(() {
      seconds++;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
