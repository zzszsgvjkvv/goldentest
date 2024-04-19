import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class Imagepickerselect extends StatefulWidget {
  const Imagepickerselect({super.key, required this.onpicimage});
  final void Function (File picimagr) onpicimage;

  @override
  State<Imagepickerselect> createState() => _ImagepickerselectState();
}

class _ImagepickerselectState extends State<Imagepickerselect> {
  File? imageselect;
  void selectimage()async{
  final XFile? xFile= await ImagePicker().pickImage(source:ImageSource.gallery,
    maxHeight: 150,
    maxWidth: 150,
    imageQuality: 50,
    );
    if(xFile!=null){
      setState(() {
        imageselect=File(xFile.path);
      });
    widget.onpicimage(imageselect!);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      
      CircleAvatar(radius: 52,
      backgroundColor: Colors.grey,
      foregroundImage:imageselect==null?null:FileImage(imageselect!) ,
      
      ),
      TextButton.icon(onPressed: selectimage
        
        
      , icon: Icon(Icons.image),label: Text("picimage"),)
    ],);
  }
}