import 'dart:async';
import 'package:flutter/material.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({super.key});

  @override
  State<Stopwatch> createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {
  double seconds = 0;
  late Timer timer;
  bool isTicking = false;
  int millis = 0;
  final laps = <int>[];

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
          Expanded(
            child: Text(
              "$seconds ${_secondsTotext()}",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(child: controlpanel()),
          Expanded(child: builderDisplay()),
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
        ElevatedButton(
          onPressed: _ontapLap,
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
            foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
          ),
          child: const Icon(Icons.timer),
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
          milliseconds: 100,
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

  void _ontapLap() {
    setState(() {
      laps.add(millis);
      millis = 0;
      seconds = 0;
    });
    print(laps);
  }

  Widget buildDisplay() {
    return ListView(
      children: [
        for (int i in laps)
          ListTile(
            leading: const Icon(Icons.star),
            title: Text("Lap  : ${i / 1000} seconds"),
            trailing: const Icon(Icons.delete),
          )
      ],
    );
  }

  Widget builderDisplay() {
    return ListView.builder(
      itemCount: laps.length,
      itemBuilder: (context, index) {
        final milis = laps[index];
        return ListTile(
          leading: const Icon(Icons.star),
          title: Text("Lap  : ${milis / 1000} seconds"),
          trailing: const Icon(Icons.cancel),
        );
      },
    );
  }

  void _onTick(Timer timer) {
    setState(() {
      millis += 100;
      seconds = millis / 1000;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
