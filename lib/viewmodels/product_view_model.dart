import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kantin_online/constants/route_name.dart';
import 'package:kantin_online/services/navigation_service.dart';
import 'package:kantin_online/viewmodels/base_model.dart';

import '../locator.dart';

class ProductViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();




  void navigateToCartView() {
    _navigationService.navigateTo(cartViewRoute);
  }


}

