import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Reset extends StatelessWidget {
  const Reset({super.key});

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
              Get.back();
            },
          )),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.lock,
              size: 90,
            ),
            const Center(
              child: Text(
                'Reset your password here',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(97, 31, 64, 20)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                'Enter your new password below',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                SizedBox(
                  width: 60,
                ),
                Text('New Password',
                    style: TextStyle(color: Color.fromRGBO(97, 31, 64, 20))),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 20),
              child: TextField(
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.visibility,
                    color: Color.fromRGBO(97, 31, 64, 20),
                  ),
                ),
              ),
            ),
            const Row(
              children: [
                SizedBox(
                  width: 60,
                ),
                Text('Confirm password',
                    style: TextStyle(color: Color.fromRGBO(97, 31, 64, 20))),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 20),
              child: TextField(
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.visibility,
                    color: Color.fromRGBO(97, 31, 64, 20),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {},
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
                    'RESET PASSWORD',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
