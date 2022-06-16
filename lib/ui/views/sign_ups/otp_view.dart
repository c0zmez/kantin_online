import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kantin_online/constants/colors.dart';
import 'package:kantin_online/ui/shared/ui_helper.dart';
import 'package:kantin_online/ui/widgets/button_widget.dart';
import 'package:kantin_online/ui/widgets/textform/text_form_widget.dart';
import 'package:kantin_online/viewmodels/otp_view_model.dart';
import 'package:stacked/stacked.dart';

class OtpView extends StatefulWidget {
  const OtpView({Key? key}) : super(key: key);

  @override
  _OtpViewState createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OtpViewModel>.reactive(
      viewModelBuilder: () => OtpViewModel(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  verticalSpaceMassive,
                  verticalSpaceMedium,
                  Container(
                    width: MediaQuery.of(context).size.width*0.8,
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.8,
                          child: Text(
                            'Aktifkan Akun Anda',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 25.0,
                              fontFamily: 'Poppins',
                              color: colorRed,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.8,
                          child: Text(
                            'Periksa email anda untuk mendapatkan kode OTP',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17.0,
                                fontFamily: 'Poppins'
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.8,
                    child: Column(
                      children: [
                        TextFormWidget(
                            hintText: 'Email',
                            controller: model.emailController,
                            keyboardType: TextInputType.emailAddress
                        ),
                        verticalSpaceSmall,
                        TextFormWidget(
                            hintText: 'Kode OTP',
                            controller: model.otpController,
                            keyboardType: TextInputType.text
                        ),
                        verticalSpaceMedium,
                        ButtonWidget(
                            title: 'Aktifkan',
                            onTapFunction: (){
                              model.replaceToLoginView();
                            },
                            bgColor: colorRed,
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 60,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
