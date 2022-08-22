import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class getimageCard extends StatelessWidget {
  const getimageCard({
    Key? key,
    required this.imageFile,
  }) : super(key: key);

  final PickedFile? imageFile;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: (imageFile == null)
          ? Text("Choose Image")
          : Image.file(
              File(imageFile!.path), height: 100,
              //width: 100,
            ),
    );
  }
}
