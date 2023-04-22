import 'package:dog_travel_permission/base_structure.dart';
import 'package:dog_travel_permission/home_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage(
      {Key? key,
        required this.companyURL,
        required this.companyLogo,
        required this.companyName,
        required this.companyColor})
      : super(key: key);

  final String companyURL;
  final String companyLogo;
  final String companyName;
  final Color companyColor;

  @override
  State<CompanyPage> createState() => CompanyPageState();
}

class CompanyPageState extends State<CompanyPage> {

  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _sizeController = TextEditingController();
  String _dogResponse = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void dogPermissionConfirmation(String dogWeight, String dogSize) {
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

  void clearDogResponse() {
    _dogResponse = '';
  }

  Future<void> _launchUrl() async {
    if (await launchUrl(Uri.parse(widget.companyURL))) {
      throw Exception('Could not launch ${widget.companyURL}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseStructure(
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: 150, child: Image.asset(widget.companyLogo)),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 110),
                child: Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: Text('${widget.companyName}\'s policy',
                            style: Theme.of(context).textTheme.bodySmall)),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                          onPressed: () {
                            _launchUrl();
                            },
                          icon: const Icon(Icons.open_in_new, size: 25, color: Colors.blue)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Type the dog\'s weight';
                    }
                    return null;
                    },
                  keyboardType: TextInputType.number,
                  controller: _weightController,
                  decoration: const InputDecoration(
                      labelText: 'Weight',
                      hintText: 'What is your dog\'s weight in kg?',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
            )),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Type the dog\'s weight';
                    }
                    return null;},
                  keyboardType: TextInputType.number,
                  controller: _sizeController,
                  decoration: const InputDecoration(
                      labelText: 'Size',
                      hintText: 'What is your dog\'s size in m²?',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                )),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => const HomePage())),
                        style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                        child: const Text('Go Back')),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: widget.companyColor),
                    onPressed: () {
                      setState(() {
                        clearDogResponse();
                        dogPermissionConfirmation(
                            _weightController.text, _sizeController.text);
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
                Text(_dogResponse,
                    style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}