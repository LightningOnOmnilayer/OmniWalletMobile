/// Wallet Addresses List page.
/// [author] Kevin Zhang
/// [time] 2019-4-25

import 'package:flutter/material.dart';
import 'package:wallet_app/l10n/WalletLocalizations.dart';
import 'package:wallet_app/tools/app_data_setting.dart';
import 'package:wallet_app/view/main_view/address_manage.dart';
import 'package:wallet_app/view_model/state_lib.dart';

class WalletAddress extends StatefulWidget {
  static String tag = "WalletAddress";

  @override
  _WalletAddressState createState() => _WalletAddressState();
}

class _WalletAddressState extends State<WalletAddress> {

  List<WalletInfo> _walletInfoes;
  MainStateModel stateModel = null;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(WalletLocalizations.of(context).walletAddressPageAppBarTitle),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 10),
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: _addressList(),
          ),
        ),
      ),
    );
  }

  /// wallet address list
  List<Widget> _addressList() {

    if (stateModel == null) {
      stateModel = MainStateModel().of(context);
      _walletInfoes = stateModel.walletInfoes;
    }
    print('==> address amount = ${_walletInfoes.length}');

    // list tile
    List<Widget> _list = List();

    // title
    _list.add(_listTitle());

    for (int i = 0; i < _walletInfoes.length; i++) {
      _list.add(_menuItem(_walletInfoes[i]));
      _list.add(Divider(height: 0, indent: 15));
    }

    return _list;
  }

  ///
  Widget _listTitle() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        WalletLocalizations.of(context).walletAddressPageListTitle
      ),
    );
  }

  ///
  Widget _menuItem(WalletInfo walletData) {
    return Ink(
      color: AppCustomColor.themeBackgroudColor,
      child: ListTile(
        title: Text(walletData.name),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              walletData.address.replaceRange(6, walletData.address.length - 6, '...'),
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(width: 15),
            Icon(Icons.keyboard_arrow_right),
          ],
        ),

        // onTap: () { Navigator.of(context).pushNamed(AddressManage.tag); },
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddressManage(data: walletData),
            ),
          );
        },
      ),
    );
  }
}