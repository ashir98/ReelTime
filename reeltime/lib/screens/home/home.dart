import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reeltime/models/upcoming_movie_model.dart';
import 'package:reeltime/screens/home/sections/carousel_section.dart';
import 'package:reeltime/screens/home/sections/category_section.dart';
import 'package:reeltime/services/api_services.dart';
import 'package:reeltime/screens/home/sections/upcoming_movie_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late Future<MovieModel> upcomingMoviesData;
  late Future<MovieModel> nowPlayingMoviesData;
  ApiService apiService = ApiService();

  @override
  void initState() {
    upcomingMoviesData = apiService.getUpcomingMovies();
    nowPlayingMoviesData = apiService.getNowPlaying();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/logo.png", width: 100,),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            CarouselSection(future: nowPlayingMoviesData),
        
            CategorySection(),

            10.verticalSpace,
        
            
            
            15.verticalSpace,

     
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("UPCOMING MOVIES", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),),
            ),
            MovieSection(future: upcomingMoviesData)
          ],
        ),
      ),
    );
  }
}