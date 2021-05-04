import 'package:flutter/material.dart';
import 'package:news_application/HomeScreens/Favourites.dart';
import 'package:news_application/HomeScreens/Popular.dart';
import 'package:news_application/HomeScreens/What\'sNew.dart';
import 'package:news_application/Shared_UI/Drawer_.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex:0,length: 3, vsync: this);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore"),
        centerTitle: false,
        actions:<Widget> [
          IconButton(icon: Icon(Icons.search ), onPressed:(){}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: (){})
        ],
        bottom: TabBar(tabs:[
          Tab(text: "WHAT'S NEW"),
          Tab(text: "POPULAR"),
          Tab(text: "FAVOURITES"),
        ] ,
        controller: _tabController,
          indicatorColor: Colors.white,
        ),
      ),
      body: Center(
        child: TabBarView(children: [
         WhatsNew(),
          Popular(),
          Favourites(),
        ] , controller: _tabController,),
      ),
      drawer: DrawerNavigator(),
    );
  }
}
