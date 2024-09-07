import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:reeltime/app.dart';
import 'package:reeltime/models/detail_model.dart';
import 'package:reeltime/services/api_services.dart';

class AboutSection extends StatelessWidget {
  AboutSection({super.key, required this.movieId});

  int movieId;
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0).r,
      child: FutureBuilder(
        future: apiService.getMovieDetail(movieId),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SizedBox(
              height: 200,
            );
          } else {
            MovieDetailModel? movieData =  snapshot.data;
            String genres = movieData!.genres.map((genre) => genre.name.toString()).join(', ');
            String language = movieData.spokenLanguages.map((language) => language.name, ).toString();
            String country = movieData.originCountry.map((country) =>country , ).toString();
            String year = DateFormat('yyyy').format(movieData.releaseDate);

            return Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Genre", style: TextStyle(color: Colors.grey),),
                   Text(genres ),
                
                
                
                    20.verticalSpace,
                    Text("Year" ,style: TextStyle(color: Colors.grey),),
                    Text(year),
          
                  ],
                )
              ),
              10.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Language", style: TextStyle(color: Colors.grey),),
                    Text(language),
                
                
                
                    20.verticalSpace,
                    Text("Country", style: TextStyle(color: Colors.grey),),
                    Text(country),
          
                  ],
                )
              ),
            ],
          );
          }
        }
      ),
    );
  }
}