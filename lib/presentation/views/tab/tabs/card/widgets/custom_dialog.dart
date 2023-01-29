import 'package:flutter/material.dart';

void showDeleteDialog(BuildContext context, {required VoidCallback onDeleteTap}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Haqiqatan o'chirmoqchimisiz?"),
        actions: <Widget>[
          ElevatedButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ElevatedButton(
            child: Text('Delete'),
            onPressed: onDeleteTap,
          ),
        ],
      );
    },
  );
}
