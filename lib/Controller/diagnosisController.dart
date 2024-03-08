import 'package:cancer_app/Views/diagnosis.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;
import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;

class DiagnosisController extends GetxController {
  var selectedPath = ''.obs;

  late tfl.Interpreter _interpreter;

  @override
  void onInit() {
    super.onInit();
    loadModel();
  }

  loadModel() async {
    _interpreter = await tfl.Interpreter.fromAsset('assets/saved_model.tflite');
  }

  

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
     if (_interpreter == null || selectedPath.value.isEmpty) return;

    // Preprocess the image
    var input = await preprocessImage(selectedPath.value);

    // Make prediction
    var output = List.generate(1, (index) => List.generate(2, (index) => 0.0)); // Assuming two classes (benign and malignant)
    _interpreter.run(input, output);

     // Get the prediction result
    double benignProbability = output[0][0];
    double malignantProbability = output[0][1];

    // Determine the predicted class based on probabilities
    String predictedClass = benignProbability > malignantProbability ? 'Benign' : 'Malignant';

    // Forward the result to the Diagnosis page
    Get.to(() => Diagnosis(result: predictedClass));


  }

    Future<Float32List> preprocessImage(String imagePath) async {
    // Load and preprocess the image for the model
    File imageFile = File(imagePath);
    Uint8List imageBytes = await imageFile.readAsBytes();

    // Resize the image to the model's input size 
    var resizedImageBytes = resizeImage(imageBytes, 224, 224);

    // Normalize pixel values to the range [0, 1]
    var normalizedImageBytes = Float32List.fromList(resizedImageBytes.map((e) => e / 255.0).toList());

    return normalizedImageBytes;
  }


   List<int> resizeImage(Uint8List imageBytes, int targetWidth, int targetHeight) {
    //Resize the image using the image package
    img.Image? image = img.decodeImage(imageBytes);

    // Resize the image to the target size
    img.Image resizedImage = img.copyResize(image!, width: targetWidth, height: targetHeight);

    // Convert the resized image to bytes
    List<int> resizedImageBytes = img.encodePng(resizedImage);

    return resizedImageBytes;

   }

}
