import 'package:flutter/material.dart';
import 'package:wiztok/constants.dart';
import 'package:wiztok/views/screens/auth/register_screen.dart';
import 'package:wiztok/views/widgets/text_input_field.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'WizTok',
                style: TextStyle(
                  fontSize: 35,
                  color: buttonColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Login Page',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: TextInputField(
                  textController: _emailController,
                  labelText: 'Email',
                  icon: Icons.email,
                  isObscured: false,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: TextInputField(
                  textController: _passController,
                  labelText: 'Password',
                  icon: Icons.lock,
                  isObscured: true,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 50,
                decoration: const BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    authController.loginUser(
                        _emailController.text, _passController.text);
                  },
                  child: const Center(
                      child: Text(
                    'Login',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                  )),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account yet? ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => (RegisterScreen()),
                          ),
                        );
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 20,
                          color: buttonColor,
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
