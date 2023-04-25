import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  late final String? searchQuery;
  Search({this.searchQuery});


  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override

  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
