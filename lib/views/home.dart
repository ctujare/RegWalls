import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:regwalls/data/data.dart';
import 'package:regwalls/model/categories_model.dart';
import 'package:regwalls/model/wallpaper_mode.dart';
import 'package:regwalls/widget/widget.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoriesModel> categories = [];
  List<WallpaperModel> wallpapers = [];

  getTrendingWallpapers() async {
    var response = await http.get(
      Uri.parse('https://api.pexels.com/v1/curated?per_page=15&page=1'),
      headers: {"Authorization": apiKey},
    );

    //print(response.body.toString());

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      // print(element);
      WallpaperModel wallpaperModel = WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });

    setState(() {});
  }

  @override
  void initState() {
    getTrendingWallpapers();
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: brandName(),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: const Color(0xffE9E9E9),
                borderRadius: BorderRadius.circular(15)),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: const [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Search'),
                  ),
                ),
                Icon(Icons.search),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 60,
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: categories.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategorieTile(
                    title: categories[index].categorieName,
                    imgUrl: categories[index].imgUrl,
                  );
                }),
          ),
          wallpapersList(wallpapers: wallpapers, context: context)
        ],
      ),
    );
  }
}

class CategorieTile extends StatelessWidget {
  final String imgUrl, title;
  CategorieTile({super.key, required this.title, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Stack(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imgUrl,
                height: 50,
                width: 100,
                fit: BoxFit.cover,
              )),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black12,
            ),
            height: 50,
            width: 100,
            alignment: Alignment.center,
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
