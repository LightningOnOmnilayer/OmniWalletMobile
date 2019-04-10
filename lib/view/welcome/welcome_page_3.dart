import 'package:flutter/material.dart';
import 'package:wallet_app/l10n/WalletLocalizations.dart';
import 'package:wallet_app/tools/Tools.dart';
import 'package:wallet_app/tools/app_data_setting.dart';
import 'package:wallet_app/view/welcome/start.dart';

class WelcomePageThree extends StatelessWidget {

  // Assets
  final String img_1 = 'assets/LunarX_Logo.jpg';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: Colors.transparent,
          // brightness: Theme.of(context).brightness == 
          //   Brightness.dark ? Brightness.light : Brightness.dark,
        ),
        preferredSize: Size.fromHeight(0),
      ),

      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          children: <Widget>[
            _childColumn(context),
          ],
        ),
      )
    );
  }

  // Child content.
  Widget _childColumn(BuildContext context) {
    return Column(
      children: <Widget>[
        // Title
        Text(
          WalletLocalizations.of(context).welcomePageThreeTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),

        // Introduction content.
        SizedBox(height: 30),
        Text(
          WalletLocalizations.of(context).welcomePageThreeContentOne,
          style: TextStyle(
            color: AppCustomColor.fontGreyColor,
            height: 1.3,
          ),
        ),

        // List content.
        SizedBox(height: 30),
        _listContent(Tools.imagePath('icon_wel5'), WalletLocalizations.of(context).welcomePageThreeContentTwo),

        SizedBox(height: 20),
        _listContent(Tools.imagePath('icon_wel6'), WalletLocalizations.of(context).welcomePageThreeContentThree),

        SizedBox(height: 20),
        _listContent(Tools.imagePath('icon_wel7'), WalletLocalizations.of(context).welcomePageThreeContentFour),

        SizedBox(height: 20),
        _listContent(Tools.imagePath('icon_wel8'), WalletLocalizations.of(context).welcomePageThreeContentFive),

        SizedBox(height: 20),
        _listContent(Tools.imagePath('icon_wel9'), WalletLocalizations.of(context).welcomePageThreeContentSix),

        SizedBox(height: 20),
        _listContent(Tools.imagePath('icon_wel10'), WalletLocalizations.of(context).welcomePageThreeContentSeven),

        SizedBox(height: 30),
        _bottomButton(context),
      ],
    );
  }

  //
  Widget _listContent(String img, String txt) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(img, width: 24, height: 28),
        SizedBox(width: 30),
        Expanded(
          child: Text(
            txt,
            style: TextStyle(
              color: AppCustomColor.fontGreyColor,
              height: 1.3,
            ),
          ),
        ),
      ],
    );
  }

  // Buttons
  Widget _bottomButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        // Back button.
        RaisedButton(
          child: Text(WalletLocalizations.of(context).welcomePageThreeButtonBack),
          onPressed: () { Navigator.pop(context); },
        ),

        // Next button.
        RaisedButton(
          child: Text(WalletLocalizations.of(context).welcomePageThreeButtonNext),
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => StartPage()), 
              (route) => route == null
            );
          },
        ),
      ],
    );
  }
}