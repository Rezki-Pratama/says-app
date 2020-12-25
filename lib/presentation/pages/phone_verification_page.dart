import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:says_app/presentation/pages/set_profile_page.dart';
import 'package:says_app/presentation/utilities/style.dart';

class PhoneVerificationPage extends StatefulWidget {
  final String phoneNumber;

  PhoneVerificationPage({Key key, this.phoneNumber}) : super(key: key);

  @override
  _PhoneVerificationPageState createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {
  String get _phoneNumber => widget.phoneNumber;
  TextEditingController _pinCodeController = TextEditingController();

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(""),
                Text(
                  "Verifikasi nomor telepon anda",
                  style: TextStyle(
                      fontSize: mediaQuery.width / 20,
                      color: greenColor,
                      fontWeight: FontWeight.w500),
                ),
                Icon(Icons.more_vert)
              ],
            ),
            SizedBox(
              height: mediaQuery.height / 20,
            ),
            Text(
                'Says App akan mengirimkan pesan SMS, untuk memverifikasi nomor telepon anda',
                style: TextStyle(fontSize: mediaQuery.width / 20)),
            _pinCodeWidget(),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  color: greenColor,
                  onPressed: () {
                        Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SetProfilePage(),
                      ));},
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

  Widget _pinCodeWidget() {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 10),
      child: Column(
        children: <Widget>[
          PinCodeTextField(
            controller: _pinCodeController,
            length: 6,
            backgroundColor: Colors.transparent,
            obsecureText: true,
            autoDisposeControllers: false,
            onChanged: (pinCode) {
              print(pinCode);
            },
          ),
          Text("Masukan 6 digit kode")
        ],
      ),
    );
  }

  void _submitSmsCode() {}
}
