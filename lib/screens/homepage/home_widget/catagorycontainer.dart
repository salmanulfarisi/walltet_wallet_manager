import 'package:flutter/material.dart';
import 'package:walletx/global_things/globelresources.dart';
import 'package:walletx/global_things/text.dart';

ValueNotifier<String> categoryNotifier = ValueNotifier('category');

class CatagoryContainer extends StatefulWidget {
  final double? containerHeight;
  final Color? containerColor;
  const CatagoryContainer({Key? key, this.containerHeight, this.containerColor})
      : super(key: key);

  @override
  State<CatagoryContainer> createState() => _CatagoryContainerState();
}

class _CatagoryContainerState extends State<CatagoryContainer> {
  String initCategory = 'Category';
  // @override
  // void initState() {
  //   initCategory = 'Category';
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      alignment: Alignment.center,
      width: width,
      height: widget.containerHeight,
      color: widget.containerColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ValueListenableBuilder(
            valueListenable: categoryNotifier,
            builder: (BuildContext context, String newvalue, Widget? _) {
              initCategory = newvalue;
              return TextWidgets(
                textcolor: primaryTextColor,
                textFontWeight: FontWeight.bold,
                textsize: 30,
                text: initCategory,
              );
            },
          )
        ],
      ),
    );
  }
}
