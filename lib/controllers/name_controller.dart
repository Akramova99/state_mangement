import 'package:get/get.dart';
import 'package:logger/logger.dart';

class Controller extends GetxController {
  var counter = 0.obs;
  var isLike = false.obs;
  var name = "".obs;

  void increment() {
    counter++;
  }
void onChangedName(String person){
    name.value =person;
}
  void onClick() {
    isLike.value= !isLike.value;
    Logger().i(isLike);

  }
}
