import 'package:flutter/material.dart';
import 'package:gdsc/animated_list.dart';
import 'package:gdsc/register_screen.dart';
import 'package:gdsc/share/compo.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => LogeinScreen();
}

class LogeinScreen extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    bool isPassword = true;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                color: Colors.purple,
                height: size.height / 3,
                child: Center(
                    child: Text(
                  'LogIn',
                  style: TextStyle(
                      fontSize: size.height / 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
            SizedBox(height: size.height / 8),
            Padding(
              padding: const EdgeInsets.all(10),
              child: MyTextFormField(
                labelText: 'Email',
                prefixicon: (Icons.email),
                padding: 10.0,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: MyTextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: isPassword,
                labelText: "Password",
                prefixicon: Icons.lock,
                padding: 10.0,
                suffixIcon: Icons.remove_red_eye,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height / 60,
              ),
              child: ElevatedButton(
                onPressed: () {
                  MyNavigator(
                      context: context, widget: const AnimatedListScreen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width / 3, vertical: size.height / 45),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('Login'),
              ),
            ),
            SizedBox(
              height: size.height / 35,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const RegisterScreen();
                  }),
                );
              },
              style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width / 3.3,
                    vertical: size.height / 45,
                  ),
                  // ignore: prefer_const_constructors
                  side: BorderSide(
                    color: Colors.purple,
                    width: 1,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  )),
              child: const Text(
                'Register',
                style: TextStyle(color: Colors.purple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
