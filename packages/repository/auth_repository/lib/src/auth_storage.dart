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
      //dynamicPriceToken در کلاس PurchaseRequest استفاده کنید
      PurchaseInfo purchaseInfo = await FlutterPoolakey.purchase(
        '123456',
        payload: 'DEVELOPER_PAYLOAD',
        dynamicPriceToken: "",
      );
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
// Security notes
// In order to prevent phishing and information theft, use the following method to
// ensure that the correct version of Bazaar is available on the user device:
// BazaarClientProxy.isBazaarInstalledOnDevice(context)
// bool? isBazaarInstalled = CafeBazaarAuth.isBazaarInstalledOnDevice;

// BazaarClientProxy.showInstallBazaarView(context)
// if the Bazaar app is not installed, you can use following method:
// CafeBazaarAuth.showInstallBazaarView();

// If the Bazaar app is installed, you can use following method to check isNeedUpdate:
// BazaarClientProxy.isNeededToUpdateBazaar(context)
// CafeBazaarUpdateInfo? updateInfo = CafeBazaarAuth.isNeededToUpdateBazaar;
// print(updateInfo.needToUpdateForAuth);
// print(updateInfo.needToUpdateForStorage);

// In case an update for the Bazaar app is required, use the following method:
// CafeBazaarAuth.showUpdateBazaarView();

// In case an update for the Bazaar app is required, use the following method:
// BazaarClientProxy.showUpdateBazaarView(context)

//بررسی وضعیت ورود کاربر
//این امکان از نسخه ۶.۵ به بعد بازار در دسترس است
//Login Checker

// ارجاع به صفحه Login بازار
// Open login page



// ارجاع به برنامه‌ توسعه‌دهنده
// Open application detail page


//بررسی به‌روزبودن برنامه
//بروز بودن برنامه روی گوشی کاربران به حفظ ثبات و امنیت  برنامه شما کمک می‌‌کند و این امکان را فراهم می‌‌آورد تا کاربران به جدیدترین قابلیت‌های برنامه شما دسترسی پیدا کنند
//Update Checker

//API نظرات بازار
//ارجاع به صفحه نظرات
//Open comment form


