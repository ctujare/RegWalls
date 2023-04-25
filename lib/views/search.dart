import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:regwalls/data/data.dart';
import 'package:regwalls/model/wallpaper_mode.dart';
import 'package:regwalls/widget/widget.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  final String searchQuery;
  Search({required this.searchQuery});


  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  List<WallpaperModel> wallpapers = [];


  TextEditingController searchController = new TextEditingController();


  getSearchWallpapers(String query) async {
    var response = await http.get(
      Uri.parse('https://api.pexels.com/v1/search?query=$query&per_page=15&page=1'),
      headers: {"Authorization": apiKey},
    );

    print(response.body.toString());

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      print(element);
      WallpaperModel wallpaperModel = WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });

    setState(() {
    });
  }


  @override

  void initState() {
    getSearchWallpapers(widget.searchQuery);
    super.initState();
    searchController.text = widget.searchQuery;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: brandName(),
          elevation: 0.0
      ),
      body: Container(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xffE9E9E9),
                    borderRadius: BorderRadius.circular(15)),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              getSearchWallpapers(searchController.text);
                            },
                            child: Container(child: const Icon(Icons.search)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            wallpapersList(wallpapers: wallpapers, context: context),
          ],
        ),
      ),
    );
  }
}


