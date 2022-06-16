import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:kantin_online/constants/colors.dart';
import 'package:kantin_online/ui/shared/ui_helper.dart';
import 'package:kantin_online/viewmodels/startup_view_model.dart';
import 'package:stacked/stacked.dart';


class StartUpView extends StatelessWidget {
  const StartUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Lock Orientation Portait Only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return ViewModelBuilder<StartUpViewModel>.reactive(
      viewModelBuilder: () => StartUpViewModel(),
      onModelReady: (model) {
        model.startTimer();
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    verticalSpaceMassive,
                    Image.asset(
                      './assets/logo.png',
                      width: 200,
                    ),
                    verticalSpaceMedium,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Kantin',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w400,
                            color: colorRed,
                            fontFamily: 'Poppins'
                          ),
                        ),
                        horizontalSpaceTiny,
                        Text(
                          'Online',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins'
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                verticalSpaceMedium,
                Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: colorRed,
                    valueColor:
                    AlwaysStoppedAnimation<Color>(colorRed),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
