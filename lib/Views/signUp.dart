import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';
import 'login.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Get.to(() => const HomePage());
              },
            )),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            bottom: 120,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.person,
                size: 90,
              ),
              const Text(
                'SIGN UP HERE',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(97, 31, 64, 20)),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: const Text('Username',
                          style:
                              TextStyle(color: Color.fromRGBO(97, 31, 64, 20))),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      suffixIcon: const Icon(
                        Icons.person,
                        color: Color.fromRGBO(97, 31, 64, 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      label: const Text('Email',
                          style:
                              TextStyle(color: Color.fromRGBO(97, 31, 64, 20))),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      suffixIcon: const Icon(
                        Icons.email,
                        color: Color.fromRGBO(97, 31, 64, 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      label: const Text('Password',
                          style:
                              TextStyle(color: Color.fromRGBO(97, 31, 64, 20))),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      suffixIcon: const Icon(
                        Icons.visibility,
                        color: Color.fromRGBO(97, 31, 64, 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      label: const Text('Confirm Password',
                          style:
                              TextStyle(color: Color.fromRGBO(97, 31, 64, 20))),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      suffixIcon: const Icon(
                        Icons.visibility,
                        color: Color.fromRGBO(97, 31, 64, 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const LogIn());
                },
                child: Container(
                  width: 500,
                  height: 40,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 220, 17, 119),
                  ),
                  child: const Center(
                    child: Text(
                      'CREATE',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Alreday have an account?',
                    style: TextStyle(fontSize: 16),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => const LogIn());
                    },
                    child: const Text('Login',
                        style:
                            TextStyle(fontSize: 16, color: Colors.blueAccent)),
                  )
                ],
              ),
            ],
          ),
        )));
  }
}
