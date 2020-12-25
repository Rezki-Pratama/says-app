import 'package:flutter/material.dart';
import 'package:says_app/presentation/screens/home_screen.dart';
import 'package:says_app/presentation/utilities/style.dart';

class SetProfilePage extends StatefulWidget {
  final String phoneNumber;

  SetProfilePage({Key key, this.phoneNumber}) : super(key: key);

  @override
  _SetProfilePageState createState() => _SetProfilePageState();
}

class _SetProfilePageState extends State<SetProfilePage> {
  String get _phoneNumber => widget.phoneNumber;
  TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: mediaQuery.width / 30,
            vertical: mediaQuery.height / 20),
        child: Column(
          children: <Widget>[
            Text(
              "Profile Info",
              style: TextStyle(
                color: greenColor,
                fontSize: mediaQuery.width / 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: mediaQuery.height / 20,
            ),
            Text(
              "Tolong isi nama dan foto profil anda",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: mediaQuery.height / 15,
            ),
            _rowWidget(),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  color: greenColor,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => HomeScreen(),
                        ));
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontSize: mediaQuery.width / 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _rowWidget() {
    Size mediaQuery = MediaQuery.of(context).size;
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            width: mediaQuery.width / 7,
            height: mediaQuery.height / 14,
            decoration: BoxDecoration(
                color: textIconColorGray,
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: Icon(Icons.camera_alt),
          ),
          SizedBox(width: mediaQuery.width / 50),
          Expanded(
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: "Enter your name",
              ),
            ),
          ),
          SizedBox(width: mediaQuery.width / 50),
          Container(
            width: mediaQuery.width / 10,
            height: mediaQuery.height / 20,
            decoration: BoxDecoration(
                color: textIconColorGray,
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: Icon(Icons.insert_emoticon),
          )
        ],
      ),
    );
  }

  void _submitProfileInfo() {}
}
