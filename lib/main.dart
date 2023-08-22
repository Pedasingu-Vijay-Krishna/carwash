
import 'package:carwash/router/RouterConfig.dart';

import 'package:flutter/material.dart';
import 'package:get_secure_storage/get_secure_storage.dart';

import 'package:intl/date_symbol_data_local.dart';
Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await GetSecureStorage.init(password: 'strongpassword');

  initializeDateFormatting().then((value) =>runApp(const MyApp()) );




}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      title: 'Car Wash',
      routerConfig: router,
      theme: ThemeData(useMaterial3: true, textTheme: TextTheme(),colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo)),
    //  home: LoginPage()
    );
  }
}


