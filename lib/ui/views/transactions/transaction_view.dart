import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kantin_online/constants/colors.dart';
import 'package:kantin_online/ui/shared/ui_helper.dart';
import 'package:kantin_online/ui/widgets/cardwidgets/transaction_card.dart';
import 'package:kantin_online/ui/widgets/order_detail_widget.dart';
import 'package:kantin_online/viewmodels/transaction_view_model.dart';
import 'package:stacked/stacked.dart';

class TransactionView extends StatefulWidget {
  const TransactionView({Key? key}) : super(key: key);

  @override
  _TransactionViewState createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TransactionViewModel>.reactive(
        viewModelBuilder: () => TransactionViewModel(),
    builder: (context, model, child) => Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: colorWhite),
        title: Text(
          'Transaksi',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins',
              color: colorWhite),
        ),
        backgroundColor: colorRed,
        elevation: 0,
      ),
      backgroundColor: colorRed,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.05,
              ),
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 70),
                    height: MediaQuery.of(context).size.height*0.8,
                    width: MediaQuery.of(context).size.width*1,
                    decoration: const BoxDecoration(
                      color: colorWhite,
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            // color: Colors.blueAccent
                          ),
                          height: 160,
                          child: Stack(
                            children: [
                              TransactionCard(
                                nameFood: 'Ayam Goreng',
                                price: 20000,
                                image: 'assets/chicken.png',
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.9,
                          child: Text('Detail Transaksi',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: colorRed
                          ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.9,
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
                        verticalSpaceTiny,
                        OrderDetailWidget(
                          food: 'Ayam Goreng 1x',
                          price: '24.000',
                        ),
                        OrderDetailWidget(
                          food: 'Kentang Goreng 1x',
                          price: '15.000',
                        ),
                        OrderDetailWidget(
                          food: 'Booca 1x',
                          price: '20.000',
                        ),
                        OrderDetailWidget(
                          food: 'Air Mineral 1x',
                          price: '5.000',
                        ),
                        OrderDetailWidget(
                          food: 'Biaya Pelayanan',
                          price: '4.000',
                        ),
                        verticalSpaceSmall,
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Row(
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
                        ),
                        verticalSpaceLarge,
                        Container(
                          width: MediaQuery.of(context).size.width*1,
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: colorGrey2,
                                width: 1,
                              ),
                              bottom: BorderSide(
                                color: colorGrey2,
                                width: 1,
                              ),
                            )
                          ),
                          child: Center(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width*0.9,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.42,
                                    child: Text(
                                      'Metode Pembayaran',
                                      style: TextStyle(
                                          fontSize: 16, fontWeight: FontWeight.w600,
                                          color: colorRed
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.1,
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.help_outline, size: 18, color: colorRed)
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.38,
                                    child: Text(
                                      'Tunai',
                                      style: TextStyle(
                                          fontSize: 14, fontWeight: FontWeight.w200),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        verticalSpaceMedium,
                        Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          child: Row(
                            children: [
                              Icon(Icons.check_circle, color: Colors.green, size: 35,),
                              horizontalSpaceSmall,
                              Text('Transaksi Berhasil',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
        ),
      ),
    ));
  }
}