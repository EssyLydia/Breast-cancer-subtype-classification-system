import 'package:cancer_app/Views/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Diagnosis extends StatelessWidget {
  const Diagnosis({super.key});

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
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Upload required image for analysis',
              style: TextStyle(
                  fontSize: 17,
                  color: Color.fromRGBO(97, 31, 64, 20),
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),

            //something is needed here
            InkWell(
              onTap: () {
                Get.to(() => const HomePage());
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
                    'UPLOAD IMAGE',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Classification below:',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(97, 31, 64, 20)),
            ),
            const Text(
              'Carcinoma in situ',
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
      )),
    );
  }
}
