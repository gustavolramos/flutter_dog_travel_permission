import 'package:flutter/material.dart';

class BaseStructure extends StatelessWidget {
   const BaseStructure({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Dog Permission', style: TextStyle(fontSize: 20)),
        leading: const Icon(Icons.local_police_rounded),
        backgroundColor: Colors.green,
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