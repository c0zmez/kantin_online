import 'package:flutter/material.dart';
import 'package:kantin_online/constants/colors.dart';

class WidgetTextField extends StatelessWidget {
  final String? labelText;
  final String? placeHolder;


  const WidgetTextField(
      {Key? key,
        required this.labelText,
        required this.placeHolder
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: Column(
          children: [
            Container(
              child: ListTile(
                minVerticalPadding: 0,
                title: Text('$labelText', style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),),
                subtitle: Text('$placeHolder', style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12),),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.9,
              height: 1,
              child: Divider(
                thickness: 1,
                color: Colors.black,
              ),
            )
          ],
        ),
    );
  }
}
