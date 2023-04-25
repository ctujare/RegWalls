import 'package:flutter/material.dart';


class ImageView extends StatefulWidget {
  final String imgUrl;
  ImageView({required this.imgUrl});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: widget.imgUrl,
            child: Container(
              height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  widget.imgUrl,
                  fit: BoxFit.cover,
            )),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width/2.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.white70
                    ),
                  child: Column(children: [
                   Text('Download'),
                  ],),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Cancel', style: TextStyle(color: Colors.white),),
                SizedBox(
                  height: 60,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
