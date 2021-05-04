import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_application/Shared_UI/Drawer_.dart';

class TwitterFeed extends StatefulWidget {
  @override
  _TwitterFeedState createState() => _TwitterFeedState();
}

class _TwitterFeedState extends State<TwitterFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Twitter Feed'),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: (){})
        ],
      ),
      drawer: DrawerNavigator(),
      body: ListView.builder(itemBuilder: (context , position){
        return Card(
          child: Column(
            children: [
              _drawHead(),
              _drawBody(),
              _drawFooter(),
            ],
          ),
        );
      },
      itemCount: 20,
      )
    );
  }

  Widget _drawHead()
  {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: ExactAssetImage('assets/images/hs.jpg'),
            radius: 24,
          ),
          SizedBox(width: 8,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Ahmed Ihab'),
                  SizedBox(width: 3,),
                  Text("@ahmed.ihab" , style: TextStyle(color: Colors.grey),)
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Text('Fri , 12 Sep 2020 . 1.30', style: TextStyle(color: Colors.grey)),
            ],
          )
        ],
      ),
    );
  }
  
  Widget _drawBody()
  {
    return Padding(
        padding: EdgeInsets.only(left: 20 , right: 20 , bottom: 8),
      child: Text("Here the tweet content will appear to the user after we bring it from API"),
    );
  }

  Widget _drawFooter()
  {
    return Padding(
      padding: const EdgeInsets.only(left: 12 , bottom: 8 , right: 12),
      child: Row(
        children: [
          IconButton(icon: Icon(Icons.repeat , color: Colors.orangeAccent,), onPressed: (){}),
          Text('25'),
          Spacer(
            flex: 1,
          ),
          Row(
            children: [
              FlatButton(onPressed: (){}, child: Text('SHARE' , style: TextStyle(color: Colors.orangeAccent),)),
              FlatButton(onPressed: (){}, child: Text('OPEN', style: TextStyle(color: Colors.orangeAccent))),
            ],
          ),
        ],
      ),
    );
  }
}
