
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../../about/presentation/pages/about_page.dart';
import '../../../calculator/presentation/bloc/calculator_bloc.dart';

import '../bloc/exchange_rate_bloc.dart';
import '../widgets/rate_list_item.dart';

import '../../../logs/presentation/pages/log_screen.dart';

class ExchangeRatePage extends StatelessWidget {
  const ExchangeRatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AlKambio'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.bug_report),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LogScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutPage()),
              );
            },
          ),
        ],
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => sl<ExchangeRateBloc>()),
          BlocProvider(create: (_) => sl<CalculatorBloc>()),
        ],
        child: BlocBuilder<ExchangeRateBloc, ExchangeRateState>(
          builder: (context, state) {
            if (state is ExchangeRateInitial) {
              BlocProvider.of<ExchangeRateBloc>(context)
                  .add(const GetRatesForCountry('VE'));
              return const Center(child: CircularProgressIndicator());
            } else if (state is ExchangeRateLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ExchangeRateLoaded) {
              final rates = state.conversion.conversionRates;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Amount to Convert',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        BlocProvider.of<CalculatorBloc>(context)
                            .add(AmountChanged(amount: value, rates: rates));
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: rates.length,
                      itemBuilder: (context, index) {
                        return RateListItem(rate: rates[index]);
                      },
                    ),
                  ),
                ],
              );
            } else if (state is ExchangeRateError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('Something went wrong!'));
            }
          },
        ),
      ),
    );
  }
}
