import 'package:get/get.dart';
import 'package:note_app/controller/note_controller.dart';

class NoteBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      NoteController(),
      permanent: true,
    );
  }
}
