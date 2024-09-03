import 'package:examapp/ConnectDB/connectDB.dart';
import 'package:examapp/Views/Auth/login.dart';
import 'package:examapp/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await connectMongoDb.connect();
  // flutter pub add provider
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Login(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
