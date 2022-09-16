import 'package:flutter/material.dart';

typedef OnCancel = void Function();
typedef OnConfirm = void Function();

void Function() onDialog(
  BuildContext context, {
  required String title,
  String? describe,
  String cancelText = 'Cancel',
  String confirmText = 'Ok',
  OnCancel? onCancel,
  OnConfirm? onConfirm,
}) {
  const radius = Radius.circular(10);
  final Color borderColor = Colors.grey[500]!;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      const margin = 20;
      return Center(
        child: Container(
          width: MediaQuery.of(context).size.width - margin * 2,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(radius),
            color: Colors.white,
          ),
          height: 150,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 18)),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    if (describe != null) Text(describe),
                  ],
                ),
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: borderColor),
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
                              child: Text(cancelText),
                            ),
                          ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            Navigator.pop(context);
                            if (onConfirm != null) onConfirm();
                            return;
                          },
                          child: Container(
                            width: width,
                            decoration: BoxDecoration(
                              border: Border(left: BorderSide(width: 1, color: borderColor)),
                            ),
                            height: constraints.maxHeight,
                            child: Center(
                              child: Text(confirmText),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
  return () => Navigator.pop(context);
}
