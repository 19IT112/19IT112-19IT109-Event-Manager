import 'package:event/auth.dart';
import 'package:event/auth_screen.dart';
import 'package:event/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  // const Myapp({Key? key}) : super(key: key);
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration(seconds: 3), () {
    //   if (auth.currentUser == null) {
    //     Navigator.of(context).pushReplacement(
    //         MaterialPageRoute(builder: (context) => AuthScreen()));
    //   } else {
    //     Navigator.of(context).pushReplacement(
    //         MaterialPageRoute(builder: (context) => HomePage()));
    //   }
    // });
    return MultiProvider(
      providers: [
        Provider<Auth>(create: (context) => Auth(FirebaseAuth.instance)),
        StreamProvider(
          create: (context) => context.read<Auth>().authstateChanges,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        title: "Event",
        home: AuthWrapper(),
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<User?>();
    // ignore: unnecessary_null_comparison
    if (user != null) {
      return HomePage();
    } else {
      return AuthScreen();
    }
  }
}
