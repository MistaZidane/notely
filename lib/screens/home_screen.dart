import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/add_task_screen.dart';
import '../screens/notes_screen.dart';
import '../screens/paste_bin_screen.dart';
import '../widgets/tasks.dart';
import 'package:get/route_manager.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final BottomNavigationController bottomController =
      Get.put(BottomNavigationController());
  final int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    AppBar appbar = AppBar(
      backgroundColor: Color.fromRGBO(121, 111, 193, 1),
      title: Text(
        "Notely",
        style: Theme.of(context).textTheme.headline2,
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white70,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: Colors.white70,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Colors.white70,
            )),
      ],
      elevation: 0.0,
    );

    CurvedNavigationBar curvedNavigationBar = CurvedNavigationBar(
      backgroundColor: Color.fromRGBO(228, 224, 239, 1),
      height: 60.0,
      index: bottomController.navigationIndex,
      color: Color.fromRGBO(121, 111, 193, 1),
      items: <Widget>[
        Icon(
          Icons.home_outlined,
          size: 30,
          color: Colors.white70,
        ),
        Icon(
          Icons.notes_outlined,
          size: 30,
          color: Colors.white70,
        ),
        Icon(
          Icons.paste_outlined,
          size: 30,
          color: Colors.white70,
        ),
        Icon(
          Icons.delete_outline,
          size: 30,
          color: Colors.white70,
        ),
      ],
      onTap: bottomController.changeNavigationIndex,
    );
    return GetBuilder<BottomNavigationController>(builder: (bottomController) {
      return Scaffold(
        backgroundColor: Color.fromRGBO(228, 224, 239, 1),
        appBar: appbar,
        body: IndexedStack(
          index: bottomController.navigationIndex,
          children: [
            Home(
              appBarHeight: appbar.preferredSize.height,
              navigationBarHeight: curvedNavigationBar.height,
            ),
            NotesScreen(),
            PasteBinScreen(),
            Container(
              child: Text("Trash"),
            ),
          ],
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        floatingActionButton: FloatingActionButton(
          tooltip: "Add Task",
          backgroundColor: Color.fromRGBO(121, 111, 193, 1),
          elevation: 0.0,
          // shape:
          //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          onPressed: () {
            Get.to(AddTaskScreen());
          },
          child: Icon(Icons.add),
        ),

        bottomNavigationBar: curvedNavigationBar,
      );
    });
  }
}

class BottomNavigationController extends GetxController {
  var navigationIndex = 0;

  void changeNavigationIndex(int index) {
    navigationIndex = index;
    update();
  }
}

class MyTabController extends GetxController with SingleGetTickerProviderMixin {
  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: 4);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}

class Home extends StatelessWidget {
  final double appBarHeight;
  final double navigationBarHeight;
  Home({required this.appBarHeight, required this.navigationBarHeight});
  @override
  Widget build(BuildContext context) {
    final MyTabController _tabx = Get.put(MyTabController());
    // ↑ init tab controller
    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: appBarHeight,
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black38))),
          padding: EdgeInsets.only(top: 15.0, bottom: 0.0),
          width: double.infinity,
          child: TabBar(
              indicatorColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
              controller: _tabx.controller,
              tabs: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    "All",
                    style: TextStyle(
                        color: Colors.black38,
                        fontSize: 17.0,
                        fontFamily: "Georama"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    "Completed",
                    style: TextStyle(
                        color: Colors.black38,
                        fontSize: 17.0,
                        fontFamily: "Georama"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    "Uncompleted",
                    style: TextStyle(
                        color: Colors.black38,
                        fontSize: 17.0,
                        fontFamily: "Georama"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    "Favourites",
                    style: TextStyle(
                        color: Colors.black38,
                        fontSize: 17.0,
                        fontFamily: "Georama"),
                  ),
                ),
              ]),
        ),
        Container(
          //Add this to give height
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).viewInsets.top +
                  appBarHeight +
                  navigationBarHeight +
                  appBarHeight +
                  33),
          child: TabBarView(controller: _tabx.controller, children: [
            Tasks(),
            Center(child: Text("Completed")),
            Center(child: Text("Uncompleted")),
            Center(child: Text("Favourite")),
          ]),
        ),
      ],
    );
  }
}
