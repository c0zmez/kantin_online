import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kantin_online/constants/colors.dart';
import 'package:kantin_online/ui/shared/ui_helper.dart';
import 'package:kantin_online/ui/views/transactions/transaction_view.dart';
import 'package:kantin_online/ui/widgets/order_detail_widget.dart';
import 'package:kantin_online/ui/widgets/textform/text_form_widget.dart';
import 'package:kantin_online/viewmodels/check_view_model.dart';
import 'package:stacked/stacked.dart';

class CheckView extends StatefulWidget {
  const CheckView({Key? key}) : super(key: key);

  @override
  _CheckViewState createState() => _CheckViewState();
}

class _CheckViewState extends State<CheckView> {
  int? food;
  int? layanan;
  int? total;

  get nominalController => null;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CheckViewModel>.reactive(
        viewModelBuilder: () => CheckViewModel(),
    builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: Text(
            'Periksa',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
                color: colorRed),
          ),
          backgroundColor: colorWhite,
          elevation: 0,
        ),
        body: SafeArea(
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                children: <Widget>[
                  verticalSpaceMedium,
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: const Text(
                        'Pesanan Saya',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 18,
                            color: colorRed,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold),
                      )),
                  verticalSpaceTiny,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        padding: EdgeInsets.only(bottom: 4),
                        width: 115,
                        decoration: const BoxDecoration(
                            border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        )),
                        child: const Text(
                          'Subtotal Pesanan',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        )),
                  ),
                  Column(
                    children: [
                      verticalSpaceTiny,
                      OrderDetailWidget(
                          food: 'Ayam Goreng',
                          price: '24.000'
                      ),
                      OrderDetailWidget(
                          food: 'Kentang Goreng',
                          price: '15.000'
                      ),
                      OrderDetailWidget(
                          food: 'Air Mineral',
                          price: '5.000'
                      ),
                      OrderDetailWidget(
                          food: 'Booca',
                          price: '20.000'
                      ),
                      OrderDetailWidget(
                          food: 'Biaya Pelayanan',
                          price: '4.000'
                      ),
                    ],
                  ),
                  verticalSpaceSmall,
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Text(
                          'Total',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Text(
                          'Rp 68.000',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceMedium,
                  TextFormWidget(
                    hintText: 'Masukan Nominal',
                    controller: nominalController,
                    keyboardType: TextInputType.text,
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          height: 60,
          width: MediaQuery.of(context).size.width * 0.8,
          margin: const EdgeInsets.only(bottom: 15),
          child: FloatingActionButton.extended(
            elevation: 2,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TransactionView()));
            },
            label: const Text(
              'Bayar',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            backgroundColor: colorRed,
          ),
        )));
  }
}
