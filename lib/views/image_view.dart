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
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black
                    ),
                  child: Column(children: [
                   Text('Download'),
                  ],),
                ),
                Text('Cancel', style: TextStyle(color: Colors.white),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
