import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../base_structure.dart';
import '../home_page.dart';

class LatamPage extends StatefulWidget {
  const LatamPage
({super.key});

  @override
  State<LatamPage> createState() => _LatamPageState();
}

class _LatamPageState extends State<LatamPage> {

  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _sizeController = TextEditingController();
  final Uri _url = Uri.parse('https://www.latamairlines.com/au/en/experience/prepare-your-trip/pets-transportation');
  String _dogResponse = '';

  void dogPermissionConfirmation(String weight, String size) {
    try {
      final double weight = double.parse(_weightController.text);
      final double size = double.parse(_sizeController.text);
      if (weight < 10 && size < 30) {
        setState(() {
          _dogResponse = 'Your dog will fly!';
        });
      } else {
        setState(() {
          _dogResponse = 'Your dog cannot fly';
        });
      }
    } catch (e) {
      setState(() {
        _dogResponse = 'Invalid input, please enter a number';
      });
    }
  }

  void clearDogResponse(){
    _dogResponse = '';
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseStructure(
        child: ListView(
          children: [
            SizedBox(
                height: 150,
                child: Image.asset('assets/latam_logo.jpg')),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 70),
              child: Row(children: [
                Expanded(flex: 3, child: Text('Check Latam\'s policy', style: Theme.of(context).textTheme.bodySmall)),
                Expanded(flex: 1, child: IconButton(onPressed: (){
                  _launchUrl();
                },
                    icon: const Icon(Icons.open_in_new, size: 25, color: Colors.blue)),
                )
              ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _weightController,
                decoration: const InputDecoration(hintText: 'What is your dog\'s weight in kg?'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _sizeController,
                decoration: const InputDecoration(hintText: 'What is your dog\'s size in m²?'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const HomePage())),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent),
                      child: const Text('Go Back')),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          clearDogResponse();
                          dogPermissionConfirmation(_weightController.text, _sizeController.text);
                          FocusManager.instance.primaryFocus?.unfocus();
                        });
                      },
                      child: const Text('Find out!')),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_dogResponse, style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
          ],
        ));
  }
}