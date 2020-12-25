import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:says_app/presentation/pages/phone_verification_page.dart';
import 'package:says_app/presentation/utilities/style.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  static Country _selectedFilteredDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode("92");
  String _countryCode = _selectedFilteredDialogCountry.phoneCode;
  String _phoneNumber = "";

  TextEditingController _phoneAuthController = TextEditingController();

  @override
  void dispose() {
    _phoneAuthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            margin: EdgeInsets.symmetric(
                horizontal: mediaQuery.width / 30,
                vertical: mediaQuery.height/ 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(''),
                    Text(
                      'Verifikasi nomor telepon anda',
                      style: TextStyle(
                          fontSize: mediaQuery.width / 20,
                          color: greenColor,
                          fontWeight: FontWeight.w500),
                    ),
                    Icon(Icons.more_vert),
                  ],
                ),
                SizedBox(height: mediaQuery.height / 30),
                Text(
                    'Says App akan mengirimkan pesan SMS, untuk memverifikasi nomor telepon anda',
                    style: TextStyle(
                        fontSize: mediaQuery.width / 20)),
                SizedBox(height: mediaQuery.height / 30),
                ListTile(
                  onTap: _openFilteredCountryPickerDialog,
                  title: _buildDialogItem(_selectedFilteredDialogCountry),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        width: 1.50,
                        color: greenColor,
                      ))),
                      width: mediaQuery.width / 6,
                      height: mediaQuery.height / 15,
                      alignment: Alignment.center,
                      child:
                          Text("${_selectedFilteredDialogCountry.phoneCode}"),
                    ),
                    SizedBox(width: mediaQuery.height / 50),
                    Expanded(
                      child: Container(
                        height: mediaQuery.height / 15,
                        child: TextField(
                          controller: _phoneAuthController,
                          decoration: InputDecoration(hintText: "Phone Number"),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: MaterialButton(
                      color: greenColor,
                      onPressed: () {
                        Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PhoneVerificationPage(),
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
            )));
  }

  //membuka modal dialog code telepon
  void _openFilteredCountryPickerDialog() {
    showDialog(
        context: context,
        builder: (_) => Theme(
              data: Theme.of(context).copyWith(
                primaryColor: primaryColor,
              ),
              child: CountryPickerDialog(
                titlePadding: EdgeInsets.all(8.0),
                searchCursorColor: Colors.black,
                searchInputDecoration: InputDecoration(
                  hintText: "Search",
                ),
                isSearchable: true,
                title: Text("Select your phone code"),
                onValuePicked: (Country country) {
                  //pencarian code telepon ( onchange )
                  setState(() {
                    _selectedFilteredDialogCountry = country;
                    _countryCode = country.phoneCode;
                  });
                },
                itemBuilder: _buildDialogItem,
              ),
            ));
  }

  //card dari tiap2 code telepon
  Widget _buildDialogItem(Country country) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: greenColor, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          SizedBox(
            width: MediaQuery.of(context).size.width / 40,
          ),
          Text("+${country.phoneCode}"),
          SizedBox(
            width: MediaQuery.of(context).size.width / 40,
          ),
          Expanded(
              child: Text("${country.name}", overflow: TextOverflow.ellipsis)),
          Icon(Icons.arrow_drop_down)
        ],
      ),
    );
  }

  void _submitVerifyPhoneNumber() {
    if (_phoneAuthController.text.isNotEmpty) {
      _phoneNumber = "+$_countryCode${_phoneAuthController.text}";
    }
  }
}
