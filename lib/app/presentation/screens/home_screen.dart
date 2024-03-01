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
                          leading: Image.asset(movement.image),
                          title: Text(
                            movement.sender,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(movement.description),
                          trailing: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '${movement.currency}. ${movement.amount}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(movement.date),
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
