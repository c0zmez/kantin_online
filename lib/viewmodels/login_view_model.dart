import 'package:flutter/cupertino.dart';
import 'package:kantin_online/constants/route_name.dart';
import 'package:kantin_online/services/navigation_service.dart';
import 'package:kantin_online/viewmodels/base_model.dart';

import '../locator.dart';

class LoginViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  void navigateToSignUpView() {
    _navigationService.navigateTo(signUpViewRoute);
  }

  void replaceToDashboardView() {
    _navigationService.replaceTo(dashboardViewRoute);
  }

}