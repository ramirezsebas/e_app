import 'package:e_app/app/core/widgets/e_app_bar.dart';
import 'package:e_app/app/data/repositories/account_repository.dart';
import 'package:e_app/app/data/repositories/movements_repository.dart';
import 'package:e_app/app/presentation/cubits/account_balance/account_balance_cubit.dart';
import 'package:e_app/app/presentation/cubits/movements/movements_cubit.dart';
import 'package:e_app/app/presentation/screens/screens.dart';
import 'package:e_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AccountBalanceCubit(
            accountRepository: AccountRepository(),
          )..getAccount(),
        ),
        BlocProvider(
          create: (context) => MovementsCubit(
            movementsRepository: MovementsRepository(),
          )..getMovements(),
        ),
      ],
      child: MaterialApp(
        theme: _buildTheme(Brightness.light),
        title: 'E App',
        home: const MainScreen(),
      ),
    );
  }

  ThemeData _buildTheme(Brightness brightness) {
    final baseTheme = ThemeData(brightness: brightness);

    return baseTheme.copyWith(
      textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xffF7F0ED),
        currentIndex: _selectedScreenIndex,
        onTap: (index) {
          setState(() {
            _selectedScreenIndex = index;
          });
        },
        elevation: 100,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Assets.icons.home.image(),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Assets.icons.transfers.image(),
            label: 'Transferencias',
          ),
          BottomNavigationBarItem(
            icon: Assets.icons.analisis.image(),
            label: 'Analisis',
          ),
          BottomNavigationBarItem(
            icon: Assets.icons.account.image(),
            label: 'Cuentas',
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedScreenIndex,
        children: const [
          HomeScreen(),
          TransfersScreen(),
          AnalisisScreen(),
          AccountScreen(),
        ],
      ),
    );
  }
}

class AccountBalance extends StatelessWidget {
  const AccountBalance({
    required this.balance,
    required this.isHidden,
    required this.currency,
    super.key,
    this.onToggle,
  });

  final String currency;
  final num balance;
  final bool isHidden;
  final void Function()? onToggle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Disponible',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$currency ${_formatHiddenBalance()}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: onToggle,
              icon: isHidden
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
              color: Colors.white,
            ),
          ],
        ),
      ],
    );
  }

  String _formatHiddenBalance() {
    final balanceString = balance.toString();
    return isHidden
        ? balanceString
            .replaceAll(
              RegExp(r'\d'),
              '*',
            )
            .replaceAll('.', '*')
        : balanceString.substring(0, balanceString.indexOf('.'));
  }
}
