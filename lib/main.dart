import 'package:covid19_helper/ads/adstate.dart';
import 'package:covid19_helper/pages/firstpage.dart';
import 'package:covid19_helper/state_changer.dart';
import 'package:covid19_helper/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final initFuture = MobileAds.instance.initialize();
  final adState = AdState(initFuture);
  runApp(Provider.value(value: adState,builder: (context,child)=>MyApp()));
  StateNotifier.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Covid19 Helper",
            theme: notifier.darkTheme ? light : dark,
            home: FirstPage(),
          );
        },
      ),
    );
  }
}
