import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Whatsapp extends StatefulWidget {
  const Whatsapp({Key? key}) : super(key: key);

  @override
  State<Whatsapp> createState() => _WhatsappState();
}

class _WhatsappState extends State<Whatsapp> {
  void _launchWhatsApp() async {
    // The phone number you want to open in WhatsApp
    String phoneNumber =  "+969-834-0649";

    // Use the 'https://wa.me' URL with the phone number
    String url = 'https://wa.me/$phoneNumber';

    // Check if the WhatsApp app is installed
    if (await canLaunch(url)) {
      // Open WhatsApp with the specified phone number
      await launch(url);
    } else {
      // Handle the case where WhatsApp is not installed
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('WhatsApp is not installed on your device.'),
            actions: <Widget>[
              TextButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _launchWhatsApp,
      child: Text('Open WhatsApp'),
    );
  }
}
