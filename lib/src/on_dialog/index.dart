import 'package:flutter/material.dart';

import '../widgets/center_pop_container.dart';

typedef OnCancel = void Function();
typedef OnConfirm = void Function();

void Function() onDialog({
  required BuildContext context,
  required String title,
  String? describe,
  String cancelText = 'Cancel',
  String confirmText = 'Ok',
  OnCancel? onCancel,
  OnConfirm? onConfirm,
}) {
  return popCenterContainer(
    context: context,
    onConfirm: () {
      if (onConfirm != null) onConfirm();
      return true;
    },
    onCancel: onCancel,
    cancelText: cancelText,
    confirmText: confirmText,
    children: [
      Text(title, style: const TextStyle(fontSize: 18)),
      if (describe != null) Text(describe),
    ],
  );
}
