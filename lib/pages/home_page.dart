import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;
  
  //sign users out function
  void signUsersOut() {
    FirebaseAuth.instance.signOut();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [ IconButton(onPressed: signUsersOut, icon: const Icon(Icons.logout))
      ]),
      body: Center(child: Text("Logged In As: ${user.email!}",)),
    );
  }
}