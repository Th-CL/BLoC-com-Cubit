import 'package:bilheteria_panucci/logic/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bilheteria_panucci/screens/home.dart';
import 'package:bilheteria_panucci/logic/cubit/home_cubit.dart';

void main() {
  runApp(const BilheteriaPanucci());
}

class BilheteriaPanucci extends StatelessWidget {
  const BilheteriaPanucci({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            title: 'Bilheteria Panucci',
            theme: theme,
            home: BlocProvider(
              create: (context) => HomeCubit(),
              child: const Home(),
            ),
          );
        },
      ),
    );
  }
}
