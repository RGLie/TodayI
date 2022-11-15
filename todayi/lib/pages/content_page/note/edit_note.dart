import 'package:flutter/material.dart';

class EditNote extends StatefulWidget {
  const EditNote({super.key});

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Note Editor',
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: Colors.black)),
        SizedBox(height: 15),
        Container(
          color: Colors.black12,
          width: double.infinity,
          height: 1,
        ),
        SizedBox(height: 15),
        Text('Add Contents',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.black)),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
