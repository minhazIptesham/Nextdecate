import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
    Text('View');
    /*DefaultTabController(
      length: 5,
      child: Scaffold(
        drawer: const CustomAppDrawer(),
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                  SliverAppBar(
                  backgroundColor: CtmColors.appColor,
                  title: Text('Nextech Mart'),
                  pinned: true,
                  floating: true,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                          onTap: (){
                            print('HomeView.build search click');
                            Get.toNamed(Routes.SEARCH);
                          },
                          child: Icon(Icons.search,color: Colors.white,)),
                    ),
                  ],
                  bottom: TabBar(
                    isScrollable: true,
                    tabs: [
                      Tab(text: "Hot"),
                      Tab(text: "Computer & Office"),
                      Tab(text: "Phone Accessories"),
                      Tab(text: "Gaming PC"),
                      Tab(text: "Toys"),
                    ],
                  ),
                ),
              ];
            },
            body: const TabBarView(
              children: <Widget>[
                Slider1(),
                Text("Computer & Office"),
                Text("Phone Accessories"),
                Text("Gaming PC"),
                Text("Toys"),
              ],
            ),
          ),
      ),
    );*/
  }
}
