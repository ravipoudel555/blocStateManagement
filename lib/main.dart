import 'package:bloc_flutter/logic/cubit/internet_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_flutter/logic/cubit/counter_cubit.dart';
import 'package:bloc_flutter/presentation/router/app_router.dart';

void main() {
  runApp(MyApp(
    connectivity: Connectivity(),
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final Connectivity connectivity;
  final AppRouter appRouter;

  const MyApp({
    Key? key,
    required this.connectivity,
    required this.appRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        )
      ],
      child: MaterialApp(
        title: 'Bloc Practice',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
