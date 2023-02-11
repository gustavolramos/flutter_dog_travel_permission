import 'package:dog_travel_permission/base_structure.dart';
import 'package:dog_travel_permission/home_page.dart';
import 'package:flutter/material.dart';

class AzulPage extends StatefulWidget {
  const AzulPage({super.key});

  @override
  State<AzulPage> createState() => _AzulPageState();
}

class _AzulPageState extends State<AzulPage> {
  late final TextEditingController _weightController = TextEditingController();
  late final TextEditingController _sizeController = TextEditingController();
  bool dogPermission = false;
  String dogResponse = '';

  void dogPermissionConfirmation(String weight, String size) {
    double weight = double.parse(_weightController.text);
    double size = double.parse(_sizeController.text);
    weight < 10 && size < 30 ? dogPermission = true : false;
    dogPermission == false ? dogResponse = 'Your dog can\'t fly' : 'Your dog will fly!';
  }

  @override
  Widget build(BuildContext context) {
    return BaseStructure(
        child: ListView(
          children: [
            SizedBox(height: 150, child: Image.asset('assets/azul_logo.png')),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _weightController,
                decoration: const InputDecoration(hintText: 'What is your dog\'s weight in kg?'),
          ),
        ),
            Row(
              children: [
                Text('Check the policy for this company here', style: Theme.of(context).textTheme.bodySmall),
                IconButton(onPressed: (){},
                    icon: Icon(Icons.open_in_new, size: 40, color: Colors.blue))
              ],
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
                          dogPermissionConfirmation(_weightController.text, _sizeController.text);
                          print(dogResponse);
                          FocusManager.instance.primaryFocus?.unfocus();
                        });
                        },
                      child: const Text('Find out!')),
            ],
          ),
        ),
      ],
    ));
  }
}