import 'package:flutter/material.dart';
import 'package:regwalls/widget/widget.dart';

class Search extends StatefulWidget {
  late final String? searchQuery;
  Search({this.searchQuery});


  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  TextEditingController searchController = new TextEditingController();


  @override

  void initState() {
    super.initState();
  }

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
            Container(
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
                          child: const Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
