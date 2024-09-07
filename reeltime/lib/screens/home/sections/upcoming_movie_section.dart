import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reeltime/common/utils.dart';
import 'package:reeltime/models/upcoming_movie_model.dart';
import 'package:reeltime/screens/movie_detail/movie_detail.dart';
import 'package:reeltime/widgets/card_shimmer.dart';
import 'package:reeltime/widgets/movie_card.dart';

import '../../../models/result_model.dart';

class MovieSection extends StatelessWidget {
  
  final Future<dynamic> future;
  const MovieSection({super.key,  required this.future});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        

        // future builder
        FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                height: 220.h,
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
                height: 220.h,
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
            
            
            
            
            else {
              var data = snapshot.data!.results;
              return SizedBox(
                height: 220.h,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    Result movieResults = Result(
                      adult: data[index].adult ?? false,
                      backdropPath: data[index].backdropPath ?? "",
                      genreIds: data[index].genreIds ?? [],
                      id: data[index].id ?? 0,
                      originalLanguage: data[index].originalLanguage ?? "",
                      originalTitle: data[index].originalTitle ?? "",
                      overview: data[index].overview ?? "",
                      popularity: data[index].popularity ?? 0,
                      posterPath: data[index].posterPath ?? "",
                      releaseDate: data[index].releaseDate ?? "",
                      title: data[index].title ?? "",
                      video: data[index].video ?? "",
                      voteAverage: data[index].voteAverage ?? 0,
                      voteCount: data[index].voteCount ?? 0,
                    );

                    return MovieCard(
                      data: data,
                      index: index,
                      tagSuffix: "upcoming",
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MovieDetailScreen(movieData: movieResults, tagSuffix: 'upcoming',),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
