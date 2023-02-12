import 'package:dog_travel_permission/base_structure.dart';
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
    return BaseStructure(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Choose a company ',
                      style: Theme.of(context).textTheme.headlineSmall),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      iconSize: 100,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => const AzulPage()));
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
                              builder: (BuildContext context) => const LatamPage()));
                      },
                    icon: Image.asset('assets/latam_logo.jpg'),
                  )
                ],
              ),
            ),
            Container(
                height: 200,
                width: 200,
                child: Image.asset('assets/green_dog_cartoon.jpg'))
          ],
        )
    );
  }
}