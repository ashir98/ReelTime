import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:reeltime/app.dart';
import 'package:reeltime/common/utils.dart';
import 'package:reeltime/services/api_services.dart';
import 'package:reeltime/widgets/card_shimmer.dart';
import 'package:reeltime/widgets/text/heading.dart';
import 'package:reeltime/widgets/text/sub_heading.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../models/movie_cast_model.dart';

class CastSection extends StatelessWidget {
  CastSection({super.key, required this.movieId});
  int movieId;
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiService.getMovieCast(movieId), 
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SizedBox(
                height: 180.h,
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
        } else {
          List<Cast> movieCastList = snapshot.data!.cast.where( (cast)=>cast.knownForDepartment=="Acting").toList();
          return SizedBox(
            height: 140.h,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: movieCastList.length,
              itemBuilder: (context, index) {
                var data = movieCastList[index];
                return SizedBox(
                  height:115.h,
                  width: 100.w,
                  child: Column(
                    children: [
                      Expanded(
                        child: Card(
                          color: Colors.grey.shade800,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: FadeInImage.memoryNetwork(
                            imageErrorBuilder: (context, error, stackTrace) {
                              return Center(
                                child: Icon(Icons.error),
                              );
                            },
                            placeholder: kTransparentImage,
                            image: "$imgUrl${data.profilePath}",
                            
                            fit: BoxFit.fill,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SizedBox(
                          width: double.infinity ,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              HeadingText(data.name,fontSize: 12, ),
                              SubHeadingText(data.character, fontSize: 11, textOverflow: TextOverflow.ellipsis  ,)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            
            ),
          );
        }
      },
    );
  }
}