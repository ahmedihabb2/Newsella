import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _drawHeader(),
          _drawTopStories(),
        ],
      ),
    );
  }

  Widget _drawHeader() {
    TextStyle _headerStyle = TextStyle(
        color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600);
    TextStyle _descriptionStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
    );
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage('assets/images/hs.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 64, right: 64),
              child: Text(
                "Real Madrid Wins The Match In Camp nau",
                style: _headerStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 34, right: 34),
              child: Text(
                'Benzema Scores Two Goals , tab here to read more information',
                style: _descriptionStyle,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _drawTopStories() {
    return Container(
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, top: 16),
            child: _drawSectionTitles('Top Stories'),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: [
                  _drawSingleRow(),
                  _drawDivider(),
                  _drawSingleRow(),
                  _drawDivider(),
                  _drawSingleRow(),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  child: _drawSectionTitles("Recent Updates"),
                  padding: EdgeInsets.only(left: 16 , bottom: 8),
                ),
                _drawRecentUpdateCards(Colors.deepOrange),
                _drawRecentUpdateCards(Colors.teal),
                SizedBox(
                  height: 48,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawSingleRow() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            child: Image(
              image: ExactAssetImage('assets/images/hs.jpg'),
              fit: BoxFit.cover,
            ),
            height: 125,
            width: 125,
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Al-Ahly beats El-Wedad in Moroco 3-0 , in a hard match',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Ahmed Ihab'),
                    Row(
                      children: [
                        Icon(Icons.timer),
                        Text("15min"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawDivider() {
    return Container(
      height: 1,
      width: double.infinity,
      color: Colors.grey.shade100,
    );
  }

  Widget _drawSectionTitles(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.grey.shade700,
        fontWeight: FontWeight.w600,
      ),
    );
  }
  Widget _drawRecentUpdateCards(Color color) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: ExactAssetImage('assets/images/hs.jpg'),fit: BoxFit.cover),
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height *0.25,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16 ,top: 16),
            child: Container(
              padding: EdgeInsets.only(left: 24 , right: 24 , top: 2 , bottom: 2),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text('SPORT' , style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16 , top: 8 , bottom: 8),
            child: Text('Liverpool VS Everton Today',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600
            ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12 , bottom: 8),
            child: Row(
              children: [
                Icon(Icons.timer  , color: Colors.grey,),
                SizedBox(
                  width: 6,
                ),
                Text("15min" , style: TextStyle(color: Colors.grey , fontSize: 16))
              ],
            ),
          ),
        ],
      ),
    );
  }
}


