import 'package:get/get.dart';

class AllController extends GetxController {
  // for changing password visibility
  final _isObscure = false.obs;
  bool get isObscure => _isObscure.value;
  changeIsObscure() {
    //switches the value of isObscure
    _isObscure.value = !_isObscure.value;
  }

  final _haveTodo = true.obs;
  bool get haveTodo => _haveTodo.value;
  changeHaveTodo() {
    //switches the value of haveTodo
    _haveTodo.value = !_haveTodo.value;
  }

  final _filterToggle = false.obs;
  bool get filterToggle => _filterToggle.value;
  changeFilterToggle() {
    //switches the value of filterToggle
    _filterToggle.value = !_filterToggle.value;
  }
}
