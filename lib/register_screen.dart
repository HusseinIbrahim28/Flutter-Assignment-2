import 'package:flutter/material.dart';
import 'package:gdsc/login_screen.dart';
import 'package:gdsc/share/compo.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isPassword = true;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
                controller: nameController,
                prefixicon: Icons.person,
                padding: 15.0,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter your Name';
                  }
                },
              ),
              MyTextFormField(
                labelText: 'Email',
                controller: emailController,
                prefixicon: Icons.email,
                padding: 15.0,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter your Email';
                  }
                },
              ),
              MyTextFormField(
                labelText: 'Phone',
                controller: phoneController,
                prefixicon: Icons.phone,
                padding: 15.0,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter your Phone';
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  obscureText: isPassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(
                          () {
                            isPassword = !isPassword;
                          },
                        );
                      },
                      icon: Icon(
                          isPassword ? Icons.visibility : Icons.visibility_off),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter your Password';
                    } else if (value.length < 8) {
                      return 'Password must be at least 8 characters ';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: confirmpasswordController,
                  obscureText: isPassword,
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                      icon: Icon(
                          isPassword ? Icons.visibility : Icons.visibility_off),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter your Email';
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height / 60),
                child: ElevatedButton(
                  onPressed: () {
                    MyNavigator(
                        context: context, widget: const RegisterScreen());
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
                  if (formKey.currentState!.validate()) {
                    debugPrint(emailController.text);
                    debugPrint(passwordController.text);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Loginscreen()),
                        (route) => false);
                  }
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
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.purple),
                ),
              ),
              SizedBox(
                height: size.height / 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
