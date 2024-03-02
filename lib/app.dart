import 'package:e_app/app/core/helpers/app_bar_factory.dart';
import 'package:e_app/app/core/widgets/e_drawer.dart';
import 'package:e_app/app/data/repositories/account_repository.dart';
import 'package:e_app/app/data/repositories/expense_repository.dart';
import 'package:e_app/app/data/repositories/movements_repository.dart';
import 'package:e_app/app/presentation/cubits/account_balance/account_balance_cubit.dart';
import 'package:e_app/app/presentation/cubits/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:e_app/app/presentation/cubits/month_selector/month_selector_cubit.dart';
import 'package:e_app/app/presentation/cubits/movements/movements_cubit.dart';
import 'package:e_app/app/presentation/screens/screens.dart';
import 'package:e_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

final GlobalKey<ScaffoldState> globalScaffoldKey = GlobalKey<ScaffoldState>();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ExpenseRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AccountBalanceCubit(
              accountRepository: AccountRepository(),
            )..getAccount(),
          ),
          BlocProvider(
            create: (context) => BottomNavigationCubit(),
          ),
          BlocProvider(
            create: (context) => MovementsCubit(
              movementsRepository: MovementsRepository(),
            )..getMovements(),
          ),
          BlocProvider(
            create: (_) => MonthSelectorCubit()..init(2000000),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: _buildTheme(Brightness.light),
          title: 'E App',
          home: const MainScreen(),
        ),
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

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex =
        context.select((BottomNavigationCubit cubit) => cubit.state.index);

    return Scaffold(
      key: globalScaffoldKey,
      endDrawer: EDrawer(
        onDrawerTap: (index) {
          context.read<BottomNavigationCubit>().updateIndex(index);
        },
      ),
      backgroundColor: const Color(0xffF7F0ED),
      appBar: AppBarFactory.create(
        context,
        currentIndex,
        onDrawerTap: () => globalScaffoldKey.currentState!.openEndDrawer(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xffF7F0ED),
        currentIndex: currentIndex,
        onTap: (index) {
          context.read<BottomNavigationCubit>().updateIndex(index);
        },
        selectedItemColor: const Color(0xff888787),
        unselectedItemColor: const Color(0xffCACACA),
        elevation: 100,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Assets.icons.home.image(
              color: currentIndex == 0
                  ? const Color(0xff888787)
                  : const Color(0xffCACACA),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Assets.icons.transfers.image(
              color: currentIndex == 1
                  ? const Color(0xff888787)
                  : const Color(0xffCACACA),
            ),
            label: 'Transferencias',
          ),
          BottomNavigationBarItem(
            icon: Assets.icons.analisis.image(
              color: currentIndex == 2
                  ? const Color(0xff888787)
                  : const Color(0xffCACACA),
            ),
            label: 'Analisis',
          ),
          BottomNavigationBarItem(
            icon: Assets.icons.account.image(
              color: currentIndex == 3
                  ? const Color(0xff888787)
                  : const Color(0xffCACACA),
            ),
            label: 'Cuentas',
          ),
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
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
