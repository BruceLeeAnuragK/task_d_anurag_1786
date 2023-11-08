import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_d_anurag_1786/view/screen/home/cart_page.dart';
import 'package:task_d_anurag_1786/view/screen/home/detail_page.dart';
import 'package:task_d_anurag_1786/view/screen/home/home_page.dart';
import 'package:task_d_anurag_1786/view/screen/home/provider/cart_add_provider.dart';
import 'package:task_d_anurag_1786/view/screen/home/provider/favourite_page.dart';
import 'package:task_d_anurag_1786/view/screen/login/login_screen.dart';
import 'package:task_d_anurag_1786/view/screen/login/provider/login_provider.dart';
import 'package:task_d_anurag_1786/view/screen/splash/splash_screen.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => LoginProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => CartProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => FaouriteProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "splash_screen",
      routes: {
        "login_screen": (context) => LoginPage(),
        "home_page": (context) => HomePage(),
        "splash_screen": (context) => SplashScreen(),
        "detail_page": (context) => ProductDetailPage(),
        "cart_page": (context) => CartPage(),
      },
    );
  }
}
