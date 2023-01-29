import 'package:flutter/material.dart';

void showDeleteDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Are you sure?'),
        content: Text('This item will be permanently deleted.'),
        actions: <Widget>[
          ElevatedButton(
            
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ElevatedButton(
            child: Text('Delete'),
            onPressed: () {
              // Perform delete action here
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
