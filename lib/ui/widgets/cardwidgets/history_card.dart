import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kantin_online/constants/colors.dart';
import 'package:kantin_online/ui/shared/ui_helper.dart';
import 'package:kantin_online/ui/views/transactions/check_view.dart';

class HistoryCard extends StatelessWidget {

  final String? cash;
  final String? price;
  final String? date;
  final Function()? onTapFunction;

  const HistoryCard({
    Key? key,
    required this.date,
    required this.price,
    required this.cash,
    required this.onTapFunction
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTapFunction!,
          child: Container(
            width: MediaQuery.of(context).size.width*1,
            padding: EdgeInsets.only(top: 10),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: colorGrey,
                  width: 2,
                ),
                bottom: BorderSide(
                  color: colorGrey,
                  width: 2,
                ),
              ),
            ),
            child: Column(
              children: <Widget>[
                Text(
                  'Pesanan Sedang Dikirim',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                verticalSpaceVeryTiny,
                Text(
                  'Tunai : Rp $cash',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                verticalSpaceVeryTiny,
                Text(
                  'Harga : Rp $price',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                verticalSpaceMedium,
                Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget> [
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.45,
                        child: Text(
                          'Status : Berhasil',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.45,
                        child: Text(
                          '$date',
                          style: TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: 12
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        verticalSpaceSmall,
      ],
    );
  }
}

