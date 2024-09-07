
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:reeltime/common/colors.dart';
import 'package:reeltime/common/utils.dart';
import 'package:transparent_image/transparent_image.dart';


class MovieCard extends StatelessWidget {
  MovieCard({
    super.key,
    required this.data,
    required this.index,
    required this.tagSuffix,
    this.onTap

  });

  List<dynamic> data;
  int index;
  String tagSuffix;
  VoidCallback? onTap;




  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 130.w,
        height: 250.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Card(
                  color: Colors.grey.shade900,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.all(10),
                  child: Hero(
                    flightShuttleBuilder: (flightContext, animation,flightDirection, fromHeroContext, toHeroContext) {
                          // Disable reverse animation by showing the widget in its original state
                          if (flightDirection == HeroFlightDirection.pop) {
                            return fromHeroContext.widget; // Return the original widget without animation
                          } else {
                            return toHeroContext.widget; // Use normal animation for push
                          }
                        },
                    tag: "${data[index].id}-$tagSuffix",
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: "${imgUrl}${data[index].posterPath}",
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: double.infinity,
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Icon(
                            BoxIcons.bxs_image_alt,
                            color: AppColors.primaryColor,
                          ),
                        );
                      },
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data[index].title, style: TextStyle(color: Colors.white),overflow: TextOverflow.ellipsis,),
                  Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/imdb.png',
                  width: 25,
                ),
                5.horizontalSpace,
                Text(
                  data[index].voteAverage.toStringAsFixed(1),
                  style: TextStyle(color: Colors.white),
                )
              ],
            )
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}




