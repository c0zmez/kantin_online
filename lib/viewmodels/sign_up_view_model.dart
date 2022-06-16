import 'package:flutter/cupertino.dart';
import 'package:kantin_online/constants/route_name.dart';
import 'package:kantin_online/services/navigation_service.dart';
import 'package:kantin_online/viewmodels/base_model.dart';

import '../locator.dart';

class SignUpViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController tlpController = TextEditingController();

  void navigateToOtpView() {
    _navigationService.navigateTo(otpViewRoute);
  }

  void replaceToLoginView() {
    _navigationService.replaceTo(loginViewRoute);
  }

}