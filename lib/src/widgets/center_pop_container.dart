import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void Function() popCenterContainer({
  required BuildContext context,
  double extentHeight = 0,
  String cancelText = 'Cancel',
  String confirmText = 'Ok',
  required List<Widget> children,
  void Function()? onCancel,
  bool Function()? onConfirm,
}) {
  const radius = Radius.circular(10);
  final Color borderColor = Colors.grey[500]!;
  final double extentNum = children.length - 2 > 0 ? children.length - 2 : 0;
  final double height = extentNum * 33.33 + extentHeight;
  final double padding = 10;

  final items = <Widget>[
    Container(
      padding: EdgeInsets.all(padding),
      height: 90 + height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (int index = 0; index < children.length; index++)
            Padding(
              padding: index + 1 != children.length
                  ? EdgeInsets.only(top: 10)
                  : EdgeInsets.zero,
              child: children[index],
            ),
        ],
      ),
    ),
    Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(width: 1, color: borderColor)),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth / 2;
          return Row(
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Navigator.pop(context);
                  if (onCancel != null) onCancel();
                  return;
                },
                child: SizedBox(
                  width: width,
                  height: constraints.maxHeight,
                  child: Center(
                    child: Text(
                      cancelText,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  if (onConfirm != null) {
                    final result = onConfirm();

                    if (result) Navigator.pop(context);
                  }
                  return;
                },
                child: Container(
                  width: width,
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(width: 1, color: borderColor),
                    ),
                  ),
                  height: constraints.maxHeight,
                  child: Center(
                    child: Text(
                      confirmText,
                      style: TextStyle(color: HexColor('#3B6AF7')),
                    ),
                  ),
                ),
              )
              //
            ],
          );
        },
      ),
    ),
  ];

  showDialog<bool>(
    context: context,
    builder: (context) {
      var width = MediaQuery.of(context).size.width;
      return AlertDialog(
        backgroundColor: Colors.white.withOpacity(0),
        contentPadding: EdgeInsets.all(0),
        alignment: Alignment.center,
        content: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(radius),
            color: HexColor('#F0F0F0'),
          ),
          height: 140 + height,
          width: width,
          child: Column(children: items),
        ),
      );
    },
  );
  return () => Navigator.pop(context);
}
