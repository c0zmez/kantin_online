 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kantin_online/constants/colors.dart';
import 'package:kantin_online/ui/shared/ui_helper.dart';
import 'package:kantin_online/ui/views/navbars/histories/history_detail_view.dart';
import 'package:kantin_online/ui/widgets/cardwidgets/history_card.dart';
import 'package:kantin_online/viewmodels/history_view_model.dart';
import 'package:stacked/stacked.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  _HistoryViewState createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HistoryViewModel>.reactive(
        viewModelBuilder: () => HistoryViewModel(),
    builder: (context, model, child) => Scaffold(
      appBar: AppBar(
        elevation: 2,
        toolbarHeight: MediaQuery.of(context).size.height*0.1,
        backgroundColor: colorRed,
        title: Container(
          padding: const EdgeInsets.only(),
          child: const Text(
            'Riwayat',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, fontFamily: 'Poppins'),
          ),
        ),
      ),
      body: SafeArea(
          child: Center(
            child: ListView(
              children: [
                verticalSpaceSmall,
                HistoryCard(
                  onTapFunction: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryDetailView()));
                  },
                    cash: '60.000',
                    price: '54.000',
                    date: '1 Jan 2022 - 07.00'
                ),
                HistoryCard(
                    onTapFunction: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryDetailView()));
                    },
                    cash: '60.000',
                    price: '54.000',
                    date: '1 Jan 2022 - 07.00'
                ),
              ],
            ),
          )
      ),
    ));
  }
}
