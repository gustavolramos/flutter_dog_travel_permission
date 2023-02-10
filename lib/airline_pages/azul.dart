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
  late bool dogPermission;
  late String dogResponse;

  void dogPermissionConfirmation(String weight, String size) {
    double weight = double.parse(_weightController.text);
    double size = double.parse(_sizeController.text);
    weight < 10 && size < 30 ? dogPermission = true : false;
    dogPermission == false ? dogResponse = 'Your dog can\'t fly' : 'Your dog will fly!';
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.check_box),
        title: const Text('Dog Permission'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: Expanded(
          child: ListView(
            children: [
              SizedBox(
                  height: 150,
                  child: Image.asset('assets/azul_logo.png')),
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
                          dogPermissionConfirmation(_weightController.text, _sizeController.text);
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        child: const Text('Find out!')),
                  ],
                ),
              ),
            ],
            ),
          ),
        ),
    );
  }
}