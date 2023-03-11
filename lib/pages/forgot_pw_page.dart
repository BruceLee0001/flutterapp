import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForogtPasswordPage extends StatefulWidget {
  const ForogtPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForogtPasswordPage> createState() => _ForogtPasswordPageState();
}

class _ForogtPasswordPageState extends State<ForogtPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('A password reset link has been sent.'),
            );
          });
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[200],
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'Enter your email and we will send you a password reset link.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            //email
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Email',
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: passwordReset,
              child: Text('Reset Password'),
              color: Colors.deepPurple[200],
            )
          ],
        ));
  }
}
