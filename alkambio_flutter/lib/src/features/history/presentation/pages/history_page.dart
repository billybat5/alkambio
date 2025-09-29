
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../injection_container.dart';
import '../bloc/history_bloc.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: BlocProvider(
        create: (_) => sl<HistoryBloc>()..add(LoadHistory()),
        child: BlocBuilder<HistoryBloc, HistoryState>(
          builder: (context, state) {
            if (state is HistoryLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HistoryLoaded) {
              if (state.history.isEmpty) {
                return const Center(child: Text('No history yet.'));
              }
              return ListView.builder(
                itemCount: state.history.length,
                itemBuilder: (context, index) {
                  final item = state.history[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${item.inputAmount.toStringAsFixed(2)} ${item.baseCurrencyCode}',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 8),
                          ...item.convertedValues.entries.map((entry) => Text(
                                '${entry.value.toStringAsFixed(2)} ${entry.key}',
                              )),
                          const SizedBox(height: 8),
                          Text(
                            DateFormat('yyyy-MM-dd HH:mm').format(item.timestamp),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is HistoryError) {
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
