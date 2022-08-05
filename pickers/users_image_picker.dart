import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class UserImagePicker extends StatefulWidget {
  UserImagePicker(this.imagePickFn);

  final Function(File pickedImage) imagePickFn;

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {

  File _pickedImage = File('');
  void _pickImage() async {
  final XFile? pickedImageFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 150,
  );

  setState(() {
    _pickedImage = pickedImageFile as File;
  });
  widget.imagePickFn(_pickedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children:[
      CircleAvatar(
        radius: 40,
        backgroundImage: _pickedImage != null ? FileImage(_pickedImage) : null,
      ),
      FlatButton.icon(
        textColor: Theme.of(context).primaryColor,
        onPressed: _pickImage,
        icon: Icon(Icons.image),
        label: Text('Add Image'),
      ),
    ]);
  }
}
