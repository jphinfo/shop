import 'package:flutter/material.dart';
import 'package:shop/providers/counter.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    final provider = CounterProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Exemplo Contador'),
      ),
      body: Column(children: [
        Text(provider?.state.value.toString() ?? '0'),
        IconButton(
          onPressed: () {
            setState(() {
              provider?.state.increment();
            });
          },
          icon: const Icon(Icons.add),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              provider?.state.decrement();
            });
          },
          icon: const Icon(Icons.remove),
        )
      ]),
    );
  }
}
