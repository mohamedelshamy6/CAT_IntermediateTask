import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/ui/screens/app_body/bot_nav_bar.dart';
import 'package:untitled/ui/screens/login_signup/signup.dart';
import '../../widgets/button.dart';
import '../../widgets/text_form_field.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    TextEditingController emailC = TextEditingController();
    TextEditingController passC = TextEditingController();
    final auth = FirebaseAuth.instance;
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
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Container(
                  width: 400,
                  height: 700,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Login to CATzon ',
                          style: TextStyle(
                              fontSize: 30,
                              color: Color(0xff1E3163),
                              fontFamily: 'Cairo'),
                        ),
                        Expanded(
                          child: Center(
                            child: Image.asset('images/loggin.jpg'),
                          ),
                        ),
                        CustomTff(
                          controller: emailC,
                          title: 'Email',
                          validatorText: 'Email must be fill',
                        ),
                        const SizedBox(height: 15),
                        CustomTff(
                          controller: passC,
                          title: 'Password',
                          validatorText: 'Password must be fill',
                        ),
                        const Text(
                          'Forgot the password ?',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff1E3163),
                              fontFamily: 'Cairo'),
                        ),
                        const SizedBox(height: 15),
                        Button(
                            destination: const BotNavBar(),
                            title: 'Login',
                            formKey: formKey,
                            emailc: emailC,
                            passc: passC,
                            auth: auth),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Text(
                              'Don\'t have an account ?',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff1E3163),
                                  fontFamily: 'Cairo'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUp(),
                                  )),
                              child: const Text(
                                'Sign up',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff2D46B9),
                                    fontFamily: 'Cairo'),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.facebook,
                                size: 40,
                                color: Colors.blue[700],
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.apple,
                                size: 40,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 10),
                              child: IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  'images/google_icon.png',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
