import 'dart:async';
import 'dart:convert';

import 'package:auth_repository/auth_repository.dart';
import 'package:auth_repository/src/auth_storage.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter_poolakey/flutter_poolakey.dart';
import 'package:rxdart/rxdart.dart';

class AuthRepostiory {
  AuthRepostiory(LocalStorage localStorage);

  final BehaviorSubject<Set<UserRule>> _currentUserRulesController =
      BehaviorSubject();

  Stream<Set<UserRule>> currentUserRulesStream() async* {
    await getAllSubscribedProducts();

    yield* _currentUserRulesController.stream.asBroadcastStream();
  }

  Future<void> dispose() async => _currentUserRulesController.close;

  /// Active subscriptions of the client.
  ///
  /// It return BazzarQueryException and
  Future<void> getAllSubscribedProducts() async {
    await connectBazzar();

    final subscriptionsHistory =
        await FlutterPoolakey.getAllSubscribedProducts();

    if (subscriptionsHistory.isEmpty) {
      if (_currentUserRulesController.hasValue) {
        Set<UserRule> rules = _currentUserRulesController.value;
        rules.removeWhere((element) => element == UserRule.foodTracker);
        _currentUserRulesController.add(rules);
      } else {
        _currentUserRulesController.add({UserRule.foodTracker});
      }
    } else {
      // check user has active subscription?
      final purchasedSubscription = subscriptionsHistory
          .where((element) => element.purchaseState == PurchaseState.PURCHASED);

      final activeSubscriptions = purchasedSubscription.where((element) {
        final subscriptionPlanDuration =
            element.purchasePayload.subscriptionPlan.durationInDays;
        final purchaseDate =
            DateTime.fromMillisecondsSinceEpoch(element.purchaseTime);
        final expireDate =
            purchaseDate.add(Duration(days: subscriptionPlanDuration));
        return DateTime.now().isBefore(expireDate);
      });

      if (activeSubscriptions.isNotEmpty) {
        if (_currentUserRulesController.hasValue) {
          Set<UserRule> rules = _currentUserRulesController.value;
          rules.add(UserRule.dieter);
          _currentUserRulesController.add(rules);
        } else {
          _currentUserRulesController.add(
            {UserRule.foodTracker, UserRule.dieter},
          );
        }
      }
    }
  }

  /// Connects to bazzar.
  ///
  Future<void> connectBazzar() async {
    try {
      final isConnectionSuccess = await FlutterPoolakey.connect(
        'MIHNMA0GCSqGSIb3DQEBAQUAA4G7ADCBtwKBrwCwLDDM7i/GpIyayl2UW/b9V0Bi5c5WEfGrkid/Arvz4hAxG6+XAnsmRpT2xkXKAdoXICXLnjuV2b9/DVl4zhbEOaaZ2T8qC+3+DerlMhSKTC36OTTpdsbKbSPaDwiJL3PIvwipJonZTyJxkaOtSu4YZWqVaKgKpM75DEtZlBh0/XcgwQIHrP/l8T905uUtvhR3mmeEzTi3IbWEBDwHVRWsueHhdADP5HIdsgBkSGcCAwEAAQ==',
        onDisconnected: () {
          // print('disconnect');
          // todo : check when this method invoke onDisconnected
          // TODO handle to clear current user paid user
        },
      );
      if (!isConnectionSuccess) {
        throw AuthException();
      }
    } catch (e) {
      if (e is PlatformException) {
        if (e.code == 'CONNECTION_HAS_FAILED') {
          throw NotInstalledException();
        } else if (e.code == 'PURCHASE_CANCELLED') {
          throw UserCancledException();
        }
      }
      rethrow;
    }
  }

  Future<void> subscribe() async {
    try {
      PurchaseInfo purchaseInfo =
          await FlutterPoolakey.subscribe('654321', payload: 'this is payload');
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

  Future<List<SkuDetails>> getSubscriptionSkuDetails() async {
    try {
      List<SkuDetails> purchasedProductsList =
          await FlutterPoolakey.getSubscriptionSkuDetails(['123456', '654321']);
      return purchasedProductsList;
    } catch (e) {
      if (e is PlatformException) {
        if (e.code == 'PURCHASE_CANCELLED') {
          // cancled
        }
      }
      rethrow;
    }
  }
}

extension on PurchaseInfo {
  PurchasePayload get purchasePayload {
    return PurchasePayload.fromJson(jsonDecode(payload));
  }
}
