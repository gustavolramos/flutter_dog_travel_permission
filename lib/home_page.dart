import 'package:dog_travel_permission/base_structure.dart';
import 'package:flutter/material.dart';
import 'company_page.dart';

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
                            builder: (BuildContext context) =>
                                const CompanyPage(
                                  companyURL: 'https://www.voeazul.com.br/en/for-your-trip/services/pet-inside-the-cabin',
                                  companyLogo: 'assets/azul_logo.png',
                                  companyName: 'Azul',
                                  companyColor: Colors.blue,
                                )));
                  },
                  icon: Image.asset('assets/azul_logo.png')),
              IconButton(
                  iconSize: 80,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const CompanyPage(
                                  companyURL: 'https://www.voegol.com.br/en/gol-services/travel-with-pets',
                                  companyLogo: 'assets/gol_logo.png',
                                  companyName: 'Gol',
                                  companyColor: Colors.orange,
                                )));
                  },
                  icon: Image.asset('assets/gol_logo.png')),
              IconButton(
                iconSize: 100,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const CompanyPage(
                                companyURL: 'https://www.latamairlines.com/au/en/experience/prepare-your-trip/pets-transportation',
                                companyLogo: 'assets/latam_logo.jpg',
                                companyName: 'Latam',
                                companyColor: Colors.blue,
                              )));
                },
                icon: Image.asset('assets/latam_logo.jpg'),
              )
            ],
          ),
        ),
        SizedBox(
            height: 200,
            width: 200,
            child: Image.asset('assets/green_dog_cartoon.jpg'))
      ],
    ));
  }
}
