import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_application/Screens/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../PageModels.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List<PageModel> pages;

  ValueNotifier<int> _valueNotifier = ValueNotifier(0);

  void _setPages() {
    pages = List<PageModel>();
    pages.add(PageModel(
        'assets/images/bg9.jpg',
        'Welcome!',
        "Making friends is easy as waving your hand back and forth in easy step",
        Icons.all_inclusive));
    pages.add(PageModel('assets/images/bg.jpg', 'Be in touch',
        'Read about all what you want                           ',
        Icons.attachment));
    pages.add(PageModel('assets/images/bg7.jpg', 'Know',
        "What happens around you                           ", Icons.group));
    pages.add(PageModel('assets/images/bg4.jpg', "Enjoy",
        "and give us your feedback                           ",
        Icons.feedback));
  }

  @override
  Widget build(BuildContext context) {
    _setPages();
    return Scaffold(

      body: Stack(
        children: <Widget>[
          PageView.builder(
            itemBuilder: (context, index) {
              return Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: ExactAssetImage(
                              pages[index].images,
                            ),
                            fit: BoxFit.cover)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Transform.translate(
                        child: Icon(
                          pages[index].icons,
                          size: 140,
                          color: Colors.white,
                        ),
                        offset: Offset(0, -100),
                      ),
                      Text(
                        pages[index].title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 28),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 48, right: 48, top: 18),
                        child: Text(
                          pages[index].description,
                          style:
                          TextStyle(color: Colors.grey[350],
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.2),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
            itemCount: pages.length,
            onPageChanged: (index){
              _valueNotifier.value = index;
            },
          ),
          Transform.translate(
            offset: Offset(0, 165),
            child: Align(
              alignment: Alignment.center,
              child: _displayPageIndicators(pages.length),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 28, left: 16, right: 16),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  color: Colors.red[800],
                  child: Text(
                    "GET STARTED",
                    style: TextStyle(
                        color: Colors.white, fontSize: 16, letterSpacing: 1),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      _updateSeen();
                      return HomeScreen();
                    }));
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _displayPageIndicators(int length)
  {
    return PageViewIndicator(
      pageIndexNotifier: _valueNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.grey,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.red,
        ),
      ),
    );
  }
  void _updateSeen() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('seen', true);

  }
}



