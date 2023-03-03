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
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPassword = true;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
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
                  padding: const EdgeInsets.all(15.0),
                  child: MyTextFormField(
                    labelText: 'Email',
                    prefixicon: (Icons.email),
                    padding: 0,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter your Email';
                      } else if (emailController.text.contains('@') == false ||
                          emailController.text.contains('.') == false) {
                        return 'Please Enter valid Email';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isPassword,
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter your password';
                      } else if (value.length < 8) {
                        return 'Password must be at least 8 characters ';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPassword = !isPassword;
                          });
                        },
                        icon: Icon(isPassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: size.height / 60,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        debugPrint(emailController.text);
                        debugPrint(passwordController.text);
                        MyNavigator(
                            context: context,
                            widget: const AnimatedListScreen());
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width / 3,
                          vertical: size.height / 45),
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
        ),
      ),
    );
  }
}
