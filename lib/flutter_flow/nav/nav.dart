import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';

import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) => appStateNotifier.showSplashImage
          ? Builder(
              builder: (context) => Container(
                color: Colors.transparent,
                child: Image.asset(
                  'assets/images/Splash2.gif',
                  fit: BoxFit.cover,
                ),
              ),
            )
          : HomePageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.showSplashImage
              ? Builder(
                  builder: (context) => Container(
                    color: Colors.transparent,
                    child: Image.asset(
                      'assets/images/Splash2.gif',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : HomePageWidget(),
          routes: [
            FFRoute(
              name: 'HomePage',
              path: 'homePage',
              builder: (context, params) => HomePageWidget(),
            ),
            FFRoute(
              name: 'Login',
              path: 'login',
              builder: (context, params) => LoginWidget(),
            ),
            FFRoute(
              name: 'Register_Step0',
              path: 'registerStep0',
              builder: (context, params) => RegisterStep0Widget(),
            ),
            FFRoute(
              name: 'Professional1',
              path: 'professional1',
              builder: (context, params) => Professional1Widget(),
            ),
            FFRoute(
              name: 'RegisterCar_method',
              path: 'registerCarMethod',
              builder: (context, params) => RegisterCarMethodWidget(),
            ),
            FFRoute(
              name: 'Professional2',
              path: 'professional2',
              builder: (context, params) => Professional2Widget(
                country: params.getParam('country', ParamType.String),
                town: params.getParam('town', ParamType.String),
                postcode: params.getParam('postcode', ParamType.String),
                uid: params.getParam('uid', ParamType.String),
                company: params.getParam('company', ParamType.String),
                street: params.getParam('street', ParamType.String),
                countryPhoneCode:
                    params.getParam('countryPhoneCode', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'RegisterCar_step1',
              path: 'registerCarStep1',
              builder: (context, params) => RegisterCarStep1Widget(
                automaticRegister:
                    params.getParam('automaticRegister', ParamType.JSON),
                modelNumber: params.getParam('modelNumber', ParamType.String),
                firstRegistration:
                    params.getParam('firstRegistration', ParamType.DateTime),
                editRegister: params.getParam('editRegister', ParamType.JSON),
                withBack: params.getParam('withBack', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'RegisterCar_step2',
              path: 'registerCarStep2',
              builder: (context, params) => RegisterCarStep2Widget(
                modelNumber: params.getParam('modelNumber', ParamType.String),
                firstRegistration:
                    params.getParam('firstRegistration', ParamType.DateTime),
                editRegister: params.getParam('editRegister', ParamType.JSON),
                withBack: params.getParam('withBack', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'RegisterCar_step3',
              path: 'registerCarStep3',
              builder: (context, params) => RegisterCarStep3Widget(
                isDamaged: params.getParam('isDamaged', ParamType.bool),
                isDocsAvailable:
                    params.getParam('isDocsAvailable', ParamType.bool),
                withBack: params.getParam('withBack', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'RegisterCar_step4',
              path: 'registerCarStep4',
              builder: (context, params) => RegisterCarStep4Widget(
                editRegister: params.getParam('editRegister', ParamType.JSON),
                withBack: params.getParam('withBack', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'WidgetsList',
              path: 'widgetsList',
              builder: (context, params) => WidgetsListWidget(),
            ),
            FFRoute(
              name: 'Preview',
              path: 'detailpage',
              builder: (context, params) => PreviewWidget(),
            ),
            FFRoute(
              name: 'VehiclesInAuction',
              path: 'vehiclesInAuction',
              builder: (context, params) => VehiclesInAuctionWidget(),
            ),
            FFRoute(
              name: 'VehiclesInGarage',
              path: 'vehiclesInGarage',
              builder: (context, params) => VehiclesInGarageWidget(),
            ),
            FFRoute(
              name: 'VehiclesSold',
              path: 'vehiclesSold',
              builder: (context, params) => VehiclesSoldWidget(),
            ),
            FFRoute(
              name: 'VehiclesFavourites',
              path: 'vehiclesFavourites',
              builder: (context, params) => VehiclesFavouritesWidget(),
            ),
            FFRoute(
              name: 'VehiclesPurchased',
              path: 'vehiclesPurchased',
              builder: (context, params) => VehiclesPurchasedWidget(),
            ),
            FFRoute(
              name: 'TermsConditions',
              path: 'termsConditions',
              builder: (context, params) => TermsConditionsWidget(),
            ),
            FFRoute(
              name: 'PrivacyPolicy',
              path: 'privacyPolicy',
              builder: (context, params) => PrivacyPolicyWidget(),
            ),
            FFRoute(
              name: 'Private1',
              path: 'private1',
              builder: (context, params) => Private1Widget(),
            ),
            FFRoute(
              name: 'Private2',
              path: 'private2',
              builder: (context, params) => Private2Widget(
                country: params.getParam('country', ParamType.String),
                town: params.getParam('town', ParamType.String),
                postcode: params.getParam('postcode', ParamType.String),
                street: params.getParam('street', ParamType.String),
                salutation: params.getParam('salutation', ParamType.String),
                firstName: params.getParam('firstName', ParamType.String),
                lastName: params.getParam('lastName', ParamType.String),
                countryPhoneCode:
                    params.getParam('countryPhoneCode', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Register_step3',
              path: 'registerStep3',
              builder: (context, params) => RegisterStep3Widget(
                salutation: params.getParam('salutation', ParamType.String),
                firstName: params.getParam('firstName', ParamType.String),
                lastName: params.getParam('lastName', ParamType.String),
                email: params.getParam('email', ParamType.String),
                telephone: params.getParam('telephone', ParamType.String),
                mobile: params.getParam('mobile', ParamType.String),
                country: params.getParam('country', ParamType.String),
                town: params.getParam('town', ParamType.String),
                postCode: params.getParam('postCode', ParamType.String),
                poBox: params.getParam('poBox', ParamType.String),
                uid: params.getParam('uid', ParamType.String),
                company: params.getParam('company', ParamType.String),
                street: params.getParam('street', ParamType.String),
                language: params.getParam('language', ParamType.int),
                isCommercial: params.getParam('isCommercial', ParamType.bool),
                jobRole: params.getParam('jobRole', ParamType.String),
                findUs: params.getParam('findUs', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'Success',
              path: 'success',
              builder: (context, params) => SuccessWidget(
                modelNumber: params.getParam('modelNumber', ParamType.String),
                firstRegistration:
                    params.getParam('firstRegistration', ParamType.DateTime),
                editRegister: params.getParam('editRegister', ParamType.JSON),
              ),
            ),
            FFRoute(
              name: 'Account',
              path: 'account',
              builder: (context, params) => AccountWidget(),
            ),
            FFRoute(
              name: 'AddSub-User',
              path: 'addSubUser',
              builder: (context, params) => AddSubUserWidget(),
            ),
            FFRoute(
              name: 'Sub-userListing',
              path: 'subUserListing',
              builder: (context, params) => SubUserListingWidget(),
            ),
            FFRoute(
              name: 'ActiveAuctions',
              path: 'activeAuctions',
              builder: (context, params) => ActiveAuctionsWidget(),
            ),
            FFRoute(
              name: 'VehicleDetail',
              path: 'vehicleDetail',
              builder: (context, params) => VehicleDetailWidget(
                vehicleId: params.getParam('vehicleId', ParamType.String),
                auctionId: params.getParam('auctionId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Pagetest',
              path: 'pagetest',
              builder: (context, params) => PagetestWidget(
                imgPosition: params.getParam('imgPosition', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'PagetestDamage',
              path: 'pagetestDamage',
              builder: (context, params) => PagetestDamageWidget(
                imgPosition: params.getParam('imgPosition', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'VehicleDetailMobile',
              path: 'vehicleDetailMobile',
              builder: (context, params) => VehicleDetailMobileWidget(
                vehicleId: params.getParam('vehicleId', ParamType.String),
                auctionId: params.getParam('auctionId', ParamType.String),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      urlPathStrategy: UrlPathStrategy.path,
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (GoRouter.of(this).routerDelegate.matches.length <= 1) {
      go('/');
    } else {
      pop();
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
