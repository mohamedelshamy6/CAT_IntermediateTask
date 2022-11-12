import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/ui/screens/app_body/bot_nav_bar.dart';
import 'package:untitled/ui/screens/loading_screen.dart';
import 'package:untitled/view_model/cart_view_model.dart';
import 'package:untitled/view_model/products_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        builder: (context, child) => const BotNavBar(),
        providers: [
          ChangeNotifierProvider<CartViewModel>(
            create: (context) => CartViewModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => ProductViewModel()
              ..getAllProducts().then(
                (value) {
                  if (value!.statusCode != 200) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(value.message),
                      ),
                    );
                  }
                },
              ),
            builder: (context, child) => const BotNavBar(),
          ),
        ],
      ),
    );
  }
}
