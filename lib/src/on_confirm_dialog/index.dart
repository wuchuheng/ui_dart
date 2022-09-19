import 'package:flutter/material.dart';

import '../../wuchuheng_ui.dart';
import '../widgets/center_pop_container.dart';

void Function() onConfirmDialog({
  required BuildContext context,
  required String title,
  String? describe,
  String cancelText = 'Cancel',
  String initValue = '',
  String confirmText = 'Ok',
  OnCancel? onCancel,
  String? Function(String? value)? validator,
  void Function(String value)? onConfirm,
}) {
  TextEditingController controller = TextEditingController(text: initValue);
  final formKey = GlobalKey<FormState>();

  return popCenterContainer(
    context: context,
    confirmText: confirmText,
    cancelText: cancelText,
    onCancel: onCancel,
    onConfirm: () {
      if (onConfirm == null) return true;
      if (formKey.currentState!.validate()) {
        onConfirm(controller.value.text);
        return true;
      }
      return false;
    },
    extentHeight: 10,
    children: [
      Text(title, style: const TextStyle(fontSize: 18)),
      if (describe != null) Text(describe),
      Form(
        key: formKey,
        child: TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            isDense: true,
            contentPadding: const EdgeInsets.only(left: 6, top: 6, bottom: 6),
          ),
        ),
      ),
    ],
  );
}
