import 'package:get/get.dart';

class Counter extends GetxController {
  var counter = 0.obs;
  var scannedString = [""].obs;

  setScannedString(var scannedStrings) => scannedString.value = scannedStrings!;

  var _selectedList = <String>["true", "true", "true", "true"].obs;
  getSelectedList(int tes) => _selectedList.elementAt(tes);
  setSelectedList(int tes, var values) => _selectedList[tes] = values;

  var _animateopacity = 1.0.obs;
  getSelectedOpacity() => _animateopacity.value;
  setSelectedOpacity(var opacities) => _animateopacity.value = opacities;

  bool _visible = true;
  getSelectedVisible() => _visible;
  setSelectedVisible(bool visibles) => _visible = visibles;
}
