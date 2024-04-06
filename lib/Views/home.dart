import 'package:cancer_app/Views/signUp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(image: AssetImage('assets/BC2.png')),
          const SizedBox(
            height: 0,
          ),
          const Text(
            'WELCOME TO BC-DIAGNOSIS AND CLASSIFICATION',
            style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(97, 31, 64, 20)),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'An AI based solution for diagnosis and classification of breast cancer subtypes',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 60,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const SignUp()),
  );
              
              //Get.to(() => const SignUp());
            },
            child: Container(
              width: 500,
              height: 40,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 220, 17, 119),
              ),
              child: const Center(
                child: Text(
                  'Get Started',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
          ),
        ],
      ),
    )));
  }
}
