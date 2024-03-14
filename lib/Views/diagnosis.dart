import 'dart:io';

import 'package:cancer_app/Controller/diagnosisController.dart';
import 'package:cancer_app/Views/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Diagnosis extends StatelessWidget {
   final String result;
   const Diagnosis({Key? key, required this.result}) : super(key: key);
  // const Diagnosis({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DiagnosisController());
    String displayText = 'Classification Result: $result';
    
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
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 100),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Icon(
                //   Icons.local_hospital_outlined,
                //   size: 90,
                // ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Upload required image for analysis',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(97, 31, 64, 20),
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),

                //something is needed here
                Obx(
                  () => controller.selectedPath.value == ''
                      ? const Icon(
                          Icons.camera_alt,
                          size: 50,
                        )
                      : Image.file(
                          File(controller.selectedPath.value),
                          height: 500,
                        ),
                ),
                const SizedBox(
                  height: 45,
                ),
                InkWell(
                  onTap: () {
                    Get.bottomSheet(Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, right: 40, left: 35, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  controller.pickImage(ImageSource.gallery);
                                },
                                icon: const Icon(
                                  Icons.photo_library,
                                  size: 50,
                                  color: Colors.white,
                                )),
                            Expanded(child: Container()),
                            IconButton(
                                onPressed: () {
                                  controller.pickImage(ImageSource.camera);
                                },
                                icon: const Icon(
                                  Icons.camera_alt,
                                  size: 50,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ),
                    ));
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
                Text(
                  displayText,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(97, 31, 64, 20)
                    ),
                )
          

                
              ],
            ),
          ],
        ),
      )),
    );
  }
}
