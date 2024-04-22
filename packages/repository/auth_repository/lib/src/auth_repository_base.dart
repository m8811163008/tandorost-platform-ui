import 'dart:async';

import 'package:auth_repository/src/auth_storage.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter_poolakey/flutter_poolakey.dart';

class AuthRepostiory {
  final AuthStorage _foodStorage;

  AuthRepostiory(LocalStorage localStorage)
      : _foodStorage = AuthStorage(localStorage);

  Future<bool> connectBazzar() async {
    return FlutterPoolakey.connect(
      'MIHNMA0GCSqGSIb3DQEBAQUAA4G7ADCBtwKBrwCwLDDM7i/GpIyayl2UW/b9V0Bi5c5WEfGrkid/Arvz4hAxG6+XAnsmRpT2xkXKAdoXICXLnjuV2b9/DVl4zhbEOaaZ2T8qC+3+DerlMhSKTC36OTTpdsbKbSPaDwiJL3PIvwipJonZTyJxkaOtSu4YZWqVaKgKpM75DEtZlBh0/XcgwQIHrP/l8T905uUtvhR3mmeEzTi3IbWEBDwHVRWsueHhdADP5HIdsgBkSGcCAwEAAQ==',
      onDisconnected: () {
        print('disconnect');
        /*reconnect here*/
      },
    );
  }

  Future<void> subscribe() async {
    try {
      PurchaseInfo purchaseInfo =
          await FlutterPoolakey.subscribe('123456', payload: 'this is payload');
      // PlatformException (PlatformException(PURCHASE_CANCELLED, Purchase flow has been canceled, null, null))
      print(purchaseInfo);
    } catch (e) {
      if (e is PlatformException) {
        if (e.code == 'PURCHASE_CANCELLED') {
          // cancled
        }
      }
    }
  }
// void fetchpurchasedProductsList
// void List<PurchaseInfo> purchasedProductsList= await FlutterPoolakey.getAllPurchasedProducts()
}
