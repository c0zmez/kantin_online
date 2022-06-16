import 'package:flutter/material.dart';
import 'package:kantin_online/constants/colors.dart';
import 'package:kantin_online/ui/shared/ui_helper.dart';
import 'package:kantin_online/ui/widgets/button_widget.dart';
import 'package:kantin_online/ui/widgets/textform/text_form_password_widget.dart';
import 'package:kantin_online/ui/widgets/textform/text_form_widget.dart';
import 'package:kantin_online/viewmodels/sign_up_view_model.dart';
import 'package:stacked/stacked.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
            elevation: 1,
            toolbarHeight: MediaQuery.of(context).size.height*0.1,
            backgroundColor: colorRed,
            title: Container(
                padding: const EdgeInsets.only(top: 25, bottom: 25),
                child: const Text(
                  'Kantin Online',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, fontFamily: 'Poppins'),
                ))),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  verticalSpaceLarge,
                  const Text('Daftar', style: TextStyle(
                      fontSize: 39,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins'
                  ),),
                  Container(
                    width: MediaQuery.of(context).size.width*0.8,
                    margin: const EdgeInsets.all(20),
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        TextFormWidget(
                          hintText: 'Nama',
                          controller: model.nameController,
                          keyboardType: TextInputType.text,
                        ),
                        verticalSpaceSmall,
                        TextFormWidget(
                            hintText: 'Email',
                            controller: model.emailController,
                            keyboardType: TextInputType.emailAddress
                        ),
                        verticalSpaceSmall,
                        TextFormPassword(
                            hintText: 'Password',
                            controller: model.passController,
                            suffixIcon: IconButton(
                              onPressed: _toggle,
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: colorGrey,
                              ),
                            ),
                            obscureText: _obscureText,
                        ),
                        verticalSpaceSmall,
                        TextFormPassword(
                          hintText:  'Konfirmasi Password',
                          controller: model.confirmPassController,
                          suffixIcon: IconButton(
                            onPressed: _toggle,
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: colorGrey,
                            ),
                          ),
                          obscureText: _obscureText,
                        ),
                        verticalSpaceSmall,
                        TextFormWidget(
                            hintText: 'No Telepon',
                            controller: model.tlpController,
                            keyboardType: TextInputType.phone
                        ),
                        verticalSpaceMedium,
                        ButtonWidget(
                            title: 'Daftar',
                            onTapFunction: (){
                              model.navigateToOtpView();
                            },
                            bgColor: colorRed,
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 60,
                        ),
                        verticalSpaceSmall,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Sudah punya akun? ', style: TextStyle(
                                fontSize: 15
                            )),
                            InkWell(
                              onTap: (){
                                model.replaceToLoginView();
                              },
                              child: const Text('Masuk',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none,
                                  color: colorRed,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}
