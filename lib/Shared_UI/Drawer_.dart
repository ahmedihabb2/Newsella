import 'package:flutter/material.dart';
import 'package:news_application/Screens/HeadlineNews.dart';
import 'package:news_application/Screens/HomeScreen.dart';
import 'package:news_application/Screens/TwitterFeed.dart';
import 'package:news_application/Shared_UI/nav_menu.dart';

class DrawerNavigator extends StatefulWidget {
  @override
  _DrawerNavigatorState createState() => _DrawerNavigatorState();
}

class _DrawerNavigatorState extends State<DrawerNavigator> {
  List<NavMenuItem> navMenuItems = [
    NavMenuItem('Explore', ()=>HomeScreen()),
    NavMenuItem('Headline News', ()=>HeadlineNews()),
    NavMenuItem('Twitter Feed', ()=>TwitterFeed())
  ];
  List<String> navMenu=[
    'Explore',
    'Headline News',
    'Read Later',
    'Videos',
    'Photos',
    'Settings',
    'Logout'
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(top: 75 , left: 20),
        child: ListView.builder(itemBuilder: (context , position){
          return ListTile(
            title:  Text(navMenuItems[position].title , style: TextStyle(fontSize: 18),),
            trailing: Icon(Icons.chevron_right),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return navMenuItems[position].route();
              }));
            },
          );
        },
        itemCount: navMenuItems.length,),
      ),
    );
  }
}

