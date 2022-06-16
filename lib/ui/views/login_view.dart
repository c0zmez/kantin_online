import 'package:flutter/material.dart';
import 'package:kantin_online/constants/colors.dart';
import 'package:kantin_online/ui/shared/ui_helper.dart';
import 'package:kantin_online/ui/widgets/button_widget.dart';
import 'package:kantin_online/ui/widgets/textform/text_form_password_widget.dart';
import 'package:kantin_online/ui/widgets/textform/text_form_widget.dart';
import 'package:kantin_online/viewmodels/login_view_model.dart';
import 'package:stacked/stacked.dart';


class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  verticalSpaceMassive,
                  Image.asset(
                    './assets/logo.png',
                    width: 168,
                    height: 168,
                  ),
                  verticalSpaceSmall,
                  const Text(
                    'Masuk',
                    style: TextStyle(
                        fontSize: 39,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins'
                    ),
                  ),
                  verticalSpaceSmall,
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: const EdgeInsets.all(20),
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        TextFormWidget(
                            hintText: 'Email',
                            controller: model.emailController,
                            keyboardType: TextInputType.emailAddress),
                        verticalSpaceSmall,
                        //Input Password
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
                        verticalSpaceMedium,
                        ButtonWidget(
                            title: 'Masuk',
                            onTapFunction: () {
                              model.replaceToDashboardView();
                            },
                            bgColor: colorRed,
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 60,
                        ),
                        verticalSpaceSmall,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Tidak punya akun? ', style: TextStyle(
                                fontSize: 15
                            )),
                            InkWell(
                              onTap: (){
                                model.navigateToSignUpView();
                              },
                              child: const Text('Daftar',
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
        )));
  }
}
