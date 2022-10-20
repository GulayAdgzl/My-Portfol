import 'dart:io';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class FileDownload extends StatefulWidget {
  const FileDownload({Key? key}) : super(key: key);

  @override
  State<FileDownload> createState() => _FileDownloadState();
}

class _FileDownloadState extends State<FileDownload> {
  String _filePath = "";
  String url = "https://www.africau.edu/images/default/sample.pdf";
  Future<String> get _localDevicePath async {
    final _devicePath = await getApplicationDocumentsDirectory();
    return _devicePath.path;
  }

  Future<File> get _localFile async {
    String _path = await _localDevicePath;

    var _newPath = await Directory("$_path/gulay").create();
    return File("$_localDevicePath/GulayADIGUZEL.pdf");
  }

  //Pdf görntüleyecek-download yapacak
  Future _downloadPdf() async {
    final _PdfResponse = await http.get(Uri.parse(url));

    if (_PdfResponse.statusCode == 200) {
      final _file = await _localFile;
      final _saveFile = await _file.writeAsBytes(_PdfResponse.bodyBytes);

      Logger().i("Success ,File write completed ${_saveFile.path}");
      setState(() {
        _filePath = _saveFile.path;
      });
    } else {
      Logger().e(_PdfResponse.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          /* TextButton(
            onPressed: () {
              _downloadPdf();
            },
            child: Icon(Icons.file_download),
          ),
          Text(_filePath),*/
          TextButton(
            onPressed: () async {
              final _openFile = await OpenFile.open(_filePath);
              Logger().i(_openFile);
            },
            child: Icon(Icons.file_open),
          ),
        ],
      ),
    );
  }
}
