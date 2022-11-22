import 'package:flutter/material.dart';

import '../theme.dart';

class InfoPersonWidget extends StatelessWidget {
  final String title;
  final String? data;
  const InfoPersonWidget({super.key, required this.title, this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      padding: const EdgeInsets.only(bottom: 12, right:21),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("$title:", style: ThemeConfig.txtStyleTitDetailU,),
          Flexible(child: Text(data??"", style: ThemeConfig.txtStyleDetailU, overflow: TextOverflow.fade, softWrap: false,)),
        ],
      ),
    );
  }
}