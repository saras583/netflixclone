import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

   final searchEditingController = TextEditingController();

   
@override
  void dispose() {
    searchEditingController.dispose();
    super.dispose();
  }
   

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const Align(
  alignment: Alignment.centerLeft,
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Text(
      'Search',
      style: TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),Padding(
  padding:  EdgeInsets.symmetric(horizontal: 16),
  child: TextField(controller: searchEditingController,
    style:  TextStyle(
      color: Colors.white,
    ),
    decoration: InputDecoration(
      hintText: 'Search movies and shows',
      hintStyle: const TextStyle(
        color: Colors.grey,
      ),
      prefixIcon: const Icon(
        Icons.search,
        color: Colors.grey,
      ),
      filled: true,
      fillColor: Colors.grey.shade900,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    ),
  ),
),
          ],
        ),
      ),
    );
  }
}