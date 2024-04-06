import 'package:cancer_app/Views/diagnosis.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class DiagnosisController extends GetxController {
  var selectedPath = ''.obs;

 

   //@override
  //void onInit() {
    //super.onInit();
  //}

  Future pickImage(ImageSource source) async {
    final imagePath = await ImagePicker().pickImage(source: source);
    if (imagePath == null) {
      Get.snackbar('Error', 'No image');
    } else {
      selectedPath.value = imagePath.path;
       classifyImage();
    
    }
  }
   Future<void> classifyImage() async {
    if (selectedPath.value.isEmpty) return;

    // Make HTTP POST request to FastAPI server
    const apiUrl = 'http://your_fastapi_server_ip:8000/predict/';
    var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
    request.files.add(await http.MultipartFile.fromPath('file', selectedPath.value));

    try {
      var response = await request.send();
      var responseBody = await response.stream.bytesToString();
      var jsonResponse = json.decode(responseBody);

      // Extract prediction result
      String predictedClass = jsonResponse['prediction'];

      // Forward the result to the Diagnosis page
      Get.to(() => Diagnosis(result: predictedClass));
    } catch (e) {
      print('Error: $e');
      Get.snackbar('Error', 'Failed to classify image');
    }
  }

  
}
