import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketo/constants/colors.dart';
import 'package:marketo/data/user_data.dart';
import 'package:marketo/screens/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
  );
  await UserSimplePreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'marketo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light, 
          primary: white, 
          onPrimary: white, 
          secondary: grey, 
          onSecondary: grey, 
          error: black,
          onError: black, 
          background: white, 
          onBackground: white, 
          surface: blue, 
          onSurface: blue)
      ),
      home: const Splash(),
      // home: const NewList(),
    );
  }
}