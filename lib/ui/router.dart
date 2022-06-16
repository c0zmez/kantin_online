import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kantin_online/constants/route_name.dart';
import 'package:kantin_online/ui/views/login_view.dart';
import 'package:kantin_online/ui/views/navbar_view.dart';
import 'package:kantin_online/ui/views/sign_ups/otp_view.dart';
import 'package:kantin_online/ui/views/sign_ups/sign_up_view.dart';
import 'package:kantin_online/ui/views/transactions/cart_view.dart';


Route<dynamic> generateRoute(RouteSettings settings){
  switch(settings.name) {
    case dashboardViewRoute:
      return _pageRoute(
          routeName: settings.name,
          viewToShow: NavbarView()
      );
    case loginViewRoute:
      return _pageRoute(
          routeName: settings.name,
          viewToShow: LoginView()
      );
      case signUpViewRoute:
      return _pageRoute(
          routeName: settings.name,
          viewToShow: SignUpView()
      );
    case otpViewRoute:
      return _pageRoute(
          routeName: settings.name,
          viewToShow: OtpView()
      );
    case cartViewRoute:
      return _pageRoute(
          routeName: settings.name,
          viewToShow: CartView()
      );


    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text(
              'No route defined for ${settings.name}',
            ),
          ),
        ),
      );
  }
}

PageRoute _pageRoute({String? routeName, required Widget viewToShow}) {
  return MaterialPageRoute(
      builder: (_) => viewToShow,
      settings: RouteSettings(
          name: routeName
      )
  );
}