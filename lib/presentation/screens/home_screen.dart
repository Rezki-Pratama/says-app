import 'package:flutter/material.dart';
import 'package:says_app/presentation/pages/call_page.dart';
import 'package:says_app/presentation/pages/camera_page.dart';
import 'package:says_app/presentation/pages/chat_page.dart';
import 'package:says_app/presentation/pages/status_page.dart';
import 'package:says_app/presentation/utilities/style.dart';
import 'package:says_app/presentation/widgets/custom_tab_bar.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool _isSearch = false;
  int _currentPageIndex = 1;
  PageController _pageViewController = PageController(initialPage: 1);
  List<Widget> get _pages => [
    CameraPage(),
    ChatPage(),
    StatusPage(),
    CallPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentPageIndex !=0?AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: _isSearch == false ? primaryColor : Colors.transparent,
        title: _isSearch == false
            ? Text("WhatsApp Clone")
            : Container(
                height: 0.0,
                width: 0.0,
              ),
        flexibleSpace: _isSearch == false
            ? Container(
                height: 0.0,
                width: 0.0,
              )
            : _buildSearch(),
        actions: <Widget>[
          InkWell(
              onTap: () {
                setState(() {
                  _isSearch = true;
                });
              },
              child: Icon(Icons.search)),
          SizedBox(
            width: 5,
          ),
          InkWell(onTap: (){
          },child: Icon(Icons.more_vert))
        ],
      ):null,
      body: Column(
        children: <Widget>[
          //TODO:CustomTabBar
          _isSearch == false
              ? _currentPageIndex != 0
                  ? CustomTabBar(index: _currentPageIndex)
                  : Container(height: 0.0, width: 0.0,)
              : Container(
                  height: 0.0,
                  width: 0.0,
                ),
         
          Expanded(
            child: PageView.builder(
              itemCount: _pages.length,
              controller: _pageViewController,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              itemBuilder: (_, index) {
                return _pages[index];
              },
            ),
          )
        ],
      ),
    );
  }

   _buildSearch() {
    return Container(
      height: 45,
      margin: EdgeInsets.only(top: 25),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(.3),
            spreadRadius: 1,
            offset: Offset(0.0, 0.50))
      ]),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search...",
          prefixIcon: InkWell(
            onTap: () {
              //TODO:
              setState(() {
                _isSearch = false;
              });
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
      ),
    );
  }
}
