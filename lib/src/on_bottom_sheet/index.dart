import 'package:flutter/material.dart';

typedef OnTap = void Function(String key);

class BottomSheetItem {
  final String title;
  final Color? color;
  final String key;
  BottomSheetItem({required this.key, required this.title, this.color});
}

onBottomSheet({
  required BuildContext context,
  required List<BottomSheetItem> items,
  String title = 'Operation',
  OnTap? onTap,
  void Function()? onCancel,
}) {
  const radius = Radius.circular(10);
  double itemHeight = 50;
  double firstSectionHeight = itemHeight * (items.length + 1);
  double allHeight = 60 + firstSectionHeight;
  double gap = 10;
  double fontSize = 16;

  showModalBottomSheet<void>(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Container(
        margin: const EdgeInsets.all(10),
        height: allHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(radius),
                  color: Colors.white,
                ),
                height: firstSectionHeight,
                child: Column(
                  children: ListTile.divideTiles(context: context, tiles: [
                    SizedBox(
                      height: itemHeight,
                      child: Center(
                          child: Text(title,
                              style: TextStyle(fontSize: fontSize))),
                    ),
                    for (int index = 0; index < items.length; index++)
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          Navigator.pop(context);
                          if (onTap != null) onTap(items[index].key);
                        },
                        child: SizedBox(
                          height: itemHeight,
                          child: Center(
                            child: Text(items[index].title,
                                style: TextStyle(
                                    color: items[index].color ?? Colors.black,
                                    fontSize: fontSize)),
                          ),
                        ),
                      ),
                  ]).toList(),
                )),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(radius),
                color: Colors.white,
              ),
              height: allHeight - gap - firstSectionHeight,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Navigator.pop(context);
                  if (onCancel != null) onCancel();
                },
                child: SizedBox(
                  width: double.infinity,
                  child: Center(
                      child:
                          Text('Cancel', style: TextStyle(fontSize: fontSize))),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
