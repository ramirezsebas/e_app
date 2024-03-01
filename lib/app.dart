import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('E App'),
        ),
        body: const Center(
          child: Text('Hola E App'),
        ),
      ),
    );
  }
}
