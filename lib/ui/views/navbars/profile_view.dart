import 'package:flutter/material.dart';
import 'package:kantin_online/constants/colors.dart';
import 'package:kantin_online/ui/shared/ui_helper.dart';
import 'package:kantin_online/ui/views/change_password_view.dart';
import 'package:kantin_online/ui/views/login_view.dart';
import 'package:kantin_online/ui/widgets/button_widget.dart';
import 'package:kantin_online/ui/widgets/textform/text_field.dart';
import 'package:kantin_online/viewmodels/profile_view_model.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
        viewModelBuilder: () => ProfileViewModel(),
    builder: (context, model, child) => Scaffold(
      backgroundColor: colorWhite,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 2,
        toolbarHeight: MediaQuery.of(context).size.height*0.1,
        backgroundColor: colorRed,
        title: Container(
          padding: const EdgeInsets.only(),
          child: const Text(
            'Profile',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, fontFamily: 'Poppins'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30, right: 20, left: 20),
              height: 130,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: colorRed,
                    blurRadius: 2,
                    offset: Offset(7,7)
                  )
                ]
              ),
              child: Column(
                children: <Widget>[
                  Card(
                      elevation: 3,
                      child: Container(
                        height: 120,
                        width: double.maxFinite,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(7),
                          child: Column(
                            children: const <Widget>[
                              CircleAvatar(
                                radius: 35,
                                backgroundImage: AssetImage('assets/avatar.png'),
                                backgroundColor: colorWhite,
                              ),
                              Text(
                                'Shiro God',
                                style: TextStyle(
                                  fontSize: 21
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                 ],
                ),
              ),
            Container(
              margin: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                children: [
                  verticalSpaceMedium,
                  const WidgetTextField(
                    labelText: 'Username',
                    placeHolder: 'Shiro God',
                  ),
                  const WidgetTextField(
                    labelText: 'No Telepon',
                    placeHolder: '0000-0000-0000',
                  ),
                  const WidgetTextField(
                    labelText: 'Email',
                    placeHolder: 'acumalaka@gmail.com',
                  ),
                  verticalSpaceMedium,
                  Center(
                    child: Ink(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: colorRed)
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePassword()));
                        },
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          child: const Text(
                            'Ubah Sandi',
                            style: TextStyle(color: colorRed, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  verticalSpaceMedium,
                  ButtonWidget(
                    title: 'Keluar',
                    onTapFunction: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginView()));
                    },
                    bgColor: colorRed,
                    height: 45,
                    width: 120,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      ));
    }
}
