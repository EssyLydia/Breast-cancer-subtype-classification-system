import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DiagnosisController extends GetxController {
  var selectedPath = ''.obs;

  Future pickImage(ImageSource source) async {
    final imagePath = await ImagePicker().pickImage(source: source);
    if (imagePath == null) {
      Get.snackbar('Error', 'No image');
    } else {
      selectedPath.value = imagePath.path;
    }
  }
}
