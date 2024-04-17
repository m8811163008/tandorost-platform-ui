import 'dart:async';
import 'dart:developer';

import 'package:domain_model/domain_model.dart';
import 'package:flutter_poolakey/flutter_poolakey.dart';

class AuthStorage {
  final LocalStorage _localStorage;
  Set<UnitOfMeasurmentCM> unitOfMeasurementCache = const {};
  AuthStorage(this._localStorage);

  Future<void> removeFood(FoodCM food) async {
    final foodBox = await _localStorage.foodBox;
    await foodBox.delete(food.name);
  }

  void connect() async {
    try {
      await FlutterPoolakey.connect(
          'MIHNMA0GCSqGSIb3DQEBAQUAA4G7ADCBtwKBrwCwLDDM7i/GpIyayl2UW/b9V0Bi5c5WEfGrkid/Arvz4hAxG6+XAnsmRpT2xkXKAdoXICXLnjuV2b9/DVl4zhbEOaaZ2T8qC+3+DerlMhSKTC36OTTpdsbKbSPaDwiJL3PIvwipJonZTyJxkaOtSu4YZWqVaKgKpM75DEtZlBh0/XcgwQIHrP/l8T905uUtvhR3mmeEzTi3IbWEBDwHVRWsueHhdADP5HIdsgBkSGcCAwEAAQ==',
          onDisconnected: () {
        /*reconnect here*/
      });
    } catch (e, s) {
      log('e', error: e, stackTrace: s);
    }
  }

  void purchase() async {
    try {
      PurchaseInfo purchaseInfo = await FlutterPoolakey.purchase('123456',
          payload: 'DEVELOPER_PAYLOAD');
    } catch (e) {
      // handle unauthorized
    }
  }

  void getAllSubscribedProducts() async {
    try {
      List<PurchaseInfo> purchasedProductsList =
          await FlutterPoolakey.getAllSubscribedProducts();
    } catch (e) {
      // handle unauthorized
    }
  }

  void getInAppSkuDetails() async {
    final List<SkuDetails> result =
        await FlutterPoolakey.getInAppSkuDetails(['123456', 'product123']);
  }
}
