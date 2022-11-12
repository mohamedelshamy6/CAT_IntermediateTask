import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../widgets/button.dart';
import '../../widgets/text_form_field.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    TextEditingController emailC = TextEditingController();
    TextEditingController passC = TextEditingController();
    TextEditingController phoneC = TextEditingController();
    TextEditingController passConfC = TextEditingController();
    TextEditingController firstnameC = TextEditingController();
    TextEditingController lastnameC = TextEditingController();
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
                  height: 800,
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
                          'Sign up to CATzon ',
                          style: TextStyle(
                              fontSize: 30,
                              color: Color(0xff1E3163),
                              fontFamily: 'Cairo'),
                        ),
                        Expanded(
                          child: Center(
                            child: Image.asset('images/signupp.jpg'),
                          ),
                        ),
                        CustomTff(
                          controller: firstnameC,
                          title: 'First name',
                          validatorText: 'First name must be fill',
                        ),
                        const SizedBox(height: 15),
                        CustomTff(
                          controller: lastnameC,
                          title: 'Last name',
                          validatorText: 'Last name must be fill',
                        ),
                        const SizedBox(height: 15),
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
                        const SizedBox(height: 15),
                        CustomTff(
                          controller: passConfC,
                          title: 'Password Confirmation',
                          validatorText: 'Password Confirmation must be fill',
                        ),
                        const SizedBox(height: 15),
                        CustomTff(
                          controller: phoneC,
                          title: 'Phone',
                          validatorText: 'Phone must be fill',
                        ),
                        const SizedBox(height: 15),
                        Button(
                            destination: const Login(),
                            title: 'Sign up',
                            formKey: formKey,
                            emailc: emailC,
                            passc: passC,
                            auth: auth),
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
