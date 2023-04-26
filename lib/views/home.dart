import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:regwalls/data/data.dart';
import 'package:regwalls/model/categories_model.dart';
import 'package:regwalls/model/wallpaper_mode.dart';
import 'package:regwalls/views/category.dart';
import 'package:regwalls/views/image_view.dart';
import 'package:regwalls/views/search.dart';
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
  TextEditingController searchController = new TextEditingController();
  int currentPage = 1;
  bool isLoading = false;

  Future<void> getTrendingWallpapers() async {
    if (isLoading) {
      return;
    }
    setState(() {
      isLoading = true;
    });

    var response = await http.get(
      Uri.parse('https://api.pexels.com/v1/curated?per_page=100&page=$currentPage'),
      headers: {"Authorization": apiKey},
    );

    setState(() {
      isLoading = false;
    });

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    List<WallpaperModel> newWallpapers = [];
    jsonData["photos"].forEach((element) {
      WallpaperModel wallpaperModel = WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      newWallpapers.add(wallpaperModel);
    });

    setState(() {
      wallpapers.addAll(newWallpapers);
      currentPage += 1;
    });
  }

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getTrendingWallpapers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: brandName(),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)),
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
                      hintStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          print("Search ${searchController.text}");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Search(
                                searchQuery: searchController.text,
                              ),
                            ),
                          );
                        },
                        child: const Icon(Icons.search, color: Colors.black,),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: categories.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoryTile(
                    title: categories[index].categorieName,
                  );
                }),
          ),
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (!isLoading &&
                    scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                  getTrendingWallpapers();
                }
                return true;
              },
              child: wallpapersList(wallpapers: wallpapers, context: context),
            ),
          ),
          if (isLoading) const LinearProgressIndicator(),
        ],
      ),
    );
  }
}


class CategoryTile extends StatelessWidget {
  final String title;
  const CategoryTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => Category(
            categoryName: title.toLowerCase()
          )
        ));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white24,
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
      ),
    );
  }
}
