import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reeltime/common/colors.dart';
import 'package:reeltime/models/upcoming_movie_model.dart';
import 'package:reeltime/screens/movie_detail/movie_detail.dart';
import 'package:reeltime/services/api_services.dart';
import 'package:reeltime/widgets/card_shimmer.dart';
import 'package:reeltime/widgets/movie_card.dart';

import '../../../models/result_model.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: SizedBox(
        height: 230.h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TabBar(
              tabAlignment: TabAlignment.start,
              labelPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10).r,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              labelColor: AppColors.primaryColor,
              indicatorColor: AppColors.primaryColor,
              isScrollable: true,
              tabs: const [
                Text("Action & Adventure"),
                Text("Sci-Fi"),
                Text("Comedy"),
                Text("Animated"),
                Text("Horror"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  TabSection(genre: 28),
                  TabSection(genre: 878),
                  TabSection(genre: 35),
                  TabSection(genre: 878),
                  TabSection(genre: 36),
                  
              
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}






class TabSection extends StatelessWidget {
  final int genre;
  
  const TabSection({super.key , required this.genre});

  @override
  Widget build(BuildContext context) {
    ApiService apiService = ApiService();
    return FutureBuilder(
      future: apiService.getMoviesByGenre(genre), 
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                height: 230.h,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 3, // Show 3 shimmer cards
                  itemBuilder: (context, index) {
                    return ShimmerMovieCard();
                  },
                ),
              );
            } 
    
        else if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                height: 230.h,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 3, // Show 3 shimmer cards
                  itemBuilder: (context, index) {
                    return ShimmerMovieCard();
                  },
                ),
              );
            } 
        else{
    
          var data = snapshot.data!.results;
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) {

              Result movieResults = Result(
                adult: data[index].adult, 
                backdropPath: data[index].backdropPath, 
                genreIds: data[index].genreIds, 
                id: data[index].id, 
                originalLanguage: data[index].originalLanguage, 
                originalTitle: data[index].originalTitle, 
                overview: data[index].overview, 
                popularity: data[index].popularity, 
                posterPath: data[index].posterPath, 
                releaseDate: data[index].releaseDate, 
                title: data[index].title, 
                video: data[index].video, 
                voteAverage: data[index].voteAverage, 
                voteCount: data[index].voteCount
              );



              return MovieCard(
                data: data, 
                index: index, 
                tagSuffix: "category",
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailScreen(movieData: movieResults, tagSuffix: 'category',),)),
              );
            },
          
          );
        }
      },
    );
  }
}
