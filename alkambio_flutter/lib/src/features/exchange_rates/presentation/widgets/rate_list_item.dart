
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../calculator/presentation/bloc/calculator_bloc.dart';
import '../../domain/entities/conversion_rate.dart';

class RateListItem extends StatelessWidget {
  final ConversionRate rate;

  const RateListItem({super.key, required this.rate});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: BlocBuilder<CalculatorBloc, CalculatorState>(
        builder: (context, state) {
          String calculatedValue = '...';
          if (state is CalculatorResult) {
            final value = state.convertedValues[rate.rateCurrency.code];
            if (value != null) {
              calculatedValue = value.toStringAsFixed(2);
            }
          }

          return ListTile(
            leading: CircleAvatar(
              child: Text(rate.rateCurrency.symbol),
            ),
            title: Text(rate.rateCurrency.name),
            subtitle: Text('1 USD = ${rate.baseValue} VES'), // Example subtitle
            trailing: Text(
              calculatedValue,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          );
        },
      ),
    );
  }
}
