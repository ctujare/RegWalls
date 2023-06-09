import 'package:flutter/material.dart';
import 'package:regwalls/model/wallpaper_mode.dart';
import 'package:regwalls/views/image_view.dart';

Widget brandName() {
  return Center(
    child: RichText(
      text: const TextSpan(
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        children: <TextSpan>[
          TextSpan(text: 'Reg', style: TextStyle(color: Colors.white)),
          TextSpan(text: 'Walls', style: TextStyle(color: Colors.grey)),
        ],
      ),
    ),
  );
}

Widget wallpapersList({required List<WallpaperModel> wallpapers, context}) {
  return Expanded(
    child: Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: GridView.count(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: wallpapers.map((wallpaper) {
          return GridTile(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ImageView(
                            imgUrl: wallpaper.src!.portrait,
                            originalUrl: wallpaper.src!.original)));
              },
              child: Hero(
                tag: wallpaper.src!.portrait,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.network(
                    wallpaper.src!.portrait,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    ),
  );
}
