import 'package:flutter/material.dart';
import 'package:wiztok/constants.dart';
import 'package:wiztok/views/screens/auth/login_screen.dart';
import 'package:wiztok/views/widgets/text_input_field.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  RegisterScreen({super.key});

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
                'Register Page',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                        'https://p1.hiclipart.com/preview/57/433/160/user-profile-circle-user-account-data-login-symbol-blackandwhite-line-art-png-clipart.jpg'),
                    backgroundColor: Colors.black,
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: () {
                        authController.pickImage();
                      },
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  ),
                ],
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
                  textController: _usernameController,
                  labelText: 'Username',
                  icon: Icons.person,
                  isObscured: false,
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
                height: 15,
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
                    authController.registerUser(
                      _usernameController.text,
                      _emailController.text,
                      _passController.text,
                      authController.profilePic,
                    );
                  },
                  child: const Center(
                      child: Text(
                    'Register',
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
                    'Already have an account? ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => (LoginScreen()),
                          ),
                        );
                      },
                      child: const Text(
                        'Login',
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
