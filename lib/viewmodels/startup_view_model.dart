import 'dart:async';

import 'package:kantin_online/constants/route_name.dart';
import 'package:kantin_online/services/navigation_service.dart';

import '../locator.dart';
import 'base_model.dart';

class StartUpViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();

  startTimer() async {
    var _duration = Duration(seconds: 5);
    return Timer(_duration, handleStartUpLogic);
  }

  Future handleStartUpLogic() async {
      _navigationService.replaceTo(loginViewRoute);
  }
}

