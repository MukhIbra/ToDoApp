import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  var controller;
  VoidCallback onCancel;
  VoidCallback onSave;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onCancel,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue,
      content: Container(
        height: 130,
        width: 200,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //user inputs
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    hintText: 'Add New Task...',
                hintStyle: TextStyle(color: Colors.blue[200]),),
                controller: controller,
              ),

              //button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //cancel
                  MaterialButton(
                    color: Colors.blue[200],
                    child: Text('Cancel'),
                    onPressed: onCancel,
                  ),

                  //save
                  MaterialButton(
                      color: Colors.blue[200],
                      child: Text('Save'),
                      onPressed: onSave)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
