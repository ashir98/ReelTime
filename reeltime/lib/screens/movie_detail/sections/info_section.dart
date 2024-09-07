import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:reeltime/common/utils.dart';
import 'package:reeltime/models/result_model.dart';
import 'package:reeltime/services/api_services.dart';
import 'package:shimmer/shimmer.dart';

class MovieInfoSection extends StatelessWidget {
  const MovieInfoSection({
    super.key,
    required this.apiService,
    required this.movieData,
  });

  final ApiService apiService;
  final Result movieData;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiService.getMovieDetail(movieData.id),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[900]!,
            highlightColor: Colors.grey[700]!,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 150.w,
                  height: 12.h,
                ),
                5.verticalSpace,
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 70.w,
                  height: 12.h,
                ),
                5.verticalSpace,
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 50.w,
                  height: 12.h,
                ),
                5.verticalSpace,
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 100.w,
                  height: 12.h,
                ),
              ],
            ),
          );
        } else {
          var data = snapshot.data;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data!.title,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2, // Limit the title to 2 lines
                overflow: TextOverflow.ellipsis, // Truncate the text with '...'
                
              ),
              2.verticalSpace,
              Text(
                showYearAndGenre(data.releaseDate, data.genres),
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.grey,
                ),
              ),
              2.verticalSpace,
              Text(
                convertMinutesToHoursAndMinutes(data.runtime),
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.grey,
                ),
              ),
              2.verticalSpace,
              RatingBar.builder(
                itemPadding: EdgeInsets.all(0),
                itemSize: 18.sp,
                initialRating: data.voteAverage / 2,
                maxRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Icon(
                    EvaIcons.star,
                    color: Colors.amber,
                  );
                },
                onRatingUpdate: (value) {},
              ),
            ],
          );
        }
      },
    );
  }
}
