import 'package:flutter/material.dart';
import 'package:kantin_online/constants/colors.dart';
import 'package:kantin_online/ui/shared/ui_helper.dart';
import 'package:kantin_online/ui/widgets/button_widget.dart';
import 'package:kantin_online/viewmodels/change_password_view_model.dart';
import 'package:stacked/stacked.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  get passController => null;

  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChangePasswordViewModel>.reactive(
        viewModelBuilder: () => ChangePasswordViewModel(),
    builder: (context, model, child) => Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 75, bottom: 20, left: 10, right: 10),
                  child: Text(
                    'Ubah Kata Sandi',
                    style: TextStyle(
                        color: colorRed,
                        fontWeight: FontWeight.bold,
                        fontSize: 30
                    ),
                  ),
                ),
                verticalSpaceMedium,
                TextFormField(
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(color: colorGrey),
                    border: const OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(width: 2)),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                        color: colorRed,
                        width: 2,
                      ),
                    ),
                    hintText: "Masukkan Sandi Lama",
                    suffixIcon: IconButton(
                      onPressed: _toggle,
                      icon: Icon(
                        _obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: colorGrey,
                      ),
                    ),
                  ),
                  controller: passController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _obscureText,
                ),
                verticalSpaceMedium,
                TextFormField(
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(color: colorGrey),
                    border: const OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(width: 2)),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                        color: colorRed,
                        width: 2,
                      ),
                    ),
                    hintText: "Masukkan Sandi Baru",
                    suffixIcon: IconButton(
                      onPressed: _toggle,
                      icon: Icon(
                        _obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: colorGrey,
                      ),
                    ),
                  ),
                  controller: passController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _obscureText,
                ),
                verticalSpaceMedium,
                TextFormField(
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(color: colorGrey),
                    border: const OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(width: 2)),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                        color: colorRed,
                        width: 2,
                      ),
                    ),
                    hintText: "Konfirmasi Sandi Baru",
                    suffixIcon: IconButton(
                      onPressed: _toggle,
                      icon: Icon(
                        _obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: colorGrey,
                      ),
                    ),
                  ),
                  controller: passController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _obscureText,
                ),
                verticalSpaceLarge,
                ButtonWidget(
                    title: "Ubah Sandi",
                    onTapFunction: (){},
                    bgColor: colorRed,
                    height: 50,
                    width: 300,
                ),
              ],
            ),
          ),
        ),
      )
    ));
  }
}
