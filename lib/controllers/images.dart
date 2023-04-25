import 'package:get/get.dart';

class ImagesFood extends GetxController {
  var _imagesSlides = <String>[
    "https://asset.kompas.com/crops/J0ARoySS4ZFviSelgHTMsxHPNv0=/0x0:1000x667/750x500/data/photo/2020/12/17/5fdb3cd0c1525.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/f/fb/Breakfast%21.jpg?20121217170313",
    "https://upload.wikimedia.org/wikipedia/commons/0/09/NANAK_lunch_set.jpg",
    "https://images.pexels.com/photos/958545/pexels-photo-958545.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
  ].obs;

  getSelectedImages(int index) => _imagesSlides.elementAt(index);
  setSelectedImages(int index, var values) => _imagesSlides[index] = values;

  var counters = 0.obs;

  void setIncrement() =>
      {counters.value < 3 ? counters.value += 1 : counters.value = 0};
  void setDecrement() =>
      {counters.value > 0 ? counters.value -= 1 : counters.value = 0};

  var imagesfood1 =
      "https://asset.kompas.com/crops/J0ARoySS4ZFviSelgHTMsxHPNv0=/0x0:1000x667/750x500/data/photo/2020/12/17/5fdb3cd0c1525.jpg"
          .obs;
  var imagesfood2 =
      "https://upload.wikimedia.org/wikipedia/commons/f/fb/Breakfast%21.jpg?20121217170313"
          .obs;
  var imagesfood3 =
      "https://upload.wikimedia.org/wikipedia/commons/0/09/NANAK_lunch_set.jpg"
          .obs;
  var imagesfood4 =
      "https://images.pexels.com/photos/958545/pexels-photo-958545.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
          .obs;

  var imagestransport1 =
      "https://akcdn.detik.net.id/visual/2019/02/28/a02dae3a-28ca-49ce-8596-2f165188872f_169.jpeg?w=650"
          .obs;
  var imagestransport2 =
      "https://www.toyota.astra.co.id/sites/default/files/2021-09/home%20banner%20alphard%201293x820.jpg"
          .obs;
  var imagestransport3 =
      "https://www.mobil88.astra.co.id/blog/wp-content/uploads/2021/03/3vjMg6W"
          .obs;
  var imagestransport4 =
      "https://akcdn.detik.net.id/visual/2019/02/28/a02dae3a-28ca-49ce-8596-2f165188872f_169.jpeg?w=650"
          .obs;
}
