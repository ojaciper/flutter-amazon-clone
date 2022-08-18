import 'dart:io';
import 'package:another_flushbar/flushbar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void snackBar(BuildContext context, String text) {
  // ScaffoldMessenger.of(context).showSnackBar(
  //   SnackBar(
  //     content: Text(text),
  //   ),
  // );
  // Fluttertoast.showToast(msg: text);

  Flushbar(
    message: text,
    duration: const Duration(seconds: 4),
  ).show(context);
}

Future<List<File>> pickImages() async {
  List<File> images = [];
  try {
    var filesPickerResult = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if (filesPickerResult != null && filesPickerResult.files.isNotEmpty) {
      for (int i = 0; i < filesPickerResult.files.length; i++) {
        images.add(File(filesPickerResult.files[i].path!));
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return images;
}


// CarouselSlider(
//                         items: images.map(
//                           (i) {
//                             return Builder(
//                               builder: (BuildContext context) => Image.file(
//                                 i,
//                                 fit: BoxFit.cover,
//                                 height: 200,
//                               ),
//                             );
//                           },
//                         ).toList(),
//                         options: CarouselOptions(
//                           viewportFraction: 1,
//                           height: 200,
//                         ),
//                       )