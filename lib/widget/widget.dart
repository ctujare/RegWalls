import 'package:flutter/material.dart';
import 'package:regwalls/model/wallpaper_mode.dart';

Widget brandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Text(
        'Reg',
        style: TextStyle(color: Colors.black),
      ),
      Text(
        'Walls',
        style: TextStyle(color: Colors.black45),
      )
    ],
  );
}

Widget wallpapersList({required List<WallpaperModel> wallpapers, context}) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: wallpapers.map((wallpaper) {
          return GridTile(
            child: Image.network(wallpaper.src!.portrait),
          );
        }).toList(),
      ),
    ),
  );
}
