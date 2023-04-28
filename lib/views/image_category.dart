import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:regwalls/data/data.dart';
import 'package:regwalls/model/wallpaper_mode.dart';
import 'package:regwalls/widget/widget.dart';

class ImageCategory extends StatefulWidget {
  final String categoryName;
  const ImageCategory({super.key, required this.categoryName});

  @override
  State<ImageCategory> createState() => _ImageCategoryState();
}

class _ImageCategoryState extends State<ImageCategory> {
  List<WallpaperModel> wallpapers = [];

  getSearchWallpapers(String query) async {
    var response = await http.get(
      Uri.parse(
          'https://api.pexels.com/v1/search?query=$query&per_page=15&page=1'),
      headers: {"Authorization": apiKey},
    );

    if (kDebugMode) {
      print(response.body.toString());
    }

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      if (kDebugMode) {
        print(element);
      }
      WallpaperModel wallpaperModel = WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });

    setState(() {});
  }

  @override
  void initState() {
    getSearchWallpapers(widget.categoryName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: brandName(),
          elevation: 0.0),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xffE9E9E9),
                    borderRadius: BorderRadius.circular(15)),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                margin: const EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
            wallpapersList(wallpapers: wallpapers, context: context),
          ],
        ),
      ),
    );
  }
}
