import 'package:flutter/material.dart';

import 'airline_pages/azul.dart';
import 'airline_pages/gol.dart';
import 'airline_pages/latam.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.check_box),
        title: const Text('Dog Permission'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Padding(
              padding: const EdgeInsets.all(40.0),
              child: Text(
                'Choose a company ',
              style: Theme.of(context).textTheme.headlineSmall),
           ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      iconSize: 100,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                      const AzulPage()));
                      },
                      icon: Image.asset('assets/azul_logo.png')),
                  IconButton(
                      iconSize: 80,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const GolPage()));
                      },
                      icon: Image.asset('assets/gol_logo.png')),
                  IconButton(
                    iconSize: 100,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const LatamPage()));
                    },
                    icon: Image.asset('assets/latam_logo.png'),
                  )
                ],
              ),
            )
            ],
        ),
      ),
    );
  }
}