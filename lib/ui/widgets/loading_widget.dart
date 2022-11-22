import 'package:flutter/material.dart';
import '../../common/strings_masseges.dart';
import '../theme.dart';

class LoadingWidget extends StatelessWidget {
  final isFirst;
  const LoadingWidget(this.isFirst, {super.key, });

  @override
  Widget build(BuildContext context) {
    double padLoad = MediaQuery.of(context).size.height * .3;
    return Container(
              height: 56,
              margin: EdgeInsets.only(top:0, bottom: isFirst? 0:padLoad),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const[
               //   Image.asset( "assets/images/indicator_medium.gif"),
               CircularProgressIndicator(color: ThemeConfig.colorButtons,)
                 // const Text(StrConst.strLoading, style: ThemeConfig.txtStyleLoading)
                ],
              ),
            );
  }

}