# dog_travel_permission

My girlfriend had a tough time researching if our dogs would be able fly on popular airplane companies in Brazil, so I made an app to help with that.

In this project I try to exercise some basic but important Dart and Flutter concepts such as:

- Opening external URLs with the url_launcher package
- Utilizing try & catch
- Utilizing the "setstate" method
- Working with controllers
- Adding new parameters to a Widget's constructor to make it more reusable

## What you need to run this project

- Android Studio or other IDE: http://bit.ly/3IWeWfC
- Flutter SDK: https://docs.flutter.dev/get-started/install
- Flutter and Dart Plugins for the IDE
- Add the assets with whichever company logo you want to use to your pubspec.yaml
- To open external URLs use: https://pub.dev/packages/url_launcher

### Pet Policies

These are the policies I used for the project:

- Azul: https://www.voeazul.com.br/en/for-your-trip/services/pet-inside-the-cabin
- Gol: https://www.voegol.com.br/en/gol-services/travel-with-pets
- Latam: https://www.latamairlines.com/au/en/experience/prepare-your-trip/pets-transportation

### Possible Improvements

- There is a lot of room simplify each airline company page so that the code doesn't need to be written 3 times
- The IconButtons in the HomePage could be standarized in another widget and then just receive a few parameters through the constructor to make the HomePage clearer.