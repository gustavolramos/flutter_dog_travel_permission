import 'package:flutter/material.dart';

class AzulPage extends StatelessWidget {
  const AzulPage
({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.check_box),
        title: Text('Dog Permission'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset('assets/azul_logo.png'),
                Text('Fill the Information Below'),
              ],
            ),
            Row(
              children: [
                TextField(),
                TextField(),
                ElevatedButton(onPressed: (){}, child: Text('xxx'))
              ],
            )
          ],
        ),
      ),
    );
  }
}