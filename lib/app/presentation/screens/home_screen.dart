// ignore_for_file: lines_longer_than_80_chars

import 'package:e_app/app/core/extensions/date_extension.dart';
import 'package:e_app/app/core/extensions/formatter_extension.dart';
import 'package:e_app/app/presentation/cubits/movements/movements_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovementsCubit, MovementsState>(
      builder: (context, state) {
        return switch (state.runtimeType) {
          MovementsInitial => const Center(
              child: CircularProgressIndicator(),
            ),
          MovementsLoading => const Center(
              child: CircularProgressIndicator(),
            ),
          MovementsLoaded => Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 45,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Movimientos',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: (state as MovementsLoaded).movements.length,
                      itemBuilder: (context, index) {
                        final movement = state.movements[index];
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              movement.image,
                            ),
                          ),
                          title: Text(
                            movement.sender,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            movement.description,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          trailing: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '${movement.sign}${movement.amount.toGs(
                                  location: CurrencyLocation.end,
                                )}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                movement.date.toFormattedString(),
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          MovementsError => Center(
              child: Text((state as MovementsError).error),
            ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }
}
