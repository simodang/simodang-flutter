import 'dart:io';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as path;

import 'package:firebase_storage/firebase_storage.dart';
import 'package:simodang_flutter/config/firebase_constants.dart';

class FirebaseUpload {
  Future<String> uploadImage(String imageUrl) async {
    File image = File(imageUrl);
    String ext = path.extension(image.path);
    String filename = DateTime.now().millisecondsSinceEpoch.toString();

    final ref = FirebaseStorage
        .instance
        .ref()
        .child("${FirebaseConstants().uploadDir}/$filename$ext");

    await ref.putFile(image, SettableMetadata(contentType: lookupMimeType(image.path)));
    final url = await ref.getDownloadURL();
    return url;
  }
}
