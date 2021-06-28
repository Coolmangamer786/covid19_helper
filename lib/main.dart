import 'package:covid19_helper/pages/firstpage.dart';
import 'package:covid19_helper/state_changer.dart';
import 'package:covid19_helper/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  StateNotifier.init();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
          return MaterialApp(
            title: "Flutter Provider",
            theme: notifier.darkTheme ? light : dark,
            home: FirstPage(),
          );
        },
      ),
    );
  }
}
