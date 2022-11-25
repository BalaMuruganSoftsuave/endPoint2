import 'package:endpoint2/BlocHelper/charter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'helper/app_color.dart';
import 'helper/nav_helper.dart';
import 'helper/nav_observer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CharterCubit>(
            create: (context) => CharterCubit(CharterState())),
      ],
      child: MaterialApp(
        title: 'EndPoint',
        navigatorObservers: [NavObserver.instance],
        navigatorKey: NavObserver.navKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: AppColor.appBlack,
        ),
        darkTheme: ThemeData.dark(),
        initialRoute: initialRoute,
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
