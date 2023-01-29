import 'package:flutter/material.dart';
import 'package:flutter_contest/presentation/utils/constants/color_const.dart';

void showDeleteDialog(BuildContext context,
    {required VoidCallback onDeleteTap}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: ColorConst.white,
        title: const Text("Haqiqatan o'chirmoqchimisiz?"),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ElevatedButton(
            onPressed: onDeleteTap,
            child: const Text('Delete'),
          ),
        ],
      );
    },
  );
}
