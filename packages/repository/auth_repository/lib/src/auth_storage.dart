import 'dart:async';
import 'dart:developer';

import 'package:domain_model/domain_model.dart';
import 'package:flutter_poolakey/flutter_poolakey.dart';

class AuthStorage {
  final LocalStorage _localStorage;
  Set<UnitOfMeasurmentCM> unitOfMeasurementCache = const {};
  AuthStorage(this._localStorage);



  Future<void> connect() async {
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

  // https://pub.dev/packages/cafebazaar_auth
  //شناسه تیکت  
  // 3322254
  // ورود با بازار و حافظه‌ی درون برنامه‌ای
  // BazaarAccount? account = await CafeBazaarAuth.signIn();

  //بررسی وضعیت ورود کاربر
//این امکان از نسخه ۶.۵ به بعد بازار در دسترس است
//Login Checker
//String? savedData = await CafeBazaarAuth.saveData(DietInfo.toJson());

// ارجاع به صفحه Login بازار
// Open login page

//API نظرات بازار
//ارجاع به صفحه نظرات
//Open comment form


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



// ارجاع به برنامه‌ توسعه‌دهنده
// Open application detail page


//بررسی به‌روزبودن برنامه
//بروز بودن برنامه روی گوشی کاربران به حفظ ثبات و امنیت  برنامه شما کمک می‌‌کند و این امکان را فراهم می‌‌آورد تا کاربران به جدیدترین قابلیت‌های برنامه شما دسترسی پیدا کنند
//Update Checker




