import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:reeltime/common/utils.dart';
import 'package:reeltime/models/result_model.dart';
import 'package:reeltime/models/search_model.dart';
import 'package:reeltime/provider/app_notifier.dart';
import 'package:reeltime/screens/movie_detail/movie_detail.dart';
import 'package:reeltime/services/api_services.dart';
import 'package:reeltime/widgets/card_shimmer.dart';
import 'package:reeltime/widgets/movie_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  TextEditingController searchController = TextEditingController();
  ApiService apiService = ApiService();



  
  
  
  
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }


  



  
  
  @override
  Widget build(BuildContext context) {
  var appNotifier = Provider.of<AppNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/logo.png", width: 100,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
        
            SizedBox(
              height: 50,
              child: Consumer<AppNotifier>(
                builder: (context, provalue, child) {
                  return TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search here"
                ),
                controller: searchController,
                onChanged: (value) {
                  if (value.isEmpty) {
                    
                  } else {
                    provalue.search(value);
                  }
                },
              );
                },
              )
            ),
        
        
            appNotifier.getSearchModel == null?
        
            TopMoviesSection(title: "TOP SEARCHES", future: apiService.getUpcomingMovies(),):
        
        
        
        
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: appNotifier.getSearchModel!.results.length,
                itemBuilder: (context, index) {
                      
                  var data =  appNotifier.getSearchModel!.results;
                      
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
                        voteCount: data[index].voteCount);
                      
                      
                  return ListTile(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailScreen(movieData: movieResults),)),
                    leading: CircleAvatar( backgroundImage:   NetworkImage("${imgUrl}${appNotifier.getSearchModel!.results[index].posterPath}")),
                    title: Text(appNotifier.getSearchModel!.results[index].title),
                      
                  );
                },
              ),
            )
        
          ],
        ),
      ),


    
    );
  }
}













class TopMoviesSection extends StatelessWidget {
  final String title;
  final Future<dynamic> future;
  const TopMoviesSection({super.key, required this.title, required this.future});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8).r,
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
              color: Colors.white,
            ),
          ),
        ),

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
                  scrollDirection: Axis.vertical,
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
                height: 200.h,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
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
                      voteCount: data[index].voteCount,
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
