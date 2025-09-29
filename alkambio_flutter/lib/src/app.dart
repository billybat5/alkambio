
import 'package:flutter/material.dart';

import 'features/exchange_rates/presentation/pages/exchange_rate_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlKambio Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ExchangeRatePage(),
    );
  }
}

