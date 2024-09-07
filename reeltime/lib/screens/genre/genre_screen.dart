import 'package:flutter/material.dart';

class GenreScreen extends StatelessWidget {
  const GenreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/logo.png", width: 100,),
      ),
      body: Scaffold(
        body: ListView.builder(
          
          itemBuilder: (context, index) {
            return SizedBox(
              height: 60,
              child: Card(
                color: Colors.grey.shade800,
              ),
            );
          },
          
        ),
      ),
    );
  }
}



class GenreModel{
  String title;
  String imgUrl;

  GenreModel({
    required this.imgUrl,
    required this.title
  });
}