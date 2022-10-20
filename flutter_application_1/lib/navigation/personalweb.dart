import 'dart:async';
import 'dart:async';
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/launch_manager.dart/launch.dart';

import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

import 'dart:io';
import 'package:logger/logger.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class MyPortfolio extends StatefulWidget {
  const MyPortfolio({Key? key}) : super(key: key);

  @override
  State<MyPortfolio> createState() => _MyPortfolioState();
}

class _MyPortfolioState extends State<MyPortfolio> with LaunchMixinWeb {
  String _filePath = "";
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
    final _PdfResponse = await http.get(Uri.parse("https://bit.ly/3TuowbW"));

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
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          decoration: ProjeUtility.boxDecoration,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedItems.twenty1,
                CircleAvatar(
                  radius: 100,
                  child: Image.asset('assets/gulay.png'),
                ),
                //SizedBox(height: 20),
                SizedItems.twenty5,
                Text(TextString().name, style: ProjectTextStyle.name),
                SizedItems.twenty3,
                Text(TextString().mobil, style: ProjectTextStyle.mobil),
                SizedItems.twenty25,
                Text(TextString().con, style: ProjectTextStyle.connect),
                SizedItems.twenty25,
                Container(
                  padding: EdgeInsets.all(50),
                  child: Row(
                    children: [
                      _LinTextButton(),
                      _GiTextButton(),
                      _MediumTextButton(),
                      TextButton(
                        onPressed: () async {
                          final _openFile = await OpenFile.open(_filePath,
                              type: "plain/text");
                          Logger().i(_openFile);
                        },
                        child: const Icon(Icons.picture_as_pdf),
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  TextButton _MediumTextButton() {
    return TextButton(
        onPressed: () {
          launchURL(ProjectUrl().me);
        },
        child: Image.asset(
          'assets/Icons/medium.png',
          height: 50,
          color: ColorsItems.fixColor,
        ));
  }

  TextButton _GiTextButton() {
    return TextButton(
        //github
        onPressed: () {
          launchURL(ProjectUrl().gi);
          //Uri.parse('https://github.com/GulayAdgzl');
        },
        child: Image.asset(
          'assets/Icons/gi.png',
          height: 50,
          color: ColorsItems.fixColor,
        ));
  }

  TextButton _LinTextButton() {
    return TextButton(
        onPressed: () {
          launchURL(ProjectUrl().lin);
        },
        child: Image.asset(
          'assets/Icons/lin.png',
          height: 50,
          color: ColorsItems.fixColor,
        ));
  }
}

class ColorsItems {
  static const Color LinearG1 = Color.fromARGB(15, 210, 150, 182);
  static const Color LinearG2 = Color.fromARGB(255, 79, 117, 212);
  static const Color fixColor = Colors.white;
}

class SizedItems {
  static const twenty5 = SizedBox(height: 25);

  static const twenty1 = SizedBox(height: 100);
  static const twenty3 = SizedBox(height: 30);
  static const twenty25 = SizedBox(height: 25);
}

class ProjeUtility {
  static BoxDecoration boxDecoration = const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        ColorsItems.LinearG1,
        ColorsItems.LinearG2,
      ],
    ),
  );
}

class ProjectTextStyle {
  static const name = TextStyle(
      fontSize: 25, color: ColorsItems.fixColor, fontWeight: FontWeight.w900);
  static const mobil = TextStyle(
      fontSize: 15, color: ColorsItems.fixColor, fontWeight: FontWeight.w200);
  static const connect = TextStyle(
      fontStyle: FontStyle.italic, color: ColorsItems.fixColor, fontSize: 20);
}

class TextString {
  final String name = "Gülay ADIGÜZEL";
  final String mobil = "Mobile Developer 📱";
  final String con = 'Connect With Me';
}

class ProjectUrl {
  final String lin =
      'https://www.linkedin.com/in/g%C3%BClay-ad%C4%B1g%C3%BCzel/';
  final String gi = 'https://github.com/GulayAdgzl';
  final String me = 'https://medium.com/@glyadgzl';
}
