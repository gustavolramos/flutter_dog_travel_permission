import 'package:flutter/material.dart';

class BaseStructure extends StatelessWidget {
   const BaseStructure({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.check_box),
        title: const Text('Dog Permission'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: child
          ),
        ],
      ),
    );
  }
}