import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.formKey,
    required this.emailc,
    required this.passc,
    required this.auth,
    required this.title,
    required this.destination,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController emailc;
  final TextEditingController passc;
  final FirebaseAuth auth;
  final String title;
  final dynamic destination;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        height: 50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        padding: const EdgeInsets.all(8.0),
        color: const Color(0xff2D46B9),
        onPressed: () {
          if (formKey.currentState!.validate()) {}
          if (emailc.text.isNotEmpty && passc.text.isNotEmpty) {
            title == 'Login'
                ? auth
                    .signInWithEmailAndPassword(
                        email: emailc.text, password: passc.text)
                    .then((value) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => destination,
                        ));
                  })
                : auth
                    .createUserWithEmailAndPassword(
                        email: emailc.text, password: passc.text)
                    .then((value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => destination,
                        ));
                  });
          } else {}
        },
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 20, color: Colors.white, fontFamily: 'Cairo'),
        ),
      ),
    );
  }
}
