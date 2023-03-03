import 'package:flutter/material.dart';
import 'package:gdsc/login_screen.dart';
import 'package:gdsc/share/compo.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Stack(
                children: [
                  Container(
                    color: Colors.purple,
                    height: size.height / 3,
                    child: Center(
                      child: Text(
                        'Register',
                        style: TextStyle(
                            fontSize: size.height / 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height / 30,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            MyTextFormField(
              labelText: 'Name',
              prefixicon: Icons.person,
              padding: 15.0,
              keyboardType: TextInputType.text,
            ),
            MyTextFormField(
              labelText: 'Email',
              prefixicon: Icons.email,
              padding: 15.0,
              keyboardType: TextInputType.emailAddress,
            ),
            MyTextFormField(
              labelText: 'Phone',
              prefixicon: Icons.phone,
              padding: 15.0,
              keyboardType: TextInputType.number,
            ),
            MyTextFormField(
              labelText: 'Password',
              prefixicon: Icons.lock,
              padding: 15.0,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              suffixIcon: Icons.remove_red_eye,
            ),
            MyTextFormField(
              labelText: 'Confirm Password',
              prefixicon: Icons.lock,
              padding: 15.0,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              suffixIcon: Icons.remove_red_eye,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height / 60),
              child: ElevatedButton(
                onPressed: () {
                  MyNavigator(context: context, widget: const RegisterScreen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width / 3.3,
                    vertical: size.height / 60,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('Register'),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Loginscreen()),
                    (route) => false);
              },
              style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width / 3,
                    vertical: size.height / 60,
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
              child: const Text('Login'),
            ),
            SizedBox(
              height: size.height / 20,
            )
          ],
        ),
      ),
    );
  }
}
