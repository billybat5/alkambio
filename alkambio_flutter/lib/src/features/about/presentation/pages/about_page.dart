
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String _version = '...';

  @override
  void initState() {
    super.initState();
    _loadVersion();
  }

  Future<void> _loadVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _version = packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('AlKambio', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 16),
            Text('Developed by: billy', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text('Version: $_version', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 32),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'This is free and open source software, committed to user privacy and transparency.',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
