import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text(
          'About Us',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green[900],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: AboutUsBody(),
    );
  }
}

class AboutUsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20.0,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              'assets/salute.png', // Replace this with your image path
              height: 150.0,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            'Welcome to the Army Training Center App',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            'Our app provides a comprehensive platform for various army trainings, including physical fitness, tactical skills, leadership development, and more. Whether you are a new recruit or an experienced soldier, our goal is to equip you with the knowledge and skills necessary to excel in your military career.',
            style: TextStyle(
              fontSize: 16.0,
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.green[900],
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundedButton(
                  icon: Icons.web_asset,
                  onPressed: () {
                    launchURL('https://www.armytrainingcenter.com');
                  },
                  label: 'Website',
                ),
                VerticalDivider(
                  color: Colors.grey[400],
                  thickness: 1.0,
                ),
                RoundedButton(
                  icon: Icons.phone,
                  onPressed: () {
                    launchURL('tel:+1234567890');
                  },
                  label: 'Call',
                ),
                VerticalDivider(
                  color: Colors.grey[400],
                  thickness: 1.0,
                ),
                RoundedButton(
                  icon: Icons.email,
                  onPressed: () {
                    launchURL('mailto:info@example.com');
                  },
                  label: 'Email',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class RoundedButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final String label;

  const RoundedButton({
    required this.icon,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed as void Function()?,
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
