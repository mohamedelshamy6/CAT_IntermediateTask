import 'package:flutter/material.dart';
import 'login_signup/login.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Login(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xff1E3163).withOpacity(0.85),
              const Color(0xff2D46B9).withOpacity(0.85)
            ],
            stops: const [0.2, 0.8],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              'images/logo.png',
              width: MediaQuery.of(context).size.width - 50,
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 20),
            const CircularProgressIndicator(
              color: Colors.white,
            )
          ]),
        ),
      ),
    );
  }
}
