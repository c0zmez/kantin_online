import 'package:flutter/cupertino.dart';
import 'package:kantin_online/constants/route_name.dart';
import 'package:kantin_online/services/navigation_service.dart';
import 'package:kantin_online/viewmodels/base_model.dart';

import '../locator.dart';

class OtpViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  void replaceToLoginView() {
    _navigationService.replaceTo(loginViewRoute);
  }

}