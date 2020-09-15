import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;


class ImageInput extends StatefulWidget {
  final Function onSelectImage;

  ImageInput(this.onSelectImage);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File storedImage;

  Future<void> takePicture() async {
    final picker = ImagePicker();
  final imageFile = await picker.getImage(source: ImageSource.camera, maxWidth: 600);
  setState(() {
    storedImage = File(imageFile.path);
  });
  final appDir = await syspaths.getApplicationDocumentsDirectory();
  final fileName = path.basename(imageFile.path);
  final savedImage = await File(imageFile.path).copy('${appDir.path}/$fileName');
  widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 140,
          height: 100,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          child: storedImage != null
              ? Image.file(
                  storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text(
                  "No Image Taken",
                  textAlign: TextAlign.center,
                ),
          alignment: Alignment.center,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: FlatButton.icon(
          icon: Icon(Icons.camera),
          label: Text('Take Picture'),
          textColor: Theme.of(context).primaryColor,
          onPressed: takePicture,
        ))
      ],
    );
  }
}
