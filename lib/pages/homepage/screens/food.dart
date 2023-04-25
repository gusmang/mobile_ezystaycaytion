import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:getxtest/config/colorUtils.dart';
import 'package:getxtest/controllers/api/foods.dart';
import 'package:getxtest/models/foods/foodsList.dart';
import 'package:getxtest/pages/component/screen_foodhome/list.dart';
import 'package:getxtest/pages/component/screen_foodhome/list_items_2.dart';
import 'package:getxtest/pages/component/widget/button/circletextbutton.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(HomeFoodScreen());
}

class HomeFoodScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeFoodScreen();
}

class _HomeFoodScreen extends State<HomeFoodScreen> {
  FoodsController dataController = Get.put(FoodsController());
  late Future<dynamic> _future;
  late Future<dynamic> _futureCategory = dataController.getCategoriesApi();

  @override
  void initState() {
    _future = dataController.getFoodsApi(true, 1, dataController.pagingOffset);
    _futureCategory = dataController.getCategoriesApi();

    dataController.selectedCategories.value = 1;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final RefreshController _refreshController =
        RefreshController(initialRefresh: false);

    void _onRefresh() async {
      // monitor network fetch
      await Future.delayed(const Duration(milliseconds: 1000));
      // if failed,use refreshFailed()
      _refreshController.refreshCompleted();

      dataController.getFoodsApi(true, dataController.selectedCategories.value,
          dataController.pagingOffset);
    }

    void _onLoading() async {
      // monitor network fetch
      await Future.delayed(const Duration(milliseconds: 1000));

      dataController.setPagingOffset();

      dataController.getFoodsApi(false, dataController.selectedCategories.value,
          dataController.pagingOffset);
      _refreshController.loadComplete();
    }

    var size = MediaQuery.of(context).size;

    final double itemHeight = 400;
    final double itemWidth = size.width / 1.75;

    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        Container(
            width: screenWidth,
            height: 40,
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: FutureBuilder<dynamic>(
                future: _futureCategory, // <-- your future
                builder: (context, snapshot) {
                  return Obx(() => ListView.builder(
                      itemCount: dataController.CatlengthData.value,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              dataController.isDataLoading.value = true;
                              dataController.getFoodsApi(
                                  true,
                                  dataController.categoryModel[index].id,
                                  dataController.pagingOffset);
                              dataController.selectedCategories.value =
                                  dataController.categoryModel[index].id!
                                      .toInt();
                            },
                            child: Obx(() => Container(
                                margin: const EdgeInsets.only(right: 12),
                                child: Column(children: [
                                  CircleTextButton(
                                      100,
                                      30,
                                      60,
                                      dataController.categoryModel[index].name
                                          .toString(),
                                      Icon(Icons.dining,
                                          size: 18,
                                          color: dataController
                                                      .selectedCategories
                                                      .value ==
                                                  dataController
                                                      .categoryModel[index].id
                                              ? Colors.white
                                              : AppColors().primary),
                                      dataController.selectedCategories.value !=
                                              dataController
                                                  .categoryModel[index].id
                                          ? Colors.white
                                          : AppColors().primary,
                                      dataController.selectedCategories.value ==
                                              dataController
                                                  .categoryModel[index].id
                                          ? Colors.white
                                          : AppColors().primary),
                                ]))));
                      }));
                })),
        const SizedBox(height: 10),
        SizedBox(
            height: screenHeight - 200,
            child: Obx(() {
              if (dataController.isDataLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return SmartRefresher(
                    enablePullDown: true,
                    enablePullUp: true,
                    header: WaterDropMaterialHeader(
                      backgroundColor: AppColors().primary,
                    ),
                    controller: _refreshController,
                    onRefresh: _onRefresh,
                    onLoading: _onLoading,
                    footer: const ClassicFooter(
                      loadStyle: LoadStyle.ShowWhenLoading,
                    ),
                    child: ListView(
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        ),
                        FutureBuilder<dynamic>(
                            future: _future, // <-- your future
                            builder: (context, snapshot) {
                              return Obx(() => GridView.builder(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 200,
                                          childAspectRatio:
                                              itemWidth / itemHeight,
                                          crossAxisSpacing: 0,
                                          mainAxisSpacing: 0),
                                  itemCount: dataController.lengthData.value,
                                  itemBuilder: (BuildContext ctx, index) {
                                    return Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: ListItems(
                                          dataController.foodModel[index],
                                          dataController.foodModel[index].id
                                              .toString(),
                                          dataController
                                              .foodModel[index].foto_produk
                                              .toString(),
                                          0,
                                          dataController.foodModel[index].name
                                              .toString(),
                                          dataController
                                              .foodModel[index].kategori_name
                                              .toString(),
                                          dataController.foodModel[index].price
                                              .toString(),
                                        ));
                                  }));
                            }),
                      ],
                    ));
              }
            }))
      ]),
    ));
  }
}
