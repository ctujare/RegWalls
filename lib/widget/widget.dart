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
      margin: EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: GridView.count(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: wallpapers.map((wallpaper) {
          return GridTile(
            child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.network(
                    wallpaper.src!.portrait,
                    fit: BoxFit.cover,),
                )),
          );
        }).toList(),
      ),
    ),
  );
}
